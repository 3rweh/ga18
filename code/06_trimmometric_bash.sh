#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J trimmomatic_RNAraw
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools 

# Your commands
trimmomatic
/proj/g2018003/nobackup/private/christel_2017/RNA_raw_data/ERR*.fastq.gz
