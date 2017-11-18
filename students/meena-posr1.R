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
table(data$affairs)
round(prop.table(table(data$affairs)),2)
round(prop.table(table(data$gender)),2)
round(prop.table(table(data$children)),2)


#make the values into dichotomous 
data$ynaffair[data$affairs>0]=1
data$ynaffair[data$affairs==0]=0
#head(data)
names(data)
sapply(data, function(x) length(unique(x)))

data$ynaffair=factor(data$ynaffair,levels = c(0,1),
            labels = c('No','Yes'))
table(data$ynaffair)
str(data)

library(caTools)
set.seed(123)
#no of records
length(data$children)

#Data into trg and test sets
split=sample.split(data$ynaffair,SplitRatio = 0.8)
#train which are True, Test which are false
train=subset(data,split==TRUE)
test=subset(data,split==FALSE)
dim(train); dim(test)


library(rms)
names(train)
#attach(train)
?lrm
model1a = rms::lrm(ynaffair~ gender + age + yearsmarried + children +
                religiousness + education + occupation + rating, data=train) 
model1a
model1afwb =fastbw(fit=model1a, rule="aic", type="residual", sls=.05, aics=0, eps=1e-9,
                   k.aic=2, force=NULL)
model1afwb

summary(model1afwb)

coef(model1afwb)  # which all factors kept
# gender, yearsmarried, religiousnes, rating

#Model1b
model1b=glm(ynaffair~ gender + yearsmarried + religiousness + rating, 
            family=binomial, data=train)
model1b
summary(model1b)
# can drop gender 
model1c=glm(ynaffair~ yearsmarried + religiousness + rating, 
            family=binomial, data=train)
model1c
summary(model1c)


#GLM
model2a=glm(ynaffair~ gender + age + yearsmarried + children +
                   religiousness + education + occupation + rating, data=train)
model2a
summary(model2a)

model2b=glm(ynaffair~age + yearsmarried + religiousness + rating,family=binomial, data=train)
model2b
summary(model2b)

model2c=glm(ynaffair~ yearsmarried + religiousness + rating,family=binomial, data=train)
model2c
summary(model2c)

# Prediction
#fastbw
# yearsmarried, religiousnes, rating
pred1 = predict(model1c, type='response', newdata = test[ , c('yearsmarried', 'religiousness', 'rating')] )
# same as next model

#GLM Model
#glm
pred2 = predict(model2c, type='response', newdata = test[ , c('yearsmarried', 'religiousness', 'rating')] )
summary(pred2)
cbind(test$ynaffair, pred2)
test$probpred2 = ifelse(pred2 > 0.5, 1, 0)
cbind(test$ynaffair, test$probpred2)

test[, c('ynaffair', 'probpred2')]
(xtab2=table(test$ynaffair, test$probpred2))
(90+1)/(90+1+29+0)
library(caret) 
caret::confusionMatrix(xtab2)

