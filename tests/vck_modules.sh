#!/bin/bash

module reset

## Modules for AIE development
ml fpga xilinx/xrt/2.16 xilinx/vck5000 xilinx/vitis/23.1
export XILINXD_LICENSE_FILE=27000@kiso.uni-paderborn.de
export LM_LICENSE_FILE=27000@kiso.uni-paderborn.de

