# Anova http://pages.stat.wisc.edu/~yandell/st571/R/anova.pdf

p1=c(9, 12, 14, 11, 13)
p2=c(10, 6, 9, 9, 10)
p3=c(12, 14, 11, 13, 11)
p4=c(9, 8, 11, 7, 8)
y = c(p1,p2,p3,p4)
y
n=rep(5,4)
n
group = rep(1:4,n)
group
ps = paste("p",group,sep="")
ps
groups = ps
#tmp = tapply(y, group, stem)
#stem(y)
#-------------
tmpfn = function(x) c(sum = sum(x), mean = mean(x), var = var(x), n = length(x))
tapply(y, groups, tmpfn)
#---------------
data = data.frame(y = y, groups = factor(groups))
fit = lm(y ~ groups, data)
anova(fit)
# - Table Values 
df = anova(fit)[, "Df"]
names(df) = c("trt", "err")
df
# Confidence Interval
alpha = c(0.05, 0.01)
qf(alpha, df["trt"], df["err"], lower.tail = FALSE)
#
anova(fit)["Residuals", "Sum Sq"]
anova(fit)["Residuals", "Sum Sq"]/qchisq(c(0.025, 0.975), 18,lower.tail = FALSE)



#---------Anova2 
ratings= c(4,4,6,8,8,9,8,10,8,10,6,6,6,7,5)
schools = c('Public','Public','Public','Public','Public','Charter','Charter','Charter','Charter','Charter','Private','Private','Private','Private','Private')
schools
ratings
schools = factor(schools)
fit2 =lm(ratings ~ schools)
anova(fit2)
confint(fit2)
df2 = data.frame(ratings, schools)
length(ratings)
length(schools)
df2

#online = ceiling(rnorm(15, mean=65, sd=5))
online = c( 60,63,56,62,65,74,67,76,71,77,81,69,68,71,64)
blended = ceiling(rnorm(15, mean=70, sd=5))
student = c(paste('bt',1:5,sep=''), paste('p',1:7, sep=''), paste('bs',1:3, sep=''))
student
course = c(rep('btech',5), rep('pg',7), rep('bsc',3))
course
df = data.frame(course=factor(course), student, online, blended)
df

tapply(df$online, df$course,mean)

# 1 Way ANOVA 
# Within Group  - Online and Blended (All Students no Course)
table(d)

# Between Groups - Online or Blended Only with Course
ftable(df$course)

aggregate(df$online, by=list(course), FUN=mean)
aggregate(df$online, by=list(course), FUN=sd)
(fit1w = aov(online ~ course, data=df))
summary(fit1w)
boxplot(online ~ course, data=df)

#Mean Plot
gplots::plotmeans(online ~ course, data=df)

#pg-btech should significant differences
TukeyHSD(fit1w)
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD(fit1w))

#Same letters don't have significant differences in means
par(las=0)
library(multcomp)
par(mar=c(5,4,6,2))
tuk = glht(fit1w, linfct = mcp(course='Tukey'))
plot(cld(tuk, level=.05), col='lightgrey')

#Normality Test for DV
car::qqPlot(lm(online ~ course, data=df), simulate=T, labels=F)

#Equal Variance - Pass
bartlett.test(online ~ course, data=df)

#No Significant Outliers
car::outlierTest(fit1w)



# Two Way Factorial ANOVA
df
table(df$course, df$online)
?reshape2::melt
reshape2::melt(df, value.name=)
df2= reshape2::melt(df, id.vars = c('course', 'student'),
               measure.vars = c("online", "blended"),
               variable.name="teaching", value.name="marks")
names(df2)
head(df2)
df2
df2$teaching = factor(df2$teaching)
table(df2$course, df2$teaching)
aggregate(df2$marks, by=list(course= df2$course, teaching=df2$teaching), FUN=mean)
aggregate(df2$marks, by=list(course= df2$course, teaching=df2$teaching), FUN=sd)
fit2way = aov(marks ~ course * teaching, data=df2)
summary(fit2way)


interaction.plot(df2$course, df2$teaching, df2$marks,
        col=c('red', 'blue'), pch=c(16,18), type='b')
gplots::plotmeans(df2$marks ~ interaction(df2$course, df2$teaching, sep=''),
      connect=list(c(1,3,5), c(2,4,6)), col=c('red', 'green'),
      main='Interaction Plot with 95% CI', xlab='Teaching Types')

HH::interaction2wt(df2$marks ~ df2$course * df2$teaching)


# Repeated ANOVA

corr = ceiling(rnorm(15, mean=57, sd=4))
df$corr = corr
df
df3pg = subset(df2, df2$course=='pg')
df3pg
fit3pg = aov
data(CO2)
str(CO2)
head(CO2)
summary(CO2)
?CO2
fit3w = aov(df$blended ~ df$online * df$course + Error(df$student/df$course))

