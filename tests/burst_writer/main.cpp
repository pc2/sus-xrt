#include "experimental/xrt_ip.h"
#include "experimental/xrt_uuid.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_xclbin.h"
#include "experimental/xrt_bo.h"
#include "experimental/xrt_error.h"
#include "ert.h"

#include <chrono>
#include <cstdint>
#include <memory>
#include <string>
#include <iomanip>
#include <vector>
#include <iostream>
#include <string>
#include <sstream>
#include <cstdint>
#include <fstream>
#include <algorithm>

#include <unistd.h>


struct AXIConfig {
    uint32_t arprot : 3;
    uint32_t arcache : 4;
    uint32_t arqos : 4;
    uint32_t arlock : 1;
    uint32_t arregion : 4;
    uint32_t max_in_flight: 16;
};

void printConfig(AXIConfig config) {
    std::cout << "Current AXIConfig:\n"
              << "  arprot        = " << config.arprot << "\n"
              << "  arcache       = " << config.arcache << "\n"
              << "  arqos         = " << config.arqos << "\n"
              << "  arlock        = " << config.arlock << "\n"
              << "  arregion      = " << config.arregion << "\n"
              << "  max_in_flight = " << config.max_in_flight << std::endl;
}

xrt::device device;
std::unique_ptr<xrt::uuid>   xclbin_handle_ptr;

uint64_t read_64_bit_reg(xrt::ip& user_manage, uint32_t idx) {
    uint32_t low = user_manage.read_register(idx);
    uint32_t high = user_manage.read_register(idx + 0x004);

    return (uint64_t(high) << 32) | low;
}

void printKernelRegs(const char* kernel_name) {
    xrt::ip user_manage = xrt::ip(device, *xclbin_handle_ptr, kernel_name);

    std::cout << "== " << kernel_name << " ==" << std::endl;
    std::cout << "ctrl: " << user_manage.read_register(0x000) << std::endl;
    std::cout << "Addr: " << read_64_bit_reg(user_manage, 0x010) << std::endl;
    std::cout << "Count: " << user_manage.read_register(0x018) << std::endl;
    std::cout << "Addr Offset: " << user_manage.read_register(0x01c) << std::endl;
    std::cout << "Num Repeats: " << user_manage.read_register(0x020) << std::endl;
    std::cout << "Repeats Offset: " << user_manage.read_register(0x024) << std::endl;
    std::cout << "Settings: " << user_manage.read_register(0x028) << std::endl;
    std::cout << "Cycles taken: " << user_manage.read_register(0x02c) << std::endl;
    std::cout << "Cycles since reset @start: " << read_64_bit_reg(user_manage, 0x030) << std::endl;
    std::cout << "Cycles since reset @end: " << read_64_bit_reg(user_manage, 0x038) << std::endl;
    std::cout << "Cycles going by reset?: " << read_64_bit_reg(user_manage, 0x038) - read_64_bit_reg(user_manage, 0x030) << std::endl;
    std::cout << "Result: " << user_manage.read_register(0x03c) << std::endl;
}

size_t BUFFER_CAPACITY = 200000000 / sizeof(uint32_t);

double clock_freq; // In Hz

struct KernelInfo {
    std::string name;
    int AXI_WIDTH;
    std::string typ;
    xrt::bo bo;
};

std::vector<KernelInfo> kernel_infos;

struct BenchmarkResult {
    double bandwidth;
    double time_in_seconds;
    double bytes_per_cycle;
    uint32_t num_cycles;
};

uint32_t* default_buffer;
uint32_t* host_side;
uint32_t* expected_buffer;
BenchmarkResult run_kernel(KernelInfo& info, uint32_t num_elems, uint32_t offset, uint32_t num_repeats, uint32_t experiment_offset, uint32_t config_u32) {
    xrt::bo& b = info.bo;
    std::cout << "Kernel " << info.name << std::endl;
    std::cout << "Write initial data for buffer " << BUFFER_CAPACITY << " elements." << std::endl;
    b.write(default_buffer, sizeof(uint32_t) * BUFFER_CAPACITY, 0);
    b.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    size_t total_data = uint64_t(num_elems) * num_repeats * sizeof(uint32_t);
    double time_in_seconds;
    {
        xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, info.name.c_str());
        std::cout << "Start Write " << num_elems << " from " << offset << " (x" << num_repeats << " repeats at offset " << experiment_offset << ")" << std::endl;
        auto start_time = std::chrono::high_resolution_clock::now();
        xrt::run r = k(b, num_elems, offset, num_repeats, experiment_offset, config_u32);
        r.wait();
        auto time_taken = std::chrono::high_resolution_clock::now() - start_time;
        std::cout << "Finished Kernel" << std::endl;
        time_in_seconds = time_taken.count() / 1000000000.0;
    }
    //printKernelRegs(chosen_kernel);
    //printKernelRegs(chosen_kernel);
    uint32_t num_cycles;
    {
        xrt::ip user_manage = xrt::ip(device, *xclbin_handle_ptr, info.name.c_str());
        num_cycles = user_manage.read_register(0x02c);
    }
    double bandwidth = total_data / 1000000000.0 / time_in_seconds; // GB/s
    double bytes_per_cycle = double(total_data) / num_cycles;
    std::cout << "    Time taken: " << time_in_seconds << "s\n";
    std::cout << "    BW: " << bandwidth << "GB/s" << "\n";
    std::cout << "    Cycles: " << num_cycles << "\n";
    std::cout << "    Bytes/cy: " << bytes_per_cycle << "\n";
    std::cout << "    @" << (clock_freq / 1000000) << "MHz" << std::endl;

    size_t offset_elem = offset / 4;
    b.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    b.read(host_side, sizeof(uint32_t) * BUFFER_CAPACITY, 0);
    for(size_t i = 0; i < BUFFER_CAPACITY; i++) {
        expected_buffer[i] = 0xDDDDDDDD;
    }
    uint32_t total = 0;
    for(int repeat_i = 0; repeat_i < num_repeats; repeat_i++) {
        for(int i = 0; i < num_elems; i++) {
            expected_buffer[experiment_offset / sizeof(uint32_t) * repeat_i + offset_elem + i] = total;
            total++;
        }
    }
    bool any_incorrect = false;
    for(int i = 0; i < BUFFER_CAPACITY; i++) {
        if(expected_buffer[i] != host_side[i]) {
            std::cout << "ERROR: [" << i << "]: expected = ";
            if(expected_buffer[i] == 0xDDDDDDDD) {
                std::cout << "UNSET";
            } else {
                std::cout << expected_buffer[i];
            }
            if(host_side[i] == 0xDDDDDDDD) {
                std::cout << "    found = " << "UNSET" << std::endl;
            } else {
                std::cout << "    found = " << host_side[i] << std::endl;
            }
            any_incorrect = true;
        }
    }
    if(any_incorrect) {
        std::cout << "\033[31mIncorrect elements in " << BUFFER_CAPACITY << " elements!\033[0m" << std::endl;
        exit(1);
    } else {
        std::cout << "\033[32mChecked " << BUFFER_CAPACITY << " elements.\033[0m" << std::endl;
    }
    return BenchmarkResult{bandwidth, time_in_seconds, bytes_per_cycle, num_cycles};
}

int main(int argc, const char** argv) {
    char mode;
    if(argc <= 1) {
        mode = 'a';
    } else {
        mode = *(argv[1]);
    }
    const char* xclbin_file;
    switch(mode){
    case '0':
        device = xrt::device("0000:01:00.1");
        std::cout << "Got Device 0000:01:00.1" << std::endl;
        xclbin_file = "overlay_hw.xclbin";
        break;
    case '8':
        device = xrt::device("0000:81:00.1");
        std::cout << "Got Device 0000:81:00.1" << std::endl;
        xclbin_file = "overlay_hw.xclbin";
        break;
    case 'a':
        device = xrt::device("0000:a1:00.1");
        std::cout << "Got Device 0000:a1:00.1" << std::endl;
        xclbin_file = "overlay_hw.xclbin";
        break;
    case 'e':
        device = xrt::device("0000:e1:00.1");
        std::cout << "Got Device 0000:e1:00.1" << std::endl;
        xclbin_file = "overlay_hw.xclbin";
        break;
    case 'u':
        std::cout << "Getting emulation, if this Segfaults, you forgot to run 'source vck5000_emu.sh -s on'" << std::endl;
        device = xrt::device(0);
        std::cout << "Got Device in emu" << std::endl;
        xclbin_file = "overlay_hw_emu.xclbin";
        std::cout << "Overwriting BUFFER_CAPACITY=5000 to speed up emulation" << std::endl;
        BUFFER_CAPACITY = 5000;
        break;
    default:
        std::cout << "UNKNOWN OPTION: " << argv[1] << std::endl;
        return 1;
    }
    if(argc >= 3) {
        xclbin_file = argv[2];
    }
    std::cout << "device name:     " << device.get_info<xrt::info::device::name>() << std::endl;
    std::cout << "device bdf:      " << device.get_info<xrt::info::device::bdf>() << std::endl;

    // Workaround for dumb missing default constructor
    xrt::xclbin xclbin = xrt::xclbin(xclbin_file);
    xclbin_handle_ptr = std::make_unique<xrt::uuid>(device.load_xclbin(xclbin));
    //std::cout << "clocks: " << xclbin.get_axlf_section<const char*>(axlf_section_kind::CLOCK_FREQ_TOPOLOGY) << std::endl;

    const clock_freq_topology* clocks = xclbin.get_axlf_section<const clock_freq_topology*>(axlf_section_kind::CLOCK_FREQ_TOPOLOGY);
    for(int i = 0; i < clocks->m_count; i++) {
        auto cf = &clocks->m_clock_freq[i];
        std::cout << cf->m_name << "(" << cf->m_type << "): " << cf->m_freq_Mhz << "MHz" << std::endl;
        if(cf->m_type == CLOCK_TYPE::CT_DATA) {
            clock_freq = cf->m_freq_Mhz * 1000000.0;
        }
    }

    std::cout << "Got XCLBIN" << std::endl;

    AXIConfig config = AXIConfig{
        .arprot = 0,
        .arcache = 2,
        .arqos = 0,
        .arlock = 0,
        .arregion = 0,
        .max_in_flight = 2000,
    };
    printConfig(config);

    std::cout << "Made Kernel" << std::endl;
    default_buffer = new uint32_t[BUFFER_CAPACITY];
    for(size_t i = 0; i < BUFFER_CAPACITY; i++) {
        default_buffer[i] = 0xDDDDDDDD;
    }
    host_side = new uint32_t[BUFFER_CAPACITY];
    expected_buffer = new uint32_t[BUFFER_CAPACITY];

    for(xrt::xclbin::kernel kernel : xclbin.get_kernels()) {
        std::string kernel_name = kernel.get_name();
        int AXI_WIDTH;
        if(kernel_name == "burst_writer32") {
            AXI_WIDTH = 32;
        } else if(kernel_name == "burst_writer64") {
            AXI_WIDTH = 64;
        } else if(kernel_name == "burst_writer128") {
            AXI_WIDTH = 128;
        } else if(kernel_name == "burst_writer256") {
            AXI_WIDTH = 256;
        } else if(kernel_name == "burst_writer512") {
            AXI_WIDTH = 512;
        } else {
            std::cout << "ERROR, UNKNOWN KERNEL " << kernel_name << std::endl;
            exit(1);
        }
        //std::string type = kernel.get_type();
        std::cout << kernel_name << ":" << std::endl;
        for(xrt::xclbin::ip cu : kernel.get_cus()) {
            auto addr_arg = cu.get_arg(0);
            std::cout << "addr arg name " << addr_arg.get_name() << std::endl;
            auto addr_mems = addr_arg.get_mems();
            //std::cout << addr_mems.size() << " associated mems " << std::endl;
            auto addr_mem_typ = addr_mems[0].get_type();
            
            std::string cu_name = cu.get_name().substr(kernel_name.length() + 1);
            std::string full_name = kernel_name + ":{" + cu_name + "}";
            std::string typ = cu_name.substr(kernel_name.length() + 1);
            std::cout << "    " << full_name << " is a " << typ << std::endl;
            xrt::bo::flags buf_flags;
            std::cout << "addr_mem_typ:" << static_cast<uint32_t>(addr_mem_typ) << std::endl; 
            // doesn't work, sadly, have to check buf_flags
            // if(addr_mem_typ == xrt::xclbin::mem::memory_type::host) {}
            if(typ == "host") {
                buf_flags = xrt::bo::flags::host_only;
            } else {
                buf_flags = xrt::bo::flags::normal;
            }
            xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, full_name);
            xrt::bo bo = xrt::bo(device, sizeof(uint32_t) * BUFFER_CAPACITY, buf_flags, k.group_id(0));
            kernel_infos.push_back(KernelInfo{full_name, AXI_WIDTH, typ, bo});
        }
    }

    std::sort(kernel_infos.begin(), kernel_infos.end(),
        [](const KernelInfo& a, const KernelInfo& b) {
            if (a.typ != b.typ)
                return a.typ < b.typ;
            return a.AXI_WIDTH < b.AXI_WIDTH;
        });
    std::cout << "Made Buffer" << std::endl;
    //xrt::bo bench_buffer = xrt::bo(device, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_HOST_ONLY, 0);

    
    uint32_t config_u32 = *reinterpret_cast<const uint32_t*>(&config);

    for(KernelInfo kernel_info : kernel_infos) {
        if(kernel_info.typ == "ddr") {
            continue; // Skip faulty DDR? 
        }
        // std::cout << "Small Buffers" << std::endl;
        // for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
        //     run_kernel(kernel_info, 19, offset, config_u32);
        // }
        // std::cout << "Small Buffers on Crossover" << std::endl;
        // for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
        //     run_kernel(kernel_info, 20, 4000 + offset, config_u32);
        // }
/*
        std::cout << "Zero sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 0, offset, 1, 0, config_u32);
            if(offset == 12) {
                offset = 4080;
            }
        }

        std::cout << "One sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 1, offset, 1, 0, config_u32);
            if(offset == 12) {
                offset = 4080;
            }
        }

        std::cout << "Two sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 2, offset, 1, 0, config_u32);
            if(offset == 12) {
                offset = 4080;
            }
        }
*/
        
        /*for(int i = 0; i < 2000; i++) {
            run_kernel(kernel_info, 2, 0, 19, 4, config_u32);
        }*/
        /*run_kernel(kernel_info, 2, 0, 23, 4, config_u32);
        run_kernel(kernel_info, 2, 0, 23, 4, config_u32);
        run_kernel(kernel_info, 2, 0, 23, 4, config_u32);
        run_kernel(kernel_info, 2, 0, 23, 4, config_u32);
        run_kernel(kernel_info, 2, 0, 24, 4, config_u32);*/
        

        std::cout << "Repeated Two sized tests" << std::endl;
        for(uint32_t repeats = 1; repeats < 1200; repeats++) {
            run_kernel(kernel_info, 2, 0, repeats, 4, config_u32);
        }
    }

    // Actual benchmarks


    std::ofstream bench_file = std::ofstream("benchFile.csv");
    bench_file << "Large Buffer Benchmark,Bandwidth,TimeInSeconds,BytesPerCycle,NumCycles" << std::endl;
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, BUFFER_CAPACITY, 0, 100, 0, config_u32);
        bench_file << kernel_info.name << ",";
        bench_file << result.bandwidth << ",";
        bench_file << result.time_in_seconds << ",";
        bench_file << result.bytes_per_cycle << ",";
        bench_file << result.num_cycles << std::endl;
    }

    bench_file << "Many Small Writes To Same Location,Bandwidth,TimeInSeconds,BytesPerCycle,NumCycles" << std::endl;
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 100, 0, config_u32);
        bench_file << kernel_info.name << ",";
        bench_file << result.bandwidth << ",";
        bench_file << result.time_in_seconds << ",";
        bench_file << result.bytes_per_cycle << ",";
        bench_file << result.num_cycles << std::endl;
    }

    bench_file << "Many Small Writes Ascending Locations,Bandwidth,TimeInSeconds,BytesPerCycle,NumCycles" << std::endl;
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 100, 4, config_u32);
        bench_file << kernel_info.name << ",";
        bench_file << result.bandwidth << ",";
        bench_file << result.time_in_seconds << ",";
        bench_file << result.bytes_per_cycle << ",";
        bench_file << result.num_cycles << std::endl;
    }
}
