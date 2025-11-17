#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J "max in flight benchmark"
#SBATCH -p hacc

source ~/get_vck.sh
xbutil reset --force --device 0000:e1:00.1
make main.x && ./main.x e bigBench20x256_FIX.xclbin


