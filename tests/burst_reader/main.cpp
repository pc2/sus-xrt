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
#include <random>
#include <fstream>

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

std::string device_name;
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
    std::cout << "Result: " << user_manage.read_register(0x02c) << std::endl;
    std::cout << "Cycles taken: " << user_manage.read_register(0x030) << std::endl;
    std::cout << "Cycles since reset @start: " << read_64_bit_reg(user_manage, 0x034) << std::endl;
    std::cout << "Cycles since reset @end: " << read_64_bit_reg(user_manage, 0x03c) << std::endl;
    std::cout << "Cycles going by reset?: " << read_64_bit_reg(user_manage, 0x03c) - read_64_bit_reg(user_manage, 0x034) << std::endl;
}

size_t BUFFER_CAPACITY = 200000000 / sizeof(uint32_t);

double clock_freq_MHz;

struct KernelInfo {
    std::string kernel_id;
    std::string cu_name;
    int AXI_WIDTH;
    std::string typ;
    xrt::bo bo;
};
std::vector<KernelInfo> kernel_infos;

struct BenchmarkResult {
    double bandwidth;
    double time_in_seconds;
    double bytes_per_cycle;
    uint64_t num_cycles;
    uint64_t total_data;
    double kernel_measured_runtime;
    double kernel_measured_bandwidth;
};

uint32_t* reference_buffer;
BenchmarkResult run_kernel(KernelInfo& info, uint32_t num_elems, uint32_t offset, uint32_t num_repeats, uint32_t experiment_offset, AXIConfig config) {
    uint32_t config_u32 = *reinterpret_cast<const uint32_t*>(&config);

    uint64_t last_elem_idx = offset + num_repeats * experiment_offset + num_elems - 1;
    if(last_elem_idx >= BUFFER_CAPACITY) {
        std::cout << "ERROR: Element index " << last_elem_idx << " lies outside the buffer size " << BUFFER_CAPACITY << std::endl;
        exit(1);
    }
    xrt::bo& b = info.bo;
    std::cout << "Kernel " << info.kernel_id << std::endl;
    std::cout << "Write initial data for buffer " << BUFFER_CAPACITY << " elements." << std::endl;
    b.write(reference_buffer, sizeof(uint32_t) * BUFFER_CAPACITY, 0);
    b.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    uint64_t total_data = uint64_t(num_elems) * num_repeats * sizeof(uint32_t);
    double time_in_seconds;
    {
        xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, info.kernel_id.c_str());
        std::cout << "Start Read " << num_elems << " from " << offset << " (x" << num_repeats << " repeats at offset " << experiment_offset << ")" << std::endl;
        auto start_time = std::chrono::high_resolution_clock::now();
        xrt::run r = k(b, num_elems, offset, num_repeats, experiment_offset, config_u32);
        r.wait();
        auto time_taken = std::chrono::high_resolution_clock::now() - start_time;
        std::cout << "Finished Kernel" << std::endl;
        time_in_seconds = time_taken.count() / 1000000000.0;
    }
    //printKernelRegs(info.kernel_id.c_str());
    uint64_t num_cycles;
    uint32_t hash;
    {
        xrt::ip user_manage = xrt::ip(device, *xclbin_handle_ptr, info.kernel_id.c_str());
        num_cycles = read_64_bit_reg(user_manage, 0x03c) - read_64_bit_reg(user_manage, 0x034);
        hash = user_manage.read_register(0x02c);
    }
    double bandwidth = total_data / 1000000000.0 / time_in_seconds; // GB/s
    double bytes_per_cycle = double(total_data) / num_cycles;
    double kernel_measured_runtime = num_cycles / (clock_freq_MHz * 1000000.0);
    double kernel_measured_bandwidth = total_data / kernel_measured_runtime / 1000000000.0;
    std::cout << "    Time taken: " << time_in_seconds << "s" << std::endl;
    std::cout << "    BW: " << bandwidth << "GB/s" << std::endl;
    std::cout << "    Cycles: " << num_cycles << std::endl;
    std::cout << "    Bytes/cy: " << bytes_per_cycle << std::endl;
    std::cout << "    @" << clock_freq_MHz << "MHz" << std::endl;

    size_t offset_elem = offset / 4;
    uint32_t expected_hash = 0;
    for(int repeat_i = 0; repeat_i < num_repeats; repeat_i++) {
        for(int i = 0; i < num_elems; i++) {
            expected_hash ^= reference_buffer[experiment_offset / sizeof(uint32_t) * repeat_i + offset_elem + i];
        }
    }
    if(hash != expected_hash) {
        std::cout << "\033[31mThe device computed hash (" << std::hex << hash << ") does not match the expected hash (" << expected_hash << std::dec << ")!!!!\033[0m" << std::endl;
        exit(1);
    } else {
        std::cout << "\033[32mHash is correct: " << hash << "\033[0m" << std::endl;
    }
    return BenchmarkResult{
        bandwidth,
        time_in_seconds,
        bytes_per_cycle,
        num_cycles,
        total_data,
        kernel_measured_runtime,
        kernel_measured_bandwidth
    };
}

void benchmark_header(std::ofstream& bench_file, const char* name, AXIConfig& config) {
    bench_file << name << "\t";
    bench_file << "arprot: " << config.arprot << "\t";
    bench_file << "arcache: " << config.arcache << "\t";
    bench_file << "arqos: " << config.arqos << "\t";
    bench_file << "arlock: " << config.arlock << "\t";
    bench_file << "arregion: " << config.arregion << "\t";
    bench_file << "max_in_flight: " << config.max_in_flight << "\t";
    bench_file << "clock_freq (MHz): " << clock_freq_MHz;
    bench_file << "\nName\tCycles\tBytes Per Cycle\tTime (s)\tKernel Time (s)\tBandwidth (GB/s)\tKernel Measured Bandwidth (GB/s)" << std::endl;
}
void print_benchmark(std::ofstream& bench_file, KernelInfo& kernel_info, BenchmarkResult& result) {
    bench_file << kernel_info.cu_name << "\t";
    bench_file << result.num_cycles << "\t";
    bench_file << result.bytes_per_cycle << "\t";
    bench_file << result.time_in_seconds << "\t";
    bench_file << result.kernel_measured_runtime << "\t";
    bench_file << result.bandwidth << "\t";
    bench_file << result.kernel_measured_bandwidth << std::endl;
}

void run_benchmarks(std::ofstream& bench_file, AXIConfig config) {
    printConfig(config);

    benchmark_header(bench_file, "Small Reads Same Location", config);
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 10000, 0, config);
        print_benchmark(bench_file, kernel_info, result);
    }

    benchmark_header(bench_file, "Small Sequential Reads", config);
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 10000, 4, config);
        print_benchmark(bench_file, kernel_info, result);
    }

    benchmark_header(bench_file, "Small Reads Different Pages", config);
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 10000, 1 << 12, config);
        print_benchmark(bench_file, kernel_info, result);
    }

    benchmark_header(bench_file, "Single Read Latency", config);
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, 1, 0, 1, 0, config);
        print_benchmark(bench_file, kernel_info, result);
    }

    benchmark_header(bench_file, "Large Buffer Read", config);
    for(KernelInfo kernel_info : kernel_infos) {
        BenchmarkResult result = run_kernel(kernel_info, BUFFER_CAPACITY, 0, 100, 0, config);
        print_benchmark(bench_file, kernel_info, result);
    }
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
    device_name = device.get_info<xrt::info::device::name>();
    std::cout << "device name:     " << device_name << std::endl;
    std::cout << "device bdf:      " << device.get_info<xrt::info::device::bdf>() << std::endl;

    if(device_name == "xilinx_u280_gen3x16_xdma_base_1") {
        device_name = std::string("U280");
    } else if(device_name == "xilinx_vck5000_gen4x8_qdma_base_2") {
        device_name = std::string("VCK5000");
        //BUFFER_CAPACITY = 1000000000 / sizeof(uint32_t);
    }

    // Workaround for dumb missing default constructor
    xrt::xclbin xclbin = xrt::xclbin(xclbin_file);
    xclbin_handle_ptr = std::make_unique<xrt::uuid>(device.load_xclbin(xclbin));
    //std::cout << "clocks: " << xclbin.get_axlf_section<const char*>(axlf_section_kind::CLOCK_FREQ_TOPOLOGY) << std::endl;

    const clock_freq_topology* clocks = xclbin.get_axlf_section<const clock_freq_topology*>(axlf_section_kind::CLOCK_FREQ_TOPOLOGY);
    for(int i = 0; i < clocks->m_count; i++) {
        auto cf = &clocks->m_clock_freq[i];
        std::cout << cf->m_name << "(" << cf->m_type << "): " << cf->m_freq_Mhz << "MHz" << std::endl;
        if(cf->m_type == CLOCK_TYPE::CT_DATA) {
            clock_freq_MHz = cf->m_freq_Mhz;
        }
    }

    std::cout << "Got XCLBIN" << std::endl;

    /*for(const char* kernel_name : kernel_names) {
        xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, kernel_name);
        std::cout << "Kernel " << kernel_name << ": " << k.group_id(0) << std::endl;
    }


    std::cout << "Making total buffer of " << num_buffer_elems << " elements..." << std::endl;
    host_buffer.reserve(num_buffer_elems);
    expected_hash = 0;
    for(uint32_t i = 0; i < num_buffer_elems; i++) {
        host_buffer.push_back(i * 13);

        expected_hash ^= i * 13;
    }
    std::cout << "Expected hash is " << expected_hash << std::endl;
    
    for(const char* kernel_name: kernel_names) {
        std::cout << "Copying Buffer for " << kernel_name << "..." << std::endl;
        xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, kernel_name);
        //xrt::bo bench_buffer = xrt::bo(device, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_DEV_ONLY, k.group_id(0));
        xrt::bo bench_buffer = xrt::bo(device, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_HOST_ONLY, 0);

        bench_buffer.write(host_buffer.data(), sizeof(uint32_t) * num_buffer_elems, 0);
        bench_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);

        buffers.push_back(std::move(bench_buffer));
    }*/

    std::cout << "Made Kernel" << std::endl;
    reference_buffer = new uint32_t[BUFFER_CAPACITY];
    std::random_device random_device;
    std::uniform_int_distribution<uint32_t> distribution(0u, 0xFFFFFFFFu);
    for(size_t i = 0; i < BUFFER_CAPACITY; i++) {
        reference_buffer[i] = distribution(random_device);
    }

    for(xrt::xclbin::kernel kernel : xclbin.get_kernels()) {
        std::string kernel_name = kernel.get_name();
        int AXI_WIDTH;
        if(kernel_name == "burst_reader32") {
            AXI_WIDTH = 32;
        } else if(kernel_name == "burst_reader64") {
            AXI_WIDTH = 64;
        } else if(kernel_name == "burst_reader128") {
            AXI_WIDTH = 128;
        } else if(kernel_name == "burst_reader256") {
            AXI_WIDTH = 256;
        } else if(kernel_name == "burst_reader512") {
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
            std::string kernel_id = kernel_name + ":{" + cu_name + "}";
            std::string typ = cu_name.substr(kernel_name.length() + 1);
            std::cout << "    " << kernel_id << " is a " << typ << std::endl;
            xrt::bo::flags buf_flags;
            std::cout << "addr_mem_typ:" << static_cast<uint32_t>(addr_mem_typ) << std::endl; 
            // doesn't work, sadly, have to check buf_flags
            // if(addr_mem_typ == xrt::xclbin::mem::memory_type::host) {}
            if(typ == "host") {
                buf_flags = xrt::bo::flags::host_only;
            } else {
                buf_flags = xrt::bo::flags::normal;
            }
            xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, kernel_id);
            xrt::bo bo = xrt::bo(device, sizeof(uint32_t) * BUFFER_CAPACITY, buf_flags, k.group_id(0));

            std::cout << "Write reference data for buffer " << BUFFER_CAPACITY << " elements." << std::endl;
            bo.write(reference_buffer, sizeof(uint32_t) * BUFFER_CAPACITY, 0);
            bo.sync(XCL_BO_SYNC_BO_TO_DEVICE);
            kernel_infos.push_back(KernelInfo{kernel_id, cu_name, AXI_WIDTH, typ, bo});
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

    
    /*for(KernelInfo kernel_info : kernel_infos) {
        std::cout << "Small Buffers" << std::endl;
        for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
            run_kernel(kernel_info, 19, offset, config);
        }

        std::cout << "Small Buffers on Crossover" << std::endl;
        for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
            run_kernel(kernel_info, 20, 4000 + offset, config);
        }

        std::cout << "Zero sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 0, offset, 1, 0, config);
            if(offset == 12) {
                offset = 4080;
            }
        }

        std::cout << "One sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 1, offset, 1, 0, config);
            if(offset == 12) {
                offset = 4080;
            }
        }

        std::cout << "Two sized test" << std::endl;
        for(int offset = 0; offset <= 4108; offset+=4) {
            run_kernel(kernel_info, 2, offset, 1, 0, config);
            if(offset == 12) {
                offset = 4080;
            }
        }

        std::cout << "Repeated Two sized tests" << std::endl;
        run_kernel(kernel_info, 2, 0, 1200, 4, config);

        std::cout << "Large Buffer Benchmark" << std::endl;
        for(int size = 1; size <= BUFFER_CAPACITY; size *= 2) {
            run_kernel(kernel_info, size, 0, 1, 0, config);
        }
    }*/


    // Actual benchmarks
    
    std::ofstream bench_file = std::ofstream("../benchFile" + device_name + ".csv");
    AXIConfig config = AXIConfig{
        .arprot = 0,
        .arcache = 0b0010,
        .arqos = 0,
        .arlock = 0,
        .arregion = 0,
        .max_in_flight = (1 << 16) - 1,
    };

    for(int arcache = 0; arcache < 16; arcache++) {
        config.arcache = arcache;
        run_benchmarks(bench_file, config);
    }
}
