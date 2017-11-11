
df1=read.csv("./data/student-mat.csv",header=TRUE)
#df2=read.table("student-por.csv",sep=";",header=TRUE)

#df3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
#print(nrow(d3)) # 382 students
df1
names(df1)
#df1a = df[,c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","interne
            t"))
df1G3 = df1[,-c(31,32)]
df1G3
names(df1G3)
fitG3 = lm(G3 ~ ., data=df1G3)
summary(fitG3)
par(mar=c(2,3,3,2))
#plot(df1G3)
plot(fitG3)
plot(fitG3, which=1)

fit=fitG3
durbinWatsonTest(model=fit)
?durbinWatsonTest
ncvTest(fit)
outlierTest(fit)
scatterplot(fit)
scatterplotMatrix(fit)
vif(fit)

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
