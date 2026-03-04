# Tests
**Before Starting, load the modules:**
`./$ source u280_modules.sh` or `./$ source vck5000_modules.sh`

Each test is a flat folder with all user-edited files in the top of the hierarchy. For a build for a specific platform, (VCK5000, U280), a subfolder is created to manage all the files Vivado, v++ and xsim generate. 
To create artifacts, run `make` from the top folder. 

For instance, to build the burst writer test for emulation: (~20 minutes)
`burst_writer/$ make U280/overlay_hw_emu.xclbin`

And for actual synthesis: (~2 hours)
`burst_writer/$ make U280/overlay_hw.xclbin`

The executable can be built as:
`burst_writer/$ make main.x`

Emulate with the Vivado GUI: (Requires `U280/overlay_hw_emu.xclbin`)
`burst_writer/$ make U280/emulate`

Emulate as batch (shouldn't be interrupted (CTRL-C-ed)): (Requires `U280/overlay_hw_emu.xclbin`)
`burst_writer/$ make U280/emulate-batch`

Run on an FPGA node with: (Requires `U280/overlay_hw.xclbin`)
`burst_writer/$ make U280/run`
