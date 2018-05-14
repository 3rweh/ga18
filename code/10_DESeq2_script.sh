directory <- "/home/erwehe/github/ga18/analyses/07_HTSeq_output"
sampleFiles <- grep("count",list.files(directory),value=TRUE)
sampleCondition <- sub("(.*count).*","\\1",sampleFiles)
sampleTable <- data.frame(sampleName=sampleFiles, fileName=sampleFiles, condition=sampleCondition)
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable=sampleTable, directory=directory, design=~condition)
ddsHTSeq

