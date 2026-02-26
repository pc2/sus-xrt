# Tests
Each test is a flat folder with all user-edited files in the top of the hierarchy. For a build for a specific platform, (VCK5000, U280), a subfolder is created to manage all the files Vivado, v++ and xsim generate. 
To create artifacts, run make from the top folder. 

For instance, to build the burst writer test for emulation:
`burst_writer/$ make TARGET=U280 U280/overlay_hw_emu.xclbin`

And for actual synthesis:
`burst_writer/$ make TARGET=U280 U280/overlay_hw.xclbin`

The executable can be built as:
`burst_writer/$ make main.x`

But should be run from the specified target folder, such that it targets the correct xclbin. This also ensures all simulation files are dumped in that target folder, without cluttering the main folder. 
For easy rebuilds while developing, I stay in the target folder, and simply run:
`burst_writer/U280/$ make -C .. main.x && ../main.x u`

## Synthesis
Source the modules:
`./$ source u280_modules.sh`

Build the bitstream:
`burst_writer/$ make TARGET=U280 U280/overlay_hw.xclbin`

Build the executable:
`burst_writer/$ make main.x`

Run the executable **from the target folder** on an FPGA node:
`burst_writer/U280/$ ../main.x a`

`../main.x a` or `../main.x e` use the synthesized `./overlay_hw.xclbin` with FPGA `0000:a1:00.1` and `0000:e1:00.1` respectively. 

For easier development, I reccomend combining building main.x with the run command:
`burst_writer/U280/$ make -C .. main.x && ../main.x a`

## Emulation
Source the modules:
`./$ source u280_modules.sh`

Build the bitstream:
`burst_writer/$ make TARGET=U280 U280/overlay_hw_emu.xclbin`

Build the executable:
`burst_writer/$ make main.x`

**From the target folder: enable emulation**: `burst_writer/U280/$ source ../../u280_emu.sh -s on`

Run the executable **from the target folder**:
`burst_writer/U280/$ ../main.x u`

`../main.x u` uses `./overlay_hw_emu.xclbin` for emulation. 

For easier development, I reccomend combining building main.x with the run command:
`burst_writer/U280/$ make -C .. main.x && ../main.x u`
