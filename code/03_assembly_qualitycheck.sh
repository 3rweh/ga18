#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J assembly_qualitycheck
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools python quast

# Your commands
quast.py -o /home/erwehe/github/ga18/analyses/ -R /proj/g2018003/nobackup/private/christel_2017/reference/OBMB01.fasta
/home/erwehe/github/ga18/analyses/02_genome_assembly/leptospirillum_assembly_result.contigs.fasta
