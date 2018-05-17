#
directory <- "/home/erwehe/github/ga18/analyses/07_HTSeq_output"
sampleFiles <- grep(".txt",list.files(directory),value=TRUE)
sampleCondition <- c("cont","cont","mineral","mineral","cont")
sampleName <- c("88_cont_B7","89_cont_B1","90_mineral_14B","91_mineral_14C","92_cont_14C")
sampleTable <- data.frame(sampleName=sampleName, fileName=sampleFiles, condition=sampleCondition)
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~condition)
ddsHTSeq
#
keep <- rowSums(counts(ddsHTSeq)) > 0
ddsHTSeq <- ddsHTSeq[keep,]
#
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("cont","mineral"))
#
ddsHTSeq <- DESeq(ddsHTSeq)
res <- results(ddsHTSeq, contrast=c("condition","cont","mineral"))
res
#
resultsNames(ddsHTSeq)
resLFC <- lfcShrink(ddsHTSeq, coef="condition_mineral_vs_cont", type="apeglm")
resLFC
#
library("BiocParallel")
register(MulticoreParam(4))
resOrdered <- res[order(res$pvalue),]
summary(res)
#
sum(res$padj < 0.1, na.rm=TRUE)
#
res05 <- results(ddsHTSeq, alpha=0.05)
summary(res05)
#
sum(res05$padj < 0.05, na.rm=TRUE)
#
library("IHW")
resIHW <- results(ddsHTSeq, filterFun=ihw)
summary(resIHW)
#
sum(resIHW$padj < 0.1, na.rm=TRUE)
#
metadata(resIHW)$ihwResult
#
jpeg('01_plotMA_contvsmineral.jpg')
plotMA(res, ylim=c(-2,2))
dev.off()
#
jpeg('02_plotMA_resLFC_contvsmineral.jpg')
plotMA(res, ylim=c(-2,2))
dev.off()
#
jpeg('03_plotCounts_resLFC_condition.jpg')
plotCounts(ddsHTSeq, gene=which.min(resLFC$padj), intgroup="condition")
dev.off()
#
sampleDists <- dist(t(assay(vsd)))
library("RColorBrewer")
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(vsd$condition)
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
jpeg('06_pheatmapBLUE_distVSD.jpg')
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, \
clustering_distance_cols=sampleDists, col=colors)
dev.off()
#
jpeg('07_plotPCA_vsd.jpg')
plotPCA(vsd, intgroup=c("condition"))
dev.off()
