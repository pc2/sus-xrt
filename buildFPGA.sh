#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J "Build HACC"
#SBATCH -p hacc

source ~/get_vck.sh
make
