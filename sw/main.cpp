#include "experimental/xrt_ip.h"
#include "experimental/xrt_uuid.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_bo.h"

#include <cstdint>
#include <string>
#include <iomanip>

#include <unistd.h>

int main()
{
    //std::string xclbin_name = "hw/overlay_hw.xclbin";
    //xrt::device vck5000 = xrt::device("0000:e1:00.1");
    std::string xclbin_name = "hw/overlay_hw_emu.xclbin";
    xrt::device vck5000 = xrt::device(0); // For hw_emu
    std::cout << "Got VCK5000" << std::endl;

    std::cout << "device name:     " << vck5000.get_info<xrt::info::device::name>() << "\n";
    std::cout << "device bdf:      " << vck5000.get_info<xrt::info::device::bdf>() << "\n";


    xrt::uuid   xclbin_handle = vck5000.load_xclbin(xclbin_name);
    std::cout << "Got XCLBIN" << std::endl;

    std::cout << "Making RTL kernel" << std::endl;
    xrt::kernel sus_kernel(vck5000, xclbin_handle, "sus_kernel:{sus_kernel0}");

    std::cout << "Making Buffers" << std::endl;
    xrt::bo buffer_a = xrt::bo(vck5000, 32, sus_kernel.group_id(0));
    xrt::bo buffer_b = xrt::bo(vck5000, 32, sus_kernel.group_id(1));
    xrt::bo buffer_c = xrt::bo(vck5000, 32, sus_kernel.group_id(2));
    xrt::bo buffer_d = xrt::bo(vck5000, 32, sus_kernel.group_id(3));

    uint32_t values_a[8] = {123456, 10, 100, 1000, 10000, 100000, 1000000, 10000000};
    uint32_t values_b[8] = {9123456, 910, 9100, 91000, 910000, 9100000, 91000000, 910000000};
    uint32_t return_c[8];
    uint32_t return_d[8];
    std::cout << "Writing A" << std::endl;
    buffer_a.write(&values_a, 32, 0);
    buffer_a.sync(XCL_BO_SYNC_BO_TO_DEVICE);
    std::cout << "Writing B" << std::endl;
    buffer_b.write(&values_b, 32, 0);
    buffer_b.sync(XCL_BO_SYNC_BO_TO_DEVICE);

    std::cout << "Starting RTL Kernel" << std::endl;
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


    return 0;


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
