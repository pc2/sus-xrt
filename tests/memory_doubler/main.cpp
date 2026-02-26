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

xrt::device device;
std::unique_ptr<xrt::uuid>   xclbin_handle_ptr;

void printKernelRegs(const char* kernel_name) {
    xrt::ip user_manage = xrt::ip(device, *xclbin_handle_ptr, kernel_name);

    std::cout << "ctrl: " << user_manage.read_register(0x000) << std::endl;
    std::cout << "Addr_low: " << user_manage.read_register(0x010) << std::endl;
    std::cout << "Addr_high: " << user_manage.read_register(0x014) << std::endl;
    std::cout << "Count: " << user_manage.read_register(0x018) << std::endl;
    std::cout << "Settings: " << user_manage.read_register(0x01c) << std::endl;
    std::cout << "Cycles taken: " << user_manage.read_register(0x020) << std::endl;
    std::cout << "Result: " << user_manage.read_register(0x024) << std::endl;
}

constexpr size_t BUFFER_CAPACITY = 2000;
constexpr size_t NUM_KERNELS = 7;
// U280 5K
//double clock_freq = 498.7 * 1000000; // In Hz
// U280 with HBM
double clock_freq = 361.7 * 1000000; // In Hz
const char* kernel_names[NUM_KERNELS]{
    "memory_doubler32:{memory_doubler32_1}",
    "memory_doubler64:{memory_doubler64_1}",
    "memory_doubler128:{memory_doubler128_1}",
    "memory_doubler256:{memory_doubler256_1}",
    "memory_doubler512:{memory_doubler512_1}",
    "memory_doubler256:{memory_doubler256_2}",
    "memory_doubler512:{memory_doubler512_2}"
};
const int sizes[NUM_KERNELS]{
    32,
    64,
    128,
    256,
    512,
    256,
    512,
};

std::vector<xrt::bo> bench_buffers;
float* default_buffer;
float* host_side;
std::vector<xrt::kernel> kernels;
void run_kernel(size_t k_idx, uint32_t num_elems, uint32_t offset, uint32_t config_u32) {
    xrt::kernel& k = kernels[k_idx];
    xrt::bo& b = bench_buffers[k_idx];
    std::cout << "Kernel " << kernel_names[k_idx] << std::endl;
    std::cout << "Write initial data for buffer " << BUFFER_CAPACITY << " elements." << std::endl;
    b.write(default_buffer, sizeof(float) * BUFFER_CAPACITY, 0);
    b.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::cout << "Start Write " << num_elems << " from " << offset << std::endl;
    auto start_time = std::chrono::high_resolution_clock::now();
    xrt::run r = k(b, num_elems, offset, config_u32);
    r.wait();
    auto time_taken = std::chrono::high_resolution_clock::now() - start_time;
    std::cout << "Finished Kernel" << std::endl;
    double time_in_seconds = time_taken.count() / 1000000000.0;
    double bw = num_elems * sizeof(float) / 1000000000.0 / time_in_seconds; // GB/s
    double bytes_per_cycle = num_elems * sizeof(float) / (time_in_seconds * clock_freq);
    std::cout << "    Time taken: " << time_in_seconds << "s, BW: " << bw << "GB/s = " << bytes_per_cycle << " bytes per cycle @" << (clock_freq / 1000000) << "MHz" << std::endl;

    size_t offset_elem = offset / 4;
    b.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    b.read(host_side, sizeof(float) * BUFFER_CAPACITY, 0);
    for(int i = 0; i < offset_elem; i++) {
        if(host_side[i] != default_buffer[i]) {
            std::cout << "ERROR: Buffer Elem [" << i << "] should not have been written to! = " << host_side[i] << std::endl;
        }
    }
    for(int i = 0; i < num_elems; i++) {
        if(host_side[offset_elem + i] != default_buffer[i] * 2) {
            std::cout << "ERROR: Buffer Elem [" << offset_elem + i << "] should be " << i << " but was " << host_side[offset_elem + i] << std::endl;
        }
    }
    for(int i = offset_elem + num_elems; i < BUFFER_CAPACITY; i++) {
        if(host_side[i] != default_buffer[i]) {
            std::cout << "ERROR: Buffer Elem [" << i << "] should not have been written to! = " << host_side[i] << std::endl;
        }
    }
    std::cout << "Checked " << BUFFER_CAPACITY << " elements." << std::endl;
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
        std::cout << "Got Emulation Device" << std::endl;
        xclbin_file = "overlay_hw_emu.xclbin";
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
    std::cout << "device freq:     " << device.get_info<xrt::info::device::max_clock_frequency_mhz>() << std::endl;

    // Workaround for dumb missing default constructor
    xclbin_handle_ptr = std::make_unique<xrt::uuid>(device.load_xclbin(xclbin_file));

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

    xrt::kernel k = xrt::kernel(device, *xclbin_handle_ptr, kernel_names[2]);
    std::cout << "Made Kernel" << std::endl;
    default_buffer = new float[BUFFER_CAPACITY];
    for(size_t i = 0; i < BUFFER_CAPACITY; i++) {
        default_buffer[i] = i * 0.1;
    }
    host_side = new float[BUFFER_CAPACITY];

    for(int i = 0; i < NUM_KERNELS; i++) {
        kernels.emplace_back(device, *xclbin_handle_ptr, kernel_names[i]);
        bench_buffers.emplace_back(device, /*host_side, */sizeof(float) * BUFFER_CAPACITY, xrt::bo::flags::normal, kernels[i].group_id(0));
    }
    std::cout << "Made Buffer" << std::endl;
    //xrt::bo bench_buffer = xrt::bo(device, sizeof(uint32_t) * num_buffer_elems, XCL_BO_FLAGS_HOST_ONLY, 0);

    
    uint32_t config_u32 = *reinterpret_cast<const uint32_t*>(&config);

    for(int kernel = 0; kernel < NUM_KERNELS; kernel++) {
        /*std::cout << "Small Buffers" << std::endl;
        for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
            run_kernel(kernel, 19, offset, config_u32);
        }

        std::cout << "Small Buffers on Crossover" << std::endl;
        for(int offset = 0; offset < 64; offset += sizeof(uint32_t)) {
            run_kernel(kernel, 20, 4000 + offset, config_u32);
        }*/

        std::cout << "Large Buffer Benchmark" << std::endl;
        for(int size = 100; size <= BUFFER_CAPACITY; size *= 2) {
            run_kernel(kernel, size, 0, config_u32);
        }
    }
}
