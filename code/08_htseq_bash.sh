#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:30:00
#SBATCH -J bwa_analysis
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools
module load htseq/0.9.1

# Your code


