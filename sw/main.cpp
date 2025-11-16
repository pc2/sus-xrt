#include "experimental/xrt_ip.h"
#include "experimental/xrt_uuid.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_bo.h"

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

constexpr size_t NUM_KERNELS = 20;

double clock_freq = 348 * 1000000; // In Hz
size_t num_buffer_elems = 100000000*8;
uint32_t expected_hash;
xrt::bo bench_buffer;
std::vector<uint32_t> host_buffer;

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


/*const char* kernel_names[28]{
    "sus_bench_burst32:{sus_bench_burst32_1}",
    "sus_bench_burst32:{sus_bench_burst32_2}",
    "sus_bench_burst32:{sus_bench_burst32_3}",
    "sus_bench_burst32:{sus_bench_burst32_4}",
    "sus_bench_burst64:{sus_bench_burst64_1}",
    "sus_bench_burst64:{sus_bench_burst64_2}",
    "sus_bench_burst64:{sus_bench_burst64_3}",
    "sus_bench_burst64:{sus_bench_burst64_4}",
    "sus_bench_burst128:{sus_bench_burst128_1}",
    "sus_bench_burst128:{sus_bench_burst128_2}",
    "sus_bench_burst128:{sus_bench_burst128_3}",
    "sus_bench_burst128:{sus_bench_burst128_4}",
    "sus_bench_burst256:{sus_bench_burst256_1}",
    "sus_bench_burst256:{sus_bench_burst256_2}",
    "sus_bench_burst256:{sus_bench_burst256_3}",
    "sus_bench_burst256:{sus_bench_burst256_4}",
    "sus_bench_burst256:{sus_bench_burst256_5}",
    "sus_bench_burst256:{sus_bench_burst256_6}",
    "sus_bench_burst256:{sus_bench_burst256_7}",
    "sus_bench_burst256:{sus_bench_burst256_8}",
    "sus_bench_burst512:{sus_bench_burst512_1}",
    "sus_bench_burst512:{sus_bench_burst512_2}",
    "sus_bench_burst512:{sus_bench_burst512_3}",
    "sus_bench_burst512:{sus_bench_burst512_4}",
    "sus_bench_burst512:{sus_bench_burst512_5}",
    "sus_bench_burst512:{sus_bench_burst512_6}",
    "sus_bench_burst512:{sus_bench_burst512_7}",
    "sus_bench_burst512:{sus_bench_burst512_8}",
};
const int sizes[28]{
    32, 32, 32, 32, 
    64, 64, 64, 64, 
    128, 128, 128, 128, 
    256, 256, 256, 256, 256, 256, 256, 256, 
    512, 512, 512, 512, 512, 512, 512, 512, 
};*/

const char* kernel_names[NUM_KERNELS]{
    "sus_bench_burst256:{sus_bench_burst256_1}",
    "sus_bench_burst256:{sus_bench_burst256_2}",
    "sus_bench_burst256:{sus_bench_burst256_3}",
    "sus_bench_burst256:{sus_bench_burst256_4}",
    "sus_bench_burst256:{sus_bench_burst256_5}",
    "sus_bench_burst256:{sus_bench_burst256_6}",
    "sus_bench_burst256:{sus_bench_burst256_7}",
    "sus_bench_burst256:{sus_bench_burst256_8}",
    "sus_bench_burst256:{sus_bench_burst256_9}",
    "sus_bench_burst256:{sus_bench_burst256_10}",
    "sus_bench_burst256:{sus_bench_burst256_11}",
    "sus_bench_burst256:{sus_bench_burst256_12}",
    "sus_bench_burst256:{sus_bench_burst256_13}",
    "sus_bench_burst256:{sus_bench_burst256_14}",
    "sus_bench_burst256:{sus_bench_burst256_15}",
    "sus_bench_burst256:{sus_bench_burst256_16}",
    "sus_bench_burst256:{sus_bench_burst256_17}",
    "sus_bench_burst256:{sus_bench_burst256_18}",
    "sus_bench_burst256:{sus_bench_burst256_19}",
    "sus_bench_burst256:{sus_bench_burst256_20}",
};
const int sizes[NUM_KERNELS]{
    256,256,256,256,256,
    256,256,256,256,256,
    256,256,256,256,256,
    256,256,256,256,256,
};

double co_run_bandwidths[NUM_KERNELS][NUM_KERNELS];
double co_run_cycle_efficiencies[NUM_KERNELS][NUM_KERNELS];

void run_parallel_kernels(const std::vector<size_t>& kernel_indices, AXIConfig config) {
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

        runs.push_back(k(bench_buffer, num_blocks, config_u32));
    }
    for(xrt::run& r : runs) {
        r.wait();
    }

    auto time_taken = std::chrono::high_resolution_clock::now() - start_time;

    double expected_time_at_max_rate = max_num_blocks / clock_freq;
    double time_in_seconds = time_taken.count() / 1000000000.0;
    double read_bw = double(num_buffer_elems * kernel_indices.size()) / 1000000000.0 / time_in_seconds * sizeof(uint32_t); // GB/s
    double percent_cycles_used = expected_time_at_max_rate / time_in_seconds;
    std::cout << "    Time taken: " << time_in_seconds << "s, BW: " << read_bw << "GB/s. Cycles used ratio: " << percent_cycles_used << std::endl;

    runs.clear();
    kernels.clear();

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

        double effective = double(reg_count) / reg_cycles;
        std::cout << "    " << kernel_name << " took " << reg_cycles << " cycles for " << reg_count << " transfers. " << effective << " effective." << std::endl;
        totalEffective += effective;
        if(reg_result != expected_hash) {
            std::cout << "INCORRECT HASH! Found " << reg_result << " instead of " << expected_hash << std::endl;
            throw "BAD";
        }
    }
    if(kernel_indices.size() == 2) {
        co_run_bandwidths[kernel_indices[0]][kernel_indices[1]] = read_bw;
    }
    if(kernel_indices.size() == 2) {
        co_run_cycle_efficiencies[kernel_indices[0]][kernel_indices[1]] = totalEffective / 2;
    }
}

int main(int argc, const char** argv)
{
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
        xclbin_file = "../hw/overlay_hw.xclbin";
        break;
    case 'e':
        vck5000 = xrt::device("0000:e1:00.1");
        std::cout << "Got VCK5000 in 0000:e1:00.1" << std::endl;
        xclbin_file = "../hw/overlay_hw.xclbin";
        break;
    case 'u':
        std::cout << "Getting emulation, if this Segfaults, you forgot to run 'source ../setup_emu.sh -s on'" << std::endl;
        vck5000 = xrt::device(0);
        std::cout << "Got VCK5000 in emu" << std::endl;
        xclbin_file = "../hw/overlay_hw_emu.xclbin";
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

    std::cout << "Making Buffer of " << num_buffer_elems << " elements" << std::endl;
    {
        xrt::kernel k = xrt::kernel(vck5000, *xclbin_handle_ptr, kernel_names[0]);
        bench_buffer = xrt::bo(vck5000, sizeof(uint32_t) * num_buffer_elems, k.group_id(0));

        host_buffer.reserve(num_buffer_elems);
        expected_hash = 0;
        for(uint32_t i = 0; i < num_buffer_elems; i++) {
            host_buffer.push_back(i * 13);

            expected_hash ^= i * 13;
        }

        bench_buffer.write(host_buffer.data(), sizeof(uint32_t) * num_buffer_elems, 0);
        bench_buffer.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    }

    std::cout << "Expected hash is " << expected_hash << std::endl;

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
    
    /*kernels.clear();
    size_t num_transfers = 2;
    size_t kernel_id = 0;
    std::string line;

    while (true) {
        printConfig(config);
        std::cout << "  num_transfers = " << num_transfers << std::endl;
        std::cout << "command> ";
        if (!std::getline(std::cin, line))
            break;

        std::istringstream iss(line);
        std::string cmd;
        iss >> cmd;
        //cmd = "run";
        if (cmd.empty())
            continue;

        if (cmd == "exit" || cmd == "quit")
            break;
        else if (cmd == "run") {
            size_t num_buffer_elements = sizes[kernel_id] / 32;
            {
                xrt::kernel kernel = xrt::kernel(vck5000, *xclbin_handle_ptr, kernel_names[kernel_id]);

                auto start_time = std::chrono::high_resolution_clock::now();
                xrt::run run_output_kernel = kernel(bench_buffer, num_transfers, *reinterpret_cast<const uint32_t*>(&config));

                run_output_kernel.wait();
                auto time_taken = std::chrono::high_resolution_clock::now() - start_time;

                double expected_time_at_max_rate = num_transfers / clock_freq;
                double time_in_seconds = time_taken.count() / 1000000000.0;
                double read_bw = double(num_buffer_elems) / 1000000000.0 / time_in_seconds * sizeof(uint32_t); // GB/s
                double percent_cycles_used = expected_time_at_max_rate / time_in_seconds;
                std::cout << kernel_names[kernel_id] << "\tTime taken: " << time_in_seconds << "s, BW: " << read_bw << "GB/s. Cycles used ratio: " << percent_cycles_used << std::endl;
            }

            printKernelRegs(kernel_names[kernel_id]);

            uint32_t expected = 0;
            for(uint32_t v : host_buffer) {
                expected ^= v;
            }
            std::cout << "Expected Result: " << expected << std::endl;
        }
        else {
            uint32_t value;
            if (!(iss >> value)) {
                std::cerr << "Invalid value.\n";
                continue;
            }

            if (cmd == "arsize") config.arsize = value;
            else if (cmd == "arburst") config.arburst = value;
            else if (cmd == "arprot") config.arprot = value;
            else if (cmd == "arcache") config.arcache = value;
            else if (cmd == "arqos") config.arqos = value;
            else if (cmd == "arlock") config.arlock = value;
            else if (cmd == "arregion") config.arregion = value;
            else if (cmd == "max_in_flight") config.max_in_flight = value;
            else if (cmd == "num_transfers") num_transfers = value;
            else if (cmd == "kernel_id") kernel_id = value;
            else {
                std::cerr << "Unknown field: " << cmd << "\n";
                continue;
            }

            std::cout << cmd << " set to " << value << "\n";
        }
    }*/





    std::cout << "Starting Kernels" << std::endl;
    for(size_t kernel_id = 0; kernel_id < NUM_KERNELS; kernel_id++) {
        run_parallel_kernels(std::vector<size_t>{kernel_id}, config);
    }

    std::cout << "Starting 4x Parallel Kernels" << std::endl;
    for(size_t kernel_group = 0; kernel_group < NUM_KERNELS / 4; kernel_group++) {
        run_parallel_kernels(std::vector<size_t>{kernel_group*4, kernel_group*4+1, kernel_group*4+2, kernel_group*4+3}, config);
    }

    /*std::cout << "Starting 1x-8x Parallel Kernels 256-bit" << std::endl;
    std::vector<size_t> kernel_ids;
    for(int num_kernels = 0; num_kernels < 8; num_kernels++) {
        kernel_ids.push_back(12+num_kernels); // for 256-bit
        run_parallel_kernels(kernel_ids, config);
    }
    kernel_ids.clear();
    std::cout << "Starting 1x-8x Parallel Kernels 512-bit" << std::endl;
    for(int num_kernels = 0; num_kernels < 8; num_kernels++) {
        kernel_ids.push_back(20+num_kernels); // for 512-bit
        run_parallel_kernels(kernel_ids, config);
    }
    std::cout << "8x 256-bit PLUS 8x 512-bit" << std::endl;
    kernel_ids.clear();
    for(int kernel_id = 0; kernel_id < 8; kernel_id++) {
        kernel_ids.push_back(12+kernel_id); // for 256-bit
        kernel_ids.push_back(20+kernel_id); // for 512-bit
    }*/
    std::cout << "Starting 1x-" << NUM_KERNELS << "x Parallel Kernels 512-bit" << std::endl;
    std::vector<size_t> kernel_ids;
    for(int num_kernels = 0; num_kernels < NUM_KERNELS; num_kernels++) {
        kernel_ids.push_back(num_kernels); // for 512-bit
        run_parallel_kernels(kernel_ids, config);
    }
    kernel_ids.clear();
    run_parallel_kernels(kernel_ids, config);
    std::cout << "ALL KERNELS" << std::endl;
    kernel_ids.clear();
    for(int kernel_id = 0; kernel_id < NUM_KERNELS; kernel_id++) {
        kernel_ids.push_back(kernel_id);
    }
    run_parallel_kernels(kernel_ids, config);
    std::cout << "ALL 512-bit PAIRS" << std::endl;
    for(int kernel_id_a = 0; kernel_id_a < NUM_KERNELS; kernel_id_a++) {
        for(int kernel_id_b = 0; kernel_id_b < NUM_KERNELS; kernel_id_b++) {
            run_parallel_kernels(std::vector<size_t>{kernel_id_a, kernel_id_b}, config);
        }
    }
    std::cout << "Summary Bandwidths:" << std::endl;
    for(int i = 0; i < NUM_KERNELS; i++) {
        for(int j = 0; j < NUM_KERNELS; j++) {
            std::cout << co_run_bandwidths[i][j] << ",\t";
        }
        std::cout << std::endl;
    }
    std::cout << "Summary Efficiencies:" << std::endl;
    for(int i = 0; i < NUM_KERNELS; i++) {
        for(int j = 0; j < NUM_KERNELS; j++) {
            std::cout << co_run_cycle_efficiencies[i][j] << ",\t";
        }
        std::cout << std::endl;
    }
    /*std::cout << "ALL 512-bit TRIPLES" << std::endl;
    for(int kernel_id_a = 0; kernel_id_a < 8; kernel_id_a++) {
        for(int kernel_id_b = kernel_id_a + 1; kernel_id_b < 8; kernel_id_b++) {
            for(int kernel_id_c = kernel_id_b + 1; kernel_id_c < 8; kernel_id_c++) {
            run_parallel_kernels(std::vector<size_t>{kernel_id_a, kernel_id_b, kernel_id_c}, config);
        }
    }*/
    std::cout << "ALL MEMORY HASHES MATCHED CORRECT ANSWER " << expected_hash << std::endl;
    return 0;
    /*kernel_ids.clear();
    for(size_t id = 0; id < 28; id++) {
        kernel_ids.push_back(id); // for ALL
    }
    run_parallel_kernels(kernel_ids);*/

    /*std::cout << "Now ALL Kernels in parallel!" << std::endl;
    std::vector<xrt::run> runs;
    runs.reserve(20);
    uint32_t num_blocks = num_buffer_elems / 16; // For 512 wide
    auto start_time = std::chrono::high_resolution_clock::now();
    size_t total_elements_that_must_be_transfered = 0;
    for(size_t kernel_id = 0; kernel_id < 20; kernel_id++) {
        auto& kernel = kernels[kernel_id];

        runs.push_back(kernel(bench_buffer, num_blocks, config_u32));

        total_elements_that_must_be_transfered += num_blocks * (1 << (kernel_id / 4));
    }
    for(size_t kernel_id = 0; kernel_id < 20; kernel_id++) {
        runs[kernel_id].wait();
    }
    auto time_taken = std::chrono::high_resolution_clock::now() - start_time;

    double expected_time_at_max_rate = num_blocks / clock_freq;
    double time_in_seconds = time_taken.count() / 1000000000.0;
    double read_bw = double(total_elements_that_must_be_transfered) / 1000000000.0 / time_in_seconds * sizeof(uint32_t); // GB/s
    double percent_cycles_used = expected_time_at_max_rate / time_in_seconds;
    std::cout << "ALL Kernels in parallel: \tTime taken: " << time_in_seconds << "s, BW: " << read_bw << "GB/s. Cycles used ratio: " << percent_cycles_used << std::endl;

    std::cout << "Individual Kernels again for results" << std::endl;
    for(size_t kernel_id = 0; kernel_id < 20; kernel_id++) {
        auto& kernel = kernels[kernel_id];
        size_t num_elements_per_block = 1 << (kernel_id / 4);
        uint32_t num_blocks = num_buffer_elems / num_elements_per_block;

        // kernel.write_register(0x010, bench_buffer);
        // kernel.write_register(0x018, num_blocks);
        // kernel.write_register(0x000, 0b0001); // START

        auto start_time = std::chrono::high_resolution_clock::now();
        xrt::run run_output_kernel = kernel(bench_buffer, num_blocks, config_u32);

        run_output_kernel.wait();
        auto time_taken = std::chrono::high_resolution_clock::now() - start_time;


        double expected_time_at_max_rate = num_blocks / clock_freq;
        double time_in_seconds = time_taken.count() / 1000000000.0;
        double read_bw = double(num_buffer_elems) / 1000000000.0 / time_in_seconds * sizeof(uint32_t); // GB/s
        double percent_cycles_used = expected_time_at_max_rate / time_in_seconds;
        std::cout << kernel_names[kernel_id] << "\tTime taken: " << time_in_seconds << "s, BW: " << read_bw << "GB/s. Cycles used ratio: " << percent_cycles_used << std::endl;
    }*/

    /*std::cout << "Results:" << std::endl;
    kernels.clear(); // Destroy all kernels first, so we don't conflict
    //runs.clear();
    uint32_t expected = 0;
    for(uint32_t v : host_buffer) {
        expected ^= v;
    }
    std::cout << "Expected: " << expected << std::endl;
    std::cout << "Reading Results" << std::endl;

    for(const char* s : kernel_names) {
        std::cout << s << std::endl;
        xrt::ip user_manage = xrt::ip(vck5000, xclbin_handle, s);

        std::cout << "ctrl: " << user_manage.read_register(0x000) << std::endl;
        std::cout << "Addr_low: " << user_manage.read_register(0x010) << std::endl;
        std::cout << "Addr_high: " << user_manage.read_register(0x014) << std::endl;
        std::cout << "Setting: " << user_manage.read_register(0x018) << std::endl;
        std::cout << "Count: " << user_manage.read_register(0x01c) << std::endl;
        std::cout << "Cycles taken: " << user_manage.read_register(0x020) << std::endl;
        std::cout << "Result: " << user_manage.read_register(0x024) << std::endl;

        //user_manage.write_register(0x0)
    }



    return 0;*/

    /*std::cout << "Starting RTL Kernel" << std::endl;
    xrt::run run_sus_kernel = sus_kernel(buffer_a, buffer_b, buffer_c, buffer_d);
    std::cout << "Waiting for RTL Kernel to finish" << std::endl;
    run_sus_kernel.wait();
    std::cout << "RTL kernel done" << std::endl;
    //usleep(1000 * 1000);

    buffer_c.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    buffer_c.read(&return_c, 32, 0);
    buffer_d.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    buffer_d.read(&return_d, 32, 0);

    std::cout << "Read back result C: {";
    for(int i = 0; i < 8; i++) {
        std::cout << return_c[i] << ", ";
    }
    std::cout << "}" << std::endl;
    std::cout << "Read back result D: {";
    for(int i = 0; i < 8; i++) {
        std::cout << return_d[i] << ", ";
    }
    std::cout << "}" << std::endl;
    //usleep(1000 * 200);
    //run_axi_stream_example.wait();


    return 0;*/


    /*std::cout << "Starting HLS kernel" << std::endl;
    xrt::run run_output_kernel = output_kernel(output_buffer);

    auto my_kernel_thing_as_user = xrt::ip(vck5000, xclbin_handle, "axi_stream_example:{axi_stream_example0}");

    for (int i = 0; i < 600; i++) {
        int addr = i * 4;
        std::cout << "addr " << std::hex << addr << ": " << std::dec << my_kernel_thing_as_user.read_register(addr) << std::endl;
    }
    return 0;*/

    //uint64_t a = i + 5;
    //uint64_t b = i + 5;
    //std::cout << "Args: " << a << " and " << b << std::endl;
    /*std::cout << "Starting RTL kernel" << std::endl;
    std::cout << "Initial ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "Initial A: " << my_kernel_thing_as_user.read_register(0x010) << std::endl;
    std::cout << "Initial B: " << my_kernel_thing_as_user.read_register(0x014) << std::endl;
    std::cout << "Initial C: " << my_kernel_thing_as_user.read_register(0x018) << std::endl;
    my_kernel_thing_as_user.write_register(0x010, 40);
    my_kernel_thing_as_user.write_register(0x014, 50);
    my_kernel_thing_as_user.write_register(0x000, 0b0001);
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "ctrl: " << my_kernel_thing_as_user.read_register(0x000) << std::endl;
    std::cout << "A: " << my_kernel_thing_as_user.read_register(0x010) << std::endl;
    std::cout << "B: " << my_kernel_thing_as_user.read_register(0x014) << std::endl;
    std::cout << "C: " << my_kernel_thing_as_user.read_register(0x018) << std::endl;*/
}
