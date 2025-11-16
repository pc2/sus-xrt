# AXI Slaves and Masters for XRT
[SUS](https://github.com/pc2/sus-compiler) library that provides AXI slaves and masters for Xilinx' [XRT](https://github.com/Xilinx/XRT)

Basics that are provided: 
- AXI control slave: Provides input & output registers. Output registers only useable in XRT User-Managed Kernels
- AXI Memory master: Simple low-bandwidth DDR read & write
- AXI Memory master: High-bandwidth bursting AXI reader
- AXI Memory master: (Unfinished) High-bandwidth bursting AXI writer

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

![Programmable Logic NoC](measurements/24x512_noc.png) (Observe the NoC endpoint isn't directly connected to the two pink kernels - Kernel 1 and 24 - the worst pairing in the conflicts benchmark)

### Misc
#### Around 460MHz 256-bit AXI readers attain identical bandwidth to 512-bit readers. 

#### ArCACHE[1] bit does not seem to have an effect
