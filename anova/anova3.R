# Repeated Anova

(subjects = c(paste('s',1:6,sep='')))
(pre =  c(45, 42, 36, 39, 51, 44))             
(mon3 = c(50, 42, 41, 35, 55, 49))
(mon6 = c(55, 45, 43, 40, 59, 56))

(df= data.frame(pre, mon3, mon6))
row.names(df) = subjects
df
colMeans(df)
addmargins(as.matrix(df), c(1,2), list(list(mean,sd), list(mean)))
(xM = mean(as.matrix(df)))
(x1 = mean(pre))
(x2 = mean(mon3))
(x3 = mean(mon6))
(c = length(df))
(nc = nrow(df))
# No of subject - 6
(SST = nc * ( (x1 - xM)^2 + (x2 - xM)^2 + (x3 - xM)^2))

(SSW = sum((pre - x1)^2) + sum((mon3 - x2)^2) + sum((mon6 - x3)^2)  )

xM
df
(subjectmeans = rowMeans(df))
(SSB = c * sum((subjectmeans - xM)^2))
(SSE = SSW - SSB)
(MST = SST/ (c-1))
(MSE = SSE / ((nc-1)*(c-1)))
(Fstat = MST/ MSE)
(qf(p=0.95, df1=2, df2=10))
#Fstat > Fcv : Reject Ho
#Exercise had significant effect on the Subjects

# R Way
df
(timeLevels = c('pre', 'mon3', 'mon6'))
timeFactor = as.factor(timeLevels)
(timeFrame = data.frame(timeFactor))
df
(timeBind = cbind(pre, mon3, mon6))
(timeModel = lm(timeBind ~ 1))

analysis = car::Anova(mod=timeModel, idata=timeFrame, idesign= ~ timeFactor)
summary(analysis)

