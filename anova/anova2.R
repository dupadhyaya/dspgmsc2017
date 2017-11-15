#Anova2
#Golf Club Example
club1 = c(254, 263, 241, 237, 251) 
club2 = c(234, 218, 235, 227, 216)
club3 = c(200, 222, 197, 206, 204)
cbind(club1, club2, club3)
df = data.frame(cbind(club1, club2, club3))
df
dfstack = stack(df)
#unstack(stack(df))  # back orginal structure

colMeans((df))
(x1m = colMeans(df)[1])
(x2m = colMeans(df)[2])
(x3m = colMeans(df)[3])
(xm = mean(dfstack$values))
(n= dim(df)[1])
(SSA = n * (x1m - xm)^2 + n * (x2m - xm)^2 + n * (x3m - xm)^2 )
(SSW = sum((club1 - x1m)^2) + sum((club2 - x2m)^2) + sum((club3 - x3m)^2))
(MSA = SSA / (dim(df)[2]-1))
(MSW = SSW / (nrow(dfstack)-length(df)))
(FSTAT = MSA/ MSW)
df1 = 3 - 1 # gp - 1
df2 = 15 - 3 # n - gps
qf(.95, df1=3-1, df2=15-3)
#FSTAT > FCV  : Reject Ho : Means are not same 

# R Method
head(dfstack)
dfstack$ind = factor(dfstack$ind)
aggregate(dfstack$values, by=list(dfstack$ind), FUN=mean)
aggregate(dfstack$values, by=list(dfstack$ind), FUN=sd)

(fit1w = aov(values ~ ind, data=dfstack))
summary(fit1w)
# Fvalue and P predict the same
boxplot(values ~ ind, data=dfstack)

#Mean Plot
gplots::plotmeans(values ~ ind, data=dfstack)

#pg-btech should significant differences
TukeyHSD(fit1w)
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit1w))

#Same letters don't have significant differences in means
par(las=0)
library(multcomp)
par(mar=c(5,4,6,2))
#tuk = glht(fit1w, linfct = mcp(values='Tukey'))
#plot(cld(tuk, level=.05), col='lightgrey')

#Normality Test for DV
car::qqPlot(lm(values ~ ind, data=dfstack), simulate=T, labels=F)

#Equal Variance - Pass
bartlett.test(values ~ ind, data=dfstack)

#No Significant Outliers
car::outlierTest(fit1w)




# Second Problem ----
sup1 = c(18.5, 24, 17.2, 19.9, 18)
sup2 = c(26.3, 25.3, 24, 21.2, 24.5)
sup3 = c(20.6, 25.2, 20.8, 24.7, 22.9)
sup4 = c(25.4, 19.9, 22.6, 17.5, 20.4)

(df2 = data.frame(cbind(sup1,sup2, sup3,sup4)))
colSums(df2)
colMeans(df2)
addmargins(as.matrix(df2), FUN=list(list(sum, sd,length), list(length)))

(df2stack = stack(df2))

str(df2stack)
mean(df2stack$values)

colMeans((df2))
(x1m = colMeans(df2)[1])
(x2m = colMeans(df2)[2])
(x3m = colMeans(df2)[3])
(x4m = colMeans(df2)[4])

(xm = mean(df2stack$values))
(n1= dim(df2)[1])  # no of values for each supp 5
(c = dim(df2)[2])  # No of Groups 4
(n = dim(df2stack)[1])  #No of Observations 4 * 5 = 20
n1 * (x1m - xm)^2 ; n1 * (x2m - xm)^2 
n1 * (x3m - xm)^2 ; n1 * (x4m - xm)^2 

(SSA = n1 * (x1m - xm)^2 + n1 * (x2m - xm)^2 + n1 * (x3m - xm)^2  + n1 * (x4m - xm)^2 ) 
(SSW = sum((sup1 - x1m)^2) + sum((sup2 - x2m)^2) + sum((sup3 - x3m)^2) + sum((sup4 - x4m)^2))
(MSA = SSA / (c-1))
(MSW = SSW / (n-c))
(FSTAT = MSA/ MSW)

(FCV = qf(.95, df1 = c-1, df2=n-c))   # F Critical Value


# R Method
head(df2stack)
df2stack$ind = factor(df2stack$ind)
aggregate(df2stack$values, by=list(df2stack$ind), FUN=mean)
aggregate(df2stack$values, by=list(df2stack$ind), FUN=sd)

(fit2w = aov(values ~ ind, data=df2stack))
summary(fit2w)
# Fvalue and P predict the same
boxplot(values ~ ind, data=df2stack)

#Mean Plot
gplots::plotmeans(values ~ ind, data=df2stack)

#pg-btech should significant differences
TukeyHSD(fit2w)
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit2w))

#Same letters don't have significant differences in means
par(las=0)
library(multcomp)
par(mar=c(5,4,6,2))
tuk = glht(fit2w, linfct = mcp(ind='Tukey'))
plot(cld(tuk, level=.05), col='lightgrey')

#Normality Test for DV
car::qqPlot(lm(values ~ ind, data=df2stack), simulate=T, labels=F)

#Equal Variance - Pass
bartlett.test(values ~ ind, data=df2stack)

#No Significant Outliers
car::outlierTest(fit2w)

