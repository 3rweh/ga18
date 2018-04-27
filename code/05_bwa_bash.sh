#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:30:00
#SBATCH -J bwa_analysis
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools
module load bwa/0.7.17

# Your commands
bwa index -p index_BWA /home/erwehe/github/ga18/analyses/02_genome_assembly/leptospirillum_assembly_result.contigs.fasta;\
bwa mem index_BWA \
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_P1.trim.fastq.gz \
/home/erwehe/github/ga18/analyses/01_preprocessing/ERR2036629_P2_trim.fastq.gz | samtools view -bShu - | samtools sort - 29_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036630_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036630_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 30_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036631_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036631_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 31_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036632_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036632_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 32_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036633_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2036633_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 33_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117288_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117288_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 88_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117289_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117289_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 89_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117290_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117290_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 90_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117291_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117291_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 91_bwa_mem.bam.sorted;\
bwa mem index_BWA \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117292_P1.trim.fastq.gz \
/proj/g2018003/nobackup/private/christel_2017/RNA_trimmed_reads/ERR2117292_P2.trim.fastq.gz | samtools view -bShu - | samtools sort - 92_bwa_mem.bam.sorted
