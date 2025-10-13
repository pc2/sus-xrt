#!/bin/bash
#SBATCH -t 8:00:00
#SBATCH -J "Build HACC"
#SBATCH -p hacc

source ~/get_vck.sh
# make packaging/axi_stream_example.xo
make clean
make hw/overlay.xclbin
make sw/main.x
