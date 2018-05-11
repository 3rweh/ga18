#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J blastp_with_prokkaresult
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools blast/2.6.0+

# Your code
blastp -db nr -query /home/erwehe/github/ga18/analyses/03_genome_annotation/prokka/leptospir.faa \
-out /home/erwehe/github/ga18/analyses/08_blastp_output/blastp_out.txt -outfmt 6 -max_target_seqs 20
