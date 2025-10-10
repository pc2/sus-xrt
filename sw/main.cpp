#include "experimental/xrt_ip.h"
#include "experimental/xrt_uuid.h"
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_bo.h"

#include <cstdint>
#include <string>

#include <unistd.h>

int main()
{
    std::string xclbin_name = "hw/overlay.xclbin";
    
    xrt::device vck5000 = xrt::device("0000:a1:00.1");
    std::cout << "Got VCK5000" << std::endl;

    std::cout << "device name:     " << vck5000.get_info<xrt::info::device::name>() << "\n";
    std::cout << "device bdf:      " << vck5000.get_info<xrt::info::device::bdf>() << "\n";


    xrt::uuid   xclbin_handle = vck5000.load_xclbin(xclbin_name);
    std::cout << "Got XCLBIN" << std::endl;

    xrt::kernel output_kernel(vck5000, xclbin_handle, "output_kernel:{output_kernel0}");

    auto output_kernel_bankid = output_kernel.group_id(0);
    xrt::bo output_buffer = xrt::bo(vck5000, 4, output_kernel_bankid);
    
    xrt::kernel axi_stream_example(vck5000, xclbin_handle, "axi_stream_example:{axi_stream_example0}");

    xrt::run run_output_kernel = xrt::run(output_kernel);
    run_output_kernel.set_arg(0, output_buffer);

    std::cout << "Starting HLS kernel" << std::endl;
    run_output_kernel.start();
    usleep(1000 * 1000);
    
    xrt::run run_axi_stream_example = xrt::run(axi_stream_example);
    run_axi_stream_example.set_arg(0, 42);
    run_axi_stream_example.set_arg(1, 69);

    std::cout << "Starting RTL kernel" << std::endl;
    run_axi_stream_example.start();

    run_output_kernel.wait();
    run_axi_stream_example.wait();

    uint32_t c = 0;
    output_buffer.read(&c, 4, 0);

    std::cout << "Read back result: " << c << std::endl;

    return 0;
}
