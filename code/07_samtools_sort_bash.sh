#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J samtools_sort
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools
module load samtools/1.6

# Your commands
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/30out.bam > 30_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/31out.bam > 31_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/32out.bam > 32_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/33out.bam > 33_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/88out.bam > 88_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/89out.bam > 89_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/90out.bam > 90_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/91out.bam > 91_sorted_out.bam;\
samtools sort -n /home/erwehe/github/ga18/analyses/06_BWA_mem_output/92out.bam > 92_sorted_out.bam;\









