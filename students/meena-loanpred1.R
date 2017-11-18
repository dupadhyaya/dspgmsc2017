#Meena - Loan Prediction
library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
getwd()
data=read.csv("./../../rdatasets/loan_train_data.csv",stringsAsFactors = F)
names(data)
length(data$Gender)
head(data)
str(data)
colSums(is.na(data))

#replacing na values
table(data$LoanAmount)
data$LoanAmount[is.na(data$LoanAmount)]=144
table(data$LoanAmount)

table(data$Loan_Amount_Term)
data$Loan_Amount_Term[is.na(data$Loan_Amount_Term)]=360
table(data$Loan_Amount_Term)

table(data$Credit_History)
data$Credit_History[is.na(data$Credit_History)]=1
table(data$Credit_History)

data$Gender[data$Gender== ""]='M'
apply(data,2, function(x) length(unique(x)))
unique(data$Gender)

unique(data$Self_Employed)
data$Self_Employed[data$Self_Employed==""]="Yes"
unique(data$Self_Employed)



apply(data,2, function(x) length(unique(x)))
attach(data)
cols=c("Loan_Status","Married","Gender","Credit_History","Self_Employed")
for (i in cols){
  data[,i]=as.factor(data[,i])
}
set.seed(123)

split = sample.split(data$Loan_Status, SplitRatio = 0.80)

# Why splitting it again
training = subset(data, split == TRUE)
test = subset(data,split == FALSE)

# Structure of the data
str(training)
library(rms)

model1=fastbw(lrm(Loan_Status~Application_ID+ Gender+ Married +Dependents  + Education +Self_Employed +ApplicantIncome
                  + CoapplicantIncome+LoanAmount, data=training  ), rule="p")
model1
summary(model1)
cat(print(paste(names(training),'+', sep=' '), quote=F))
cat(x)

model2=glm(Loan_Status ~ Application_ID + Gender + Married + Dependents + Education + Self_Employed + ApplicantIncome + CoapplicantIncome + LoanAmount
           + Loan_Amount_Term + Credit_History + Property_Area + Loan_Status, 
          ,data=training, family=binomial)
summary(model2)

#removing property area
model=glm(Loan_Status~Application_ID+ Gender+ Married +Dependents  + Education +Self_Employed +ApplicantIncome
          + CoapplicantIncome+LoanAmount +Credit_History +Loan_Amount_Term   
          ,data=training,family=binomial)
summary(model)
#removing loanamountterm
model=glm(Loan_Status~Application_ID+ Gender+ Married +Dependents  + Education +Self_Employed +ApplicantIncome
          + CoapplicantIncome+LoanAmount +Credit_History,data=training,family=binomial)
summary(model)
#removing credithistory
model=glm(Loan_Status~Application_ID+ Gender+ Married +Dependents  + Education +Self_Employed +ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)
#removing self employed
model=glm(Loan_Status~Application_ID+ Gender+ Married +Dependents  + Education +ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing married
model=glm(Loan_Status~Application_ID+ Gender+Dependents  + Education +ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing dependents
model=glm(Loan_Status~Application_ID+ Gender+ Education +ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing education
model=glm(Loan_Status~Application_ID+ Gender+ ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing gender
model=glm(Loan_Status~Application_ID+  ApplicantIncome
          + CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing application id
model=glm(Loan_Status~  ApplicantIncome+ CoapplicantIncome+LoanAmount ,data=training,family=binomial)
summary(model)

#removing loan amount
model=glm(Loan_Status~  ApplicantIncome+ LoanAmount ,data=training,family=binomial)
summary(model)

#MODEL1
#removing loanamount
model=glm(Loan_Status~  ApplicantIncome,data=training,family=binomial)
summary(model)

#testing the data
prob_pred = predict(model, type = 'response', newdata = test[c("ApplicantIncome")])
loan_pred = ifelse(prob_pred > 0.5, "Y", "N")
test$pred=loan_pred
test$pred
test

#confusion matrix
cm=table(test$Loan_Status,loan_pred)
cm

Accuracy=(1+12)/length(test$Loan_Status)
Accuracy

#MODEL2
#model including applicant income and loan amount
model=glm(Loan_Status~  ApplicantIncome+ LoanAmount ,data=training,family=binomial)
summary(model)
#testing the data
prob_pred = predict(model, type = 'response', newdata = test[c("ApplicantIncome","LoanAmount")])
loan_pred = ifelse(prob_pred > 0.5, "Y", "N")
test$pred=loan_pred
#confusion matrix
cm=table(test$Loan_Status,loan_pred)
cm
Accuracy=(1+12)/length(test$Loan_Status)
Accuracy

#MODEL3
#model including applicant income and coapplicant income
model=glm(Loan_Status~  ApplicantIncome+ CoapplicantIncome ,data=training,family=binomial)
summary(model)
#testing the data
prob_pred = predict(model, type = 'response', newdata = test[c("ApplicantIncome","CoapplicantIncome")])
loan_pred = ifelse(prob_pred > 0.5, "Y", "N")
test$pred=loan_pred
#confusion matrix
cm=table(test$Loan_Status,loan_pred)
cm
Accuracy=(0+12)/length(test$Loan_Status)
Accuracy