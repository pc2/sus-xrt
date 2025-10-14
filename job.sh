#!/bin/bash
#SBATCH -t 8:00:00
#SBATCH -J "Build HACC"
#SBATCH -p hacc

source ~/get_vck.sh
make
