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
