#!/bin/bash -l

#SBATCH -A g2018003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J HTSeq_count
#SBATCH --mail-typ=ALL
#SBATCH --mail-user erikhedman2@gmail.com

# Load modules
module load bioinfo-tools
module load htseq/0.9.1

# Your code
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/29_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/29_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/30_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/30_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/31_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/31_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/32_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/32_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/33_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/33_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/88_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/88_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/89_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/89_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/90_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/90_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/91_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/91_count.txt;\
python -m HTSeq.scripts.count -f bam -t CDS -i ID \
/home/erwehe/github/ga18/analyses/06_BWA_mem_output/92_sorted_out.bam \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/leptospir_copy.gff > \
/home/erwehe/github/ga18/analyses/07_HTSeq_output/92_count.txt;\
