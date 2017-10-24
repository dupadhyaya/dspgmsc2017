
MergedDataset <- mergeRows(mydata, mydata1, common.only=FALSE)
MergedDataset <- merge(mydata, mydata1, all=TRUE, by="row.names")
rownames(MergedDataset) <- MergedDataset$Row.names
MergedDataset$Row.names <- NULL
AggregatedData<- aggregate(weight ~ gender + tumour, data=mydata, FUN=mean)
AggregatedData$wt2 <- with(AggregatedData, weight * .5)
AggregatedData$wt2 <- with(AggregatedData, weight * .5)
df9 <- subset(AggregatedData, subset=male)
df9 <- subset(AggregatedData, subset=gender='male')
df9 <- subset(AggregatedData, select=c(gender,tumour))
socialdata$variable <- 
  with(socialdata, 
  binVariable(Income, bins=3, 
  method='intervals', labels=c('L',
  'M','H')))
socialdata <- within(socialdata, {
  ic <- factor(Income, labels=c('a','b','c','d',
  'e','f','g','h'))
})
StackedData <- stack(Commodity[, c("Crude",
  "Gold")])
names(StackedData) <- c("variable", "factor")

