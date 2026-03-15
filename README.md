# AXI Slaves and Masters for XRT
[SUS](https://github.com/pc2/sus-compiler) library that provides AXI slaves and masters for Xilinx' [XRT](https://github.com/Xilinx/XRT)

This Library Provides: 
- AXI control slave: Provides input & output registers. Output registers only useable in XRT User-Managed Kernels
- Low-bandwidth AXI reader
- Low-bandwidth AXI writer
- High-bandwidth bursting AXI reader
- High-bandwidth bursting AXI writer

## Usage
### `axi_ctrl_slave`
This module is the interface of your [XRT kernel](https://xilinx.github.io/XRT/master/html/xrt_native_apis.html#kernel-and-run). It is responsible the starting and stopping of your kernel, and for accepting the parameters your kernel has, as well as returning the results. (Note: This is only for small results. If you wish to work with larger data structures you should use the memory interfaces instead.)

The control slave maps the incoming AXI4-Lite address space to an array of 32-bit registers. Register `0x000` is used as the control register, to which `0x00000001` is written to start the kernel. Once running, the control register is continuously polled, until it returns `0x00000004` to indicate it is done. 

Input registers start from `0x010`, and increment by 4 bytes for each register. So going `0x010`, `0x014`, `0x018`, etc. Output registers start after the last input register, and continue similarly. 

**Usage example:**
```sus
module Top {
    domain aclk
    input bool aresetn
    axi_ctrl_slave #(NUM_INPUT_REGS: 2, NUM_OUTPUT_REGS: 1, ADDR_WIDTH: 12, AXI_WIDTH: 32) ctrl

    gen int ATO = pow2#(E: 12)
    
    // Export AXI4-Lite interface
    domain axi_control
    input  int#(FROM: 0, TO: ATO)   s_axi_control_awaddr
    input  bool                     s_axi_control_awvalid
    output bool                     s_axi_control_awready = ctrl.awready
    input  bool[32]                 s_axi_control_wdata
    input  bool[4]                  s_axi_control_wstrb
    input  bool                     s_axi_control_wvalid
    output bool                     s_axi_control_wready  = ctrl.wready
    output bool[2]                  s_axi_control_bresp   = ctrl.bresp
    output bool                     s_axi_control_bvalid  = ctrl.bvalid
    input  bool                     s_axi_control_bready
    input  int#(FROM: 0, TO: ATO)   s_axi_control_araddr
    input  bool                     s_axi_control_arvalid
    output bool                     s_axi_control_arready = ctrl.arready
    output bool[32]                 s_axi_control_rdata   = ctrl.rdata
    output bool[2]                  s_axi_control_rresp   = ctrl.rresp
    output bool                     s_axi_control_rvalid  = ctrl.rvalid
    input  bool                     s_axi_control_rready
    ctrl.awaddr  =         s_axi_control_awaddr
    ctrl.awvalid =         s_axi_control_awvalid
    ctrl.wdata   =         s_axi_control_wdata
    ctrl.wstrb   =         s_axi_control_wstrb
    ctrl.wvalid  =         s_axi_control_wvalid
    ctrl.bready  =         s_axi_control_bready
    ctrl.araddr  =         s_axi_control_araddr
    ctrl.arvalid =         s_axi_control_arvalid
    ctrl.rready  =         s_axi_control_rready

    state bool stored_sum_valid
    state int stored_sum
    when ctrl.start {
        stored_sum_valid = true
        stored_sum = ctrl.input_regs[0] + ctrl.output_regs[0] mod pow2#(E: 32)
    }

    when stored_sum_valid {
        ctrl.finish([stored_sum])
        stored_sum_valid = false
    }

    when !aresetn {
        ctrl.rst()
        stored_sum_valid = false
    }
}
```
To make your kernel parameters visible to XRT, you must declare them in your `pack_kernel.tcl`, like so:
```tcl
# ... other kernel packing stuff
set CTRL_ADDR_BLOCK [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps s_axi_control -of_objects [ipx::current_core]]]

ipx::add_register CTRL $CTRL_ADDR_BLOCK
set_property description    {Control Signals} [ipx::get_registers CTRL -of_objects $CTRL_ADDR_BLOCK]
set_property address_offset {0x00}            [ipx::get_registers CTRL -of_objects $CTRL_ADDR_BLOCK]
set_property size           {32}              [ipx::get_registers CTRL -of_objects $CTRL_ADDR_BLOCK]

ipx::add_register PARAM_A $CTRL_ADDR_BLOCK
set_property description    {Sum Param B}     [ipx::get_registers PARAM_A  -of_objects $CTRL_ADDR_BLOCK]
set_property address_offset {0x010}           [ipx::get_registers PARAM_A  -of_objects $CTRL_ADDR_BLOCK]
set_property size           {32}              [ipx::get_registers PARAM_A  -of_objects $CTRL_ADDR_BLOCK]

ipx::add_register PARAM_B $CTRL_ADDR_BLOCK
set_property description    {Sum Param B}     [ipx::get_registers PARAM_B  -of_objects $CTRL_ADDR_BLOCK]
set_property address_offset {0x014}           [ipx::get_registers PARAM_B  -of_objects $CTRL_ADDR_BLOCK]
set_property size           {32}              [ipx::get_registers PARAM_B  -of_objects $CTRL_ADDR_BLOCK]
# ... other kernel packing stuff
```
Output parameters can't be declared since XRT doesn't expose those for `xrt::kernel`. For those you have to use `xrt::ip`, and call `ip.read_register(0x018)` yourself. 

## Lessons Learned - VCK5000
Extrapolated from various benchmarks, more info in [MIXED.md](measurements/MIXED.md), [24x512.md](measurements/24x512.md), [20x256.md](measurements/20x256.md)

### Bandwidths
Single-Reader Measurements at 355.2MHz
| AXI Width | Bandwidth | % useful cycles |
| --- | ---       | ---  |
| 32  | 1.41GB/s  | 100% |
| 64  | 2.82GB/s  | 100% |
| 128 | 5.56GB/s  | 98%  |
| 256 | 10.50GB/s | 93%  |
| 512 | 13.55GB/s | 60%  |

The startup latency (so latency between a read request being made, and the first data element arriving) appears to be 70 cycles for 32-wide AXI, but 50 cycles for 64-wide. Larger widths weren't measured

#### Multi-reader bandwidth
(Combined from 512-bit@320MHz and 256-bit@348MHz benchmarks)

| #parallel | 512-bit BW (GB/s) | 256-bit BW (GB/s) |
| --- | --- | --- |
| 1   | 13.5623 | 10.4925 |
| 2   | 25.1748 | 20.9844 |
| 3   | 22.0688 | 27.6769 |
| 4   | 29.2881 | 33.6021 |
| 5   | 25.6728 | 31.8993 |
| 6   | 17.7485 | 37.9892 |
| 7   | 27.5624 | 44.2615 |
| 8   | 31.4736 | 48.7837 |
| 9   | 35.4239 | 44.8638 |
| 10  | 39.2506 | 49.1469 |
| 11  | 42.9778 | 29.0227 |
| 12  | 46.4071 | 46.3362 |
| 13  | 47.063  | 48.4111 |
| 14  | 50.8537 | 50.2339 |
| 15  | 54.0014 | 53.9341 |
| 16  | 47.826  | 53.3576 |
| 17  | 44.5466 | 56.3916 |
| 18  | 46.6465 | 57.1011 |
| 19  | 47.7573 | 54.6633 |
| 20  | 49.944  | 56.767  |
| 21  | 52.1049 |   N/A   |
| 22  | 51.6131 |   N/A   |
| 23  | 52.3697 |   N/A   |
| 24  | 47.9105 |   N/A   |

(we're simply starting from kernel #1, and adding kernels sequentially)

Total bandwidth does tend to increase with more readers, but some conflicts seem to cut the bandwidth significantly (Such as 256-bit/11 parallel). 

Peak bandwidth ever measured: **~57GB/s**. 

#### Conflicts
It appears that NoC interfaces on the same Vertical NoC conflict. Worse - NoC interfaces on the same VNoC sometimes conflict so badly that total bandwidth is less than if a single interface were communicating. 

![Conflicting NoCs](measurements/24x512_conflict.png)

#### Number of hard-logic NoC connection points: 23
If more memory masters than this are instantiated, programmable logic "virtual" NoC switches are instantiated. Single-interface bandwidth appears maintained, but multi-interface bandwidth on the same virtual NoC suffers tremendously. Recommendation: **Don't exceed 23 Interfaces**

![Programmable Logic NoC](measurements/24x512_noc.png)
Observe the NoC endpoint isn't directly connected to the two pink kernels - Kernel 1 and 24 - the worst pairing in the conflicts benchmark. Instead, the large blob of orange logic is the virtual extension to the NoC, which both kernels then connect to. 

#### Optimal MAX_IN_FLIGHT values on VCK5000
From benchmarking the 256-bit case, it appears for optimal bandwidth 64 elements over the burst size is good enough. For 512-bit, a slightly lower bound is good enough, and may allow smaller FIFOs. 
| AXI_WIDTH | MAX_IN_FLIGHT |
| --- | --- |
| 32  | 320 |
| 64  | 320 |
| 128 | 320 |
| 256 | 192 |
| 512 | 110 |

### Misc
- **Around 460MHz 256-bit AXI readers attain identical bandwidth to 512-bit readers**
- **ArCACHE[1] bit does not seem to have an effect**
- **The VCK5000 does not appear to have NUMA-like memory regions. While `kernel.group_id(0)` returns different values, buffers created with these have no appreciable difference in access bandwidth.**
- **There is only one Memory Bank**
- **No Host DMA is supported**
- **Rarely XRT has a 'blip', which includes a 500ms delay after a set of kernels finish**

## Lessons Learned - U280
- **On the U280, grouping multiple HBM banks together (a la `sp=burst_reader512_hbm_2x.m_axi:HBM[16:17]`) does not actually improve bandwidth, yet does introduce lots of cruft around the HBM interfaces**
