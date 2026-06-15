#!/bin/bash
#SBATCH -t 1-00:00:00
#SBATCH --array 1-8
#SBATCH --cpus-per-task 32
#SBATCH --mem-per-cpu 2G
#SBATCH -J many_builds
#SBATCH -A pc2-mitarbeiter
#SBATCH -p normal

## Modules for U280 development
ml fpga xilinx/xrt/2.16
export XILINXD_LICENSE_FILE=27000@kiso.uni-paderborn.de
export LM_LICENSE_FILE=27000@kiso.uni-paderborn.de

make -j10 U280/overlay_hw.xclbin BIN_DIR=U280_try_$SLURM_ARRAY_TASK_ID
