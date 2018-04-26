#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J trimmomatic_RNA_raw_data
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools 

# Your commands
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -threads 1 \
-trimlog /home/erwehe/github/ga18/analyses/01_preprocessing/logfile.sh \
# infiles
/proj/g2018003/nobackup/private/christel_2017/RNA_raw_data/ERR2036629_1.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_raw_data/ERR2036629_2.fastq.gz \
# outfiles
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_P1.trim.fastq.gz \
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_P2.trim.fastq.gz \
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_S1.trim.fastq.gz \
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_S2.trim.fastq.gz \
# :seed_mismatch:palindrome_clip:simple_clip
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
# :window_size:window_quality
SLIDINGWINDOW:1:3 \
MINLEN:40 \
# :target_length:strictness
MAXINFO:40:0.5 
