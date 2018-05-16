directory <- "/home/erwehe/github/ga18/analyses/07_HTSeq_output"
sampleFiles <- grep(".txt",list.files(directory),value=TRUE)
sampleCondition <- sub("(.*cont).*","\\1",sampleFiles)
sampleTable <- data.frame(sampleName=sampleFiles, fileName=sampleFiles, condition=sampleCondition)
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~condition)
ddsHTSeq
keep <- rowSums(counts(ddsHTSeq)) > 0
ddsHTSeq <- ddsHTSeq[keep,]
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("cont","mineral"))
ddsHTSeq <- DESeq(ddsHTSeq)
res <- results(ddsHTSeq, contrast=c("condition","cont","mineral"))


