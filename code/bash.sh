#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:00:00
#SBATCH -J job_name
#SBATCH --mail-type=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools
module load ....

# Your commands

