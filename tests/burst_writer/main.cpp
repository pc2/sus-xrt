#include "experimental/xrt_ip.h"
#include "experimental/xrt_uuid.h"
#include "experimental/xrt_kernel.h"
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

#include <unistd.h>


struct AXIConfig {
    uint32_t arsize : 3;
    uint32_t arburst : 2;
    uint32_t arprot : 3;
    uint32_t arcache : 4;
    uint32_t arqos : 4;
    uint32_t arlock : 1;
    uint32_t arregion : 4;
    uint32_t max_in_flight: 11;
};

void printConfig(AXIConfig config) {
    std::cout << "Current AXIConfig:\n"
              << "  arsize        = " << config.arsize << "\n"
              << "  arburst       = " << config.arburst << "\n"
              << "  arprot        = " << config.arprot << "\n"
              << "  arcache       = " << config.arcache << "\n"
              << "  arqos         = " << config.arqos << "\n"
              << "  arlock        = " << config.arlock << "\n"
              << "  arregion      = " << config.arregion << "\n"
              << "  max_in_flight = " << config.max_in_flight << std::endl;
}

xrt::device vck5000;
std::unique_ptr<xrt::uuid>   xclbin_handle_ptr;

size_t num_buffer_elems = 10000;
uint32_t expected_hash;
std::vector<uint32_t> host_buffer;

std::vector<xrt::bo> buffers;


void printKernelRegs(const char* kernel_name) {
    xrt::ip user_manage = xrt::ip(vck5000, *xclbin_handle_ptr, kernel_name);

    std::cout << "ctrl: " << user_manage.read_register(0x000) << std::endl;
    std::cout << "Addr_low: " << user_manage.read_register(0x010) << std::endl;
    std::cout << "Addr_high: " << user_manage.read_register(0x014) << std::endl;
    std::cout << "Count: " << user_manage.read_register(0x018) << std::endl;
    std::cout << "Settings: " << user_manage.read_register(0x01c) << std::endl;
    std::cout << "Cycles taken: " << user_manage.read_register(0x020) << std::endl;
    std::cout << "Result: " << user_manage.read_register(0x024) << std::endl;
}

constexpr size_t NUM_KERNELS = 5;
double clock_freq = 368 * 1000000; // In Hz
const char* kernel_names[NUM_KERNELS]{
    "burst_writer32:{burst_writer32_1}",
    "burst_writer64:{burst_writer64_1}",
    "burst_writer128:{burst_writer128_1}",
    "burst_writer256:{burst_writer256_1}",
    "burst_writer512:{burst_writer512_1}",
};
const int sizes[NUM_KERNELS]{
    32,
    64,
    128,
    256,
    512
};


struct Pair {
    double totalBandwidth;
    double averageEffective;
};

Pair run_parallel_kernels(const std::vector<size_t>& kernel_indices, AXIConfig config) {
    uint32_t config_u32 = *reinterpret_cast<const uint32_t*>(&config);

    std::cout << kernel_indices.size() << " Parallel Kernels" << std::endl;
    std::vector<xrt::kernel> kernels;
    kernels.reserve(kernel_indices.size());
    for(size_t ki : kernel_indices) {
        const char* kernel_name = kernel_names[ki];
        kernels.emplace_back(vck5000, *xclbin_handle_ptr, kernel_name);
    }

    std::vector<xrt::run> runs;
    runs.reserve(kernel_indices.size());
    
    auto start_time = std::chrono::high_resolution_clock::now();
    uint32_t max_num_blocks = 0;
    for(size_t i = 0; i < kernel_indices.size(); i++) {
        xrt::kernel& k = kernels[i];
        size_t chunk_size = sizes[kernel_indices[i]];

        uint32_t num_blocks = num_buffer_elems / (chunk_size / 32);
        if(num_blocks > max_num_blocks) {
            max_num_blocks = num_blocks;
        }

        runs.push_back(k(buffers[i], num_blocks, config_u32));
    }
    for(xrt::run& r : runs) {
	//ert_cmd_state sa = r.state();
    	//std::cout << sa << std::endl;
        r.wait();
	//ert_cmd_state sb = r.state();
    	//std::cout << sb << std::endl;
    	//while (r.state() == ERT_CMD_STATE_NEW) {
	//}
    	//std::cout << r.state() << std::endl;
    }

    auto time_taken = std::chrono::high_resolution_clock::now() - start_time;
    //xrt::error error(vck5000, XRT_ERROR_CLASS_FIRST_ENTRY);
    //std::cout << error.to_string() << std::endl;

    double time_in_seconds = time_taken.count() / 1000000000.0;
    double read_bw = double(num_buffer_elems * kernel_indices.size()) / 1000000000.0 / time_in_seconds * sizeof(uint32_t); // GB/s
    std::cout << "    Time taken: " << time_in_seconds << "s, BW: " << read_bw << "GB/s." << std::endl;

    runs.clear();
    kernels.clear();


for (int asdf=0; asdf < 10; asdf++) {
    // Second user-managed run - REMEMBER REGISTERS FROM XRT
    std::vector<xrt::ip> user_kernels;
    user_kernels.reserve(kernel_indices.size());
    for(size_t ki : kernel_indices) {
        const char* kernel_name = kernel_names[ki];
        
        user_kernels.emplace_back(vck5000, *xclbin_handle_ptr, kernel_name);
    }
    auto start_time_user = std::chrono::high_resolution_clock::now();
    for(xrt::ip& k : user_kernels) {
        k.write_register(0x000, 1);
    }
    while(!user_kernels.empty()) {
        for (auto it = user_kernels.begin(); it != user_kernels.end(); ) {
            uint32_t ctrl = it->read_register(0x000); // Check done flag
            if (ctrl & 0x2) {
                it = user_kernels.erase(it);
            } else {
                ++it;
            }
        }
    }
    auto time_taken_user = std::chrono::high_resolution_clock::now() - start_time_user;

    double time_in_seconds_user = time_taken_user.count() / 1000000000.0;
    double read_bw_user = double(num_buffer_elems * kernel_indices.size()) / 1000000000.0 / time_in_seconds_user * sizeof(uint32_t); // GB/s
    std::cout << "    Time taken (USER MANAGED): " << time_in_seconds_user << "s, BW: " << read_bw_user << "GB/s." << std::endl;
}


    double totalEffective = 0.0;
    for(size_t ki : kernel_indices) {
        const char* kernel_name = kernel_names[ki];
        
        xrt::ip user_manage = xrt::ip(vck5000, *xclbin_handle_ptr, kernel_name);
        uint32_t reg_ctrl = user_manage.read_register(0x000);
        uint32_t reg_addr_low = user_manage.read_register(0x010);
        uint32_t reg_addr_high = user_manage.read_register(0x014);
        uint32_t reg_count = user_manage.read_register(0x018);
        uint32_t reg_setting = user_manage.read_register(0x01c);
        uint32_t reg_cycles = user_manage.read_register(0x020);
        uint32_t reg_result = user_manage.read_register(0x024);
        uint64_t reg_start_time = (uint64_t(user_manage.read_register(0x02c)) << 32) | user_manage.read_register(0x028);
        uint64_t reg_end_time = (uint64_t(user_manage.read_register(0x034)) << 32) | user_manage.read_register(0x030);

        double effective = double(reg_count) / reg_cycles;
        std::cout << "    " << kernel_name << " took " << reg_cycles << " cycles for " << reg_count << " transfers. " << effective << " effective. Start at: " << reg_start_time << ", end at: " << reg_end_time << std::endl;
        totalEffective += effective;
        if(reg_result != expected_hash) {
            std::cout << "INCORRECT HASH! Found " << reg_result << " instead of " << expected_hash << std::endl;
            throw "BAD";
        }
    }
    Pair result;
    result.totalBandwidth = read_bw;
    result.averageEffective = totalEffective / kernel_indices.size();
    return result;
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
    case 'a':
        vck5000 = xrt::device("0000:a1:00.1");
        std::cout << "Got VCK5000 in 0000:a1:00.1" << std::endl;
        xclbin_file = "../overlay_hw.xclbin";
        break;
    case 'e':
        vck5000 = xrt::device("0000:e1:00.1");
        std::cout << "Got VCK5000 in 0000:e1:00.1" << std::endl;
        xclbin_file = "../overlay_hw.xclbin";
        break;
    case 'u':
        std::cout << "Getting emulation, if this Segfaults, you forgot to run 'source ../setup_vcp_emu.sh -s on'" << std::endl;
        vck5000 = xrt::device(0);
        std::cout << "Got VCK5000 in emu" << std::endl;
        xclbin_file = "../overlay_hw_emu.xclbin";
        break;
    default:
        std::cout << "UNKNOWN OPTION: " << argv[1] << std::endl;
        return 1;
    }
    if(argc >= 3) {
        xclbin_file = argv[2];
    }
    std::cout << "device name:     " << vck5000.get_info<xrt::info::device::name>() << "\n";
    std::cout << "device bdf:      " << vck5000.get_info<xrt::info::device::bdf>() << "\n";

    // Workaround for dumb missing default constructor
    xclbin_handle_ptr = std::make_unique<xrt::uuid>(vck5000.load_xclbin(xclbin_file));

    std::cout << "Got XCLBIN" << std::endl;

    /*for(const char* kernel_name : kernel_names) {
        xrt::kernel k = xrt::kernel(vck5000, *xclbin_handle_ptr, kernel_name);
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
        xrt::kernel k = xrt::kernel(vck5000, *xclbin_handle_ptr, kernel_name);
        //xrt::bo bench_buffer = xrt::bo(vck5000, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_DEV_ONLY, k.group_id(0));
        xrt::bo bench_buffer = xrt::bo(vck5000, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_HOST_ONLY, 0);

        bench_buffer.write(host_buffer.data(), sizeof(uint32_t) * num_buffer_elems, 0);
        bench_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);

        buffers.push_back(std::move(bench_buffer));
    }*/

    AXIConfig config = AXIConfig{
        .arsize = 0,
        .arburst = 0,
        .arprot = 0,
        .arcache = 2,
        .arqos = 0,
        .arlock = 0,
        .arregion = 0,
        .max_in_flight = 2000,
    };
    printConfig(config);

    xrt::kernel k = xrt::kernel(vck5000, *xclbin_handle_ptr, kernel_names[2]);
    std::cout << "Made Kernel" << std::endl;
    uint32_t* host_side = new uint32_t[num_buffer_elems];
    xrt::bo bench_buffer = xrt::bo(vck5000, /*host_side, */sizeof(uint32_t) * num_buffer_elems, xrt::bo::flags::normal, k.group_id(0));
    std::cout << "Made Buffer" << std::endl;
    //xrt::bo bench_buffer = xrt::bo(vck5000, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_HOST_ONLY, 0);

    
    uint32_t config_u32 = *reinterpret_cast<const uint32_t*>(&config);
    xrt::run r = k(bench_buffer, num_buffer_elems, config_u32);
    std::cout << "Started Kernel" << std::endl;
    r.wait();
    std::cout << "Finished Kernel" << std::endl;
}
