#!/bin/bash -L

#SBATCH -A g2018003_5
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:00:00
#SBATCH -J job_name
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools

# Your commands
canu \ -p 
