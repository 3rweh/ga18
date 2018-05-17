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
plotMA(res, ylim=c(-2,2))

