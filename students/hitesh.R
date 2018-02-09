train_set = read.csv(file = './housing_train.csv',stringsAsFactors = F)
train_set
test_set = read.csv(file = './housing_test.csv',stringsAsFactors = F)
test_set
str(train_set)
head(train_set)
names(train_set)
table(train_set$Street)
train_set$paved[train_set$Street == "Pave"] <- 1
train_set$paved[train_set$Street != "Pave"] <- 0
table(train_set$LotShape)
summary(train_set)
train_set$regshape[train_set$LotShape == "Reg"] = 1
train_set$regshape[train_set$LotShape != "Reg"] = 0
table(train_set$LandContour)
train_set$flat[train_set$LandContour == "Lvl"] = 1
train_set$flat[train_set$LandContour != "Lvl"] = 0
table(train_set$Utilities)
train_set$pubutil[train_set$Utilities == "AllPub"] = 1
train_set$pubutil[train_set$Utilities != "AllPub"] = 0
table(train_set$LandSlope)
train_set$gentle_slope[train$LandSlope == "Gtl"] = 1
train_set$gentle_slope[train$LandSlope != "Gtl"] = 0
ggplot(train_set,mapping = aes(y=SalePrice,x=GrLivArea))+geom_point()
train_set = train_set[train_set$GrLivArea<=4000,]
missing_indices = sapply(test_set, function(x)sum(is.na(x)))
missing_indices
library(ggplot2)
library(readr)
library(MASS)
library(dplyr)
library(lars)
library(moments)
library(caret)
library(corrplot)
library(gbm)
missing_summary = data.frame(index = names(train_set),
              missing_values = missing_indices)
missing_indices
train_set(is.na())
missing_summary <- train_set[rowSums(is.na(train_set)) > 0,]
missing_summary
dim(missing_summary)
missing_summary2 <- subset(train_set, is.na(train_set$MiscFeature))
missing_summary2
dim(missing_summary2)
subset(train_set, is.na(train_set$MiscFeature)) 

colSums(is.na(train_set))
train_set[which(is.na(train_set[,2])),] 



missing_summary = data.frame(rownames = names(train_set),missing_values = missing_indices)
colSums(is.na(train_set))
missing_indices = sapply(test_set, function(x)sum(is.na(x)))
missing_indices
