
df1=read.csv("./data/student-mat.csv",header=TRUE)
#df2=read.table("student-por.csv",sep=";",header=TRUE)

#df3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
#print(nrow(d3)) # 382 students
df1
names(df1)
#df1a = df[,c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
df1G3 = df1[,-c(1)]

df1G3
names(df1G3)
fitG3 = lm(G3 ~ ., data=df1G3)
summary(fitG3)
par(mar=c(2,3,3,2))
#plot(df1G3)
plot(fitG3)
plot(fitG3, which=1)

fit=fitG3
car::durbinWatsonTest(model=fit)
car::ncvTest(fit)
car::outlierTest(fit)
car::scatterplot(fit)
car::scatterplotMatrix(fit)

?vif(fit)

#residuals Plot
z = rstudent(fit)
hist(z, freq=F)  
rug(jitter(z))
lines(density(z)$x, density(z)$y)
curve(dnorm(x, mean(z), sd(z)), add=T, col='blue', lwd=2)

cr.plots(fit)  # check for non-linearity
spreadLevelPlot(fit)
gvmodel= gvlma::gvlma(fit)
summary(gvmodel)
vif(fit)
sqrt(vif(fit)) > 2
# multi-collinearity is not a problem

#inflential Observations
car::avPlots(fit, ask=F)
car::influencePlot(fit)


step= MASS::stepAIC(fit,  direction ='backward')
step$anova
dim(df1G3)

fit2= lm(formula = G3 ~ sex + age + famsize + Medu + Mjob + studytime + 
     failures + schoolsup + famsup + romantic + freetime + goout + 
     absences, data = df1G3)
summary(fit2)
fit3 = lm(formula = G3 ~ sex + famsize + Medu + Mjob + studytime + 
            failures + schoolsup + famsup + romantic + freetime + goout + 
            absences, data = df1G3)
summary(fit3)
#fit4 = 
  

#Forward
#Blank Model
(Fit0 = lm(G3 ~ 1, data=df1G3))
summary(Fit0)
#Find Best Predictor
add1(Fit0, df1G3, test='F')
#Add Best Predictor
Fit1= lm(G3 ~ failures, data=df1G3)
summary(Fit1)
#Next Best Predictor
add1(Fit1, df1G3, test='F')
Fit2 = lm(G3 ~ failures + Medu, data=df1G3)
summary(Fit2)
#Find Next Predictor
add1(Fit2, df1G3, test='F')
Fit3 = lm(G3 ~ failures + Medu + sex, data=df1G3)
summary(Fit3)
#Find Next Predictor
add1(Fit3, df1G3, test='F')
Fit4 = lm(G3 ~ failures + Medu + sex + goout, data=df1G3)
summary(Fit4)
#Find Next Predictor
add1(Fit4, df1G3, test='F')
Fit5 = lm(G3 ~ failures + Medu + sex + goout + Mjob, data=df1G3)
summary(Fit5)
#Find Next Predictor
add1(Fit5, df1G3, test='F')
Fit6 = lm(G3 ~ failures + Medu + sex + goout + Mjob + romantic, data=df1G3)
summary(Fit6)
#Find Next Predictor
add1(Fit6, df1G3, test='F')
Fit6 = lm(G3 ~ failures + Medu + sex + goout + Mjob + romantic, data=df1G3)
#None to be added

anova(Fit1, Fit6)  # Fit6 Better
AIC(Fit1, Fit6) # Fit6 Better

leaps<-leaps::regsubsets(G3 ~ .,data=df1G3,nbest=5)
summary(leaps)


# Relative Importance
#measures of relative importance for each of the predictors in the model. See help(calc.relimp) for details on the four measures of relative importance provided.
library(relaimpo)
calc.relimp(Fit6, type=c("lmg","last","first"), rela=TRUE)
boot <- boot.relimp(Fit6, b = 1000, type = c("lmg", "last", "first"), rank = TRUE, diff = TRUE, rela = TRUE)
booteval.relimp(boot)
plot(booteval.relimp(boot,sort=TRUE))



#All Subsets Regression
library(leaps)
leaps<-regsubsets(G3 ~ failures + Medu + sex + goout + Mjob + romantic, data=df1G3,nbest=4)
summary(leaps)
# plot a table of models showing variables in each model.
par(mar=c(.5,.5,.5,.5))
graphics.off()
plot(leaps,scale="r2")
# plot statistic by subset size
library(car)
subsets(leaps, statistic="rsq")
