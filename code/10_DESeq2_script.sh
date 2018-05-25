#
directory <- "/home/erwehe/github/ga18/analyses/07_HTSeq_output"
sampleFiles <- grep(".txt",list.files(directory),value=TRUE)
sampleCondition <- c("cont","cont","mineral","mineral","cont")
sampleName <- c("88_cont_B7","89_cont_B1","90_mineral_14B","91_mineral_14C","92_cont_14C")
sampleTable <- data.frame(sampleName=sampleName, fileName=sampleFiles, condition=sampleCondition)
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~condition)
ddsHTSeq
# class: DESeqDataSet 
# dim: 2808 5 
# metadata(1): version
# assays(1): counts
# rownames(2808): NCEGIGAI_00001 NCEGIGAI_00002 ... NCEGIGAI_02869
#  NCEGIGAI_02870
# rowData names(0):
# colnames(5): 88_cont_B7 89_cont_B1 90_mineral_14B 91_mineral_14C
#  92_cont_14C
# colData names(1): condition
keep <- rowSums(counts(ddsHTSeq)) > 0
ddsHTSeq <- ddsHTSeq[keep,]
ddsHTSeq
# class: DESeqDataSet 
# dim: 2414 5 
# metadata(1): version
# assays(1): counts
# rownames(2414): NCEGIGAI_00001 NCEGIGAI_00022 ... NCEGIGAI_02686
#  NCEGIGAI_02688
# rowData names(0):
# colnames(5): 88_cont_B7 89_cont_B1 90_mineral_14B 91_mineral_14C
#  92_cont_14C
# colData names(1): condition
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("cont","mineral"))
#
ddsHTSeq <- DESeq(ddsHTSeq)
res <- results(ddsHTSeq, contrast=c("condition","cont","mineral"))
res
#
resultsNames(ddsHTSeq)
resLFC <- lfcShrink(ddsHTSeq, coef="condition_mineral_vs_cont", type="apeglm")
resLFC
# NCEGIGAI_00001 0.10318573    0.008013238 0.3238070 0.8609306        NA
# NCEGIGAI_00022 0.15605923    0.009942966 0.3238577 0.9668962        NA
# NCEGIGAI_00023 0.10233198    0.007980873 0.3238063 0.8590353        NA
# NCEGIGAI_00037 0.05116599    0.005070753 0.3238041 0.6959588        NA
# NCEGIGAI_00038 6.38686971    0.002520419 0.3041046 0.9830833        NA
# ...                   ...            ...       ...       ...       ...
# NCEGIGAI_02666 0.10403949    0.008045467 0.3238076 0.8628160        NA
# NCEGIGAI_02670 0.05116599    0.005070753 0.3238041 0.6959588        NA
# NCEGIGAI_02674 1.95496487   -0.023330659 0.3190132 0.7094717        NA
# NCEGIGAI_02686 0.67703506   -0.008656937 0.3221721 0.7715573        NA
# NCEGIGAI_02688 0.05201974    0.005121097 0.3238038 0.6978552        NA
library("BiocParallel")
register(MulticoreParam(4))
resOrdered <- res[order(res$pvalue),]
summary(res)
#
sum(res$padj < 0.05, na.rm=TRUE)
# 98
res05 <- results(ddsHTSeq, alpha=0.05)
summary(res05)
# out of 2414 with nonzero total read count
# adjusted p-value < 0.05
# LFC > 0 (up)     : 53, 2.2% 
# LFC < 0 (down)   : 55, 2.3% 
# outliers [1]     : 0, 0% 
# low counts [2]   : 1438, 60% 
# (mean count < 17)
sum(res05$padj < 0.05, na.rm=TRUE)
# 108
png(file='01_plotMA_contvsmineral.png', width=800, height=650, res=200)
plotMA(res, ylim=c(-2,2))
dev.off()
#
png(file='02_plotMA_resLFC_contvsmineral.png', width=900, height=650, res=200)
plotMA(resLFC, ylim=c(-2,2))
dev.off()
#
png(file='03_plotCounts_resLFC_condition.jpg', width=800, height=650, res=200)
plotCounts(ddsHTSeq, gene=which.min(resLFC$padj), intgroup="condition")
dev.off()
#
library("pheatmap")
select <- order(rowMeans(counts(ddsHTSeq,normalized=TRUE)), decreasing=TRUE)[1:91]
ntd <- normTransform(ddsHTSeq)
png(file='05_pheatmap_92genes.png', width=800, height=650, res=200)
pheatmap(assay(ntd)[select,], cluster_rows=FALSE, show_rownames=FALSE,cluster_cols=TRUE)
dev.off()
#
vsd <- vst(ddsHTSeq, blind=FALSE)
sampleDists <- dist(t(assay(vsd)))
library("RColorBrewer")
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(vsd$condition)
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
png(file='06_pheatmapBLUE_distVSD.png', width=800, height=650, res=200)
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, \
clustering_distance_cols=sampleDists, col=colors)
dev.off()
#
png(file='07_plotPCA_vsd.png', width=800, height=650, res=200)
plotPCA(vsd, intgroup=c("condition"))
dev.off()
