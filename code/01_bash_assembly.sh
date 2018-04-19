#!/bin/bash -L

#SBATCH -A g2018003_6
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 13:00:00
#SBATCH -J genome_assembly
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools canu/1.7

# Your commands
canu \
-p leptospirillum_assembly_result -d /home/erwehe/github/ga18/analyses/02_genome_assembly \
genomeSize=3.6m \ 
stopOnReadQuality=false \
-pacibio-raw /proj/g2018003/nobackup/private/christel_2017/DNA_raw_data/ERR*.fastq.gz
