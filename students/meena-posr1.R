#Meena
#
library(AER)
data(Affairs)
Affairs
names(Affairs)
data=Affairs
summary(data)
str(data)
dim(data)
attach(data)
table(affairs)
prop.table(table(affairs))
prop.table(table(gender))
prop.table(table(children))
prop.table(table(children))*100
data$ynaffair[data$affairs>0]=1
data$ynaffair[data$affairs==0]=0
data
data$ynaffair=factor(data$ynaffair,levels = c(0,1),labels = c('No','Yes'))
table(data$ynaffair)

str(data)
library(caTools)
set.seed(123)
length(data$children)
split=sample.split(data$ynaffair,SplitRatio = 0.8)
train=subset(data,split==TRUE)
test=subset(data,split==FALSE)
library(rms)
attach(train)
model=fastbw(lrm(ynaffair~gender+age+yearsmarried+children+religiousness+education+occupation+rating))
model
summary(model)

#from the fast backward selection 3 variables are identified as significant
model=glm(ynaffair~yearsmarried+religiousness+rating+gender,family=binomial)
summary(model)



pred=predict(model,type="response",newdata=test[,c("yearsmarried","religiousness","rating","gender")])
pred
test$probpred=ifelse(pred>0.5,"Yes","No")
test$probpred
length(test$ynaffair)
length(test$probpred)
table(test$ynaffair,test$probpred)

accuracy=(89+4)/length(test$affairs)
accuracy


#Model1 ---->including education to the model
model1=glm(ynaffair~yearsmarried+religiousness+rating+education+gender,family=binomial)
summary(model1)
#summary says that education is not significant




#Model2----> including occupation to model
model2=glm(ynaffair~yearsmarried+religiousness+rating+gender+occupation,family=binomial)
summary(model2)