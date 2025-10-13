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
    std::string xclbin_name = "hw/overlay.xclbin";
    
    xrt::device vck5000 = xrt::device("0000:e1:00.1");
    std::cout << "Got VCK5000" << std::endl;

    std::cout << "device name:     " << vck5000.get_info<xrt::info::device::name>() << "\n";
    std::cout << "device bdf:      " << vck5000.get_info<xrt::info::device::bdf>() << "\n";


    xrt::uuid   xclbin_handle = vck5000.load_xclbin(xclbin_name);
    std::cout << "Got XCLBIN" << std::endl;

    xrt::kernel output_kernel(vck5000, xclbin_handle, "output_kernel:{output_kernel0}");

    auto output_kernel_bankid = output_kernel.group_id(0);
    xrt::bo output_buffer = xrt::bo(vck5000, 4, output_kernel_bankid);
    
    
    std::cout << "Starting HLS kernel" << std::endl;
    xrt::run run_output_kernel = output_kernel(output_buffer);
    
    std::cout << "Starting RTL kernel" << std::endl;
    xrt::kernel axi_stream_example(vck5000, xclbin_handle, "axi_stream_example:{axi_stream_example0}");
    xrt::run run_axi_stream_example = axi_stream_example(25, 26, 27);
    std::cout << "Waiting RTL kernel" << std::endl;
    run_axi_stream_example.wait();
    std::cout << "Waiting HLS kernel" << std::endl;
    run_output_kernel.wait();
    //usleep(1000 * 1000);

    uint32_t c = 0;
    output_buffer.sync(XCL_BO_SYNC_BO_FROM_DEVICE);
    output_buffer.read(&c, 4, 0);

    std::cout << "Read back result: " << c << std::endl << std::flush;
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
