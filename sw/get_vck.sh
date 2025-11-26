#!/bin/bash

module reset

## Modules for AIE development
ml fpga xilinx/xrt/2.16 vis Graphviz
export XILINXD_LICENSE_FILE=27000@kiso.uni-paderborn.de
export LM_LICENSE_FILE=27000@kiso.uni-paderborn.de

module load fpga/xilinx/vivado
ml swap xilinx/u280 xilinx/vck5000
ml swap xilinx/vitis/23.2 xilinx/vitis/23.1

