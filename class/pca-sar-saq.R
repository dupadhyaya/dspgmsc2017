# SAR Examples
library(mada)
library(psych)
library(foreign)
SAQ = read.spss('E:/rWork/rDataSets/SAQ.sav', stringsAsFactors=T, to.data.frame=TRUE) 

dim(SAQ)


SAQ1 = SAQ[,c(1:23)]
SAQ3 = data.matrix(SAQ1)
colnames(SAQ3)= paste('q',1:23,sep='')
colnames(SAQ3)
dim(SAQ3)
class(SAQ1) 
psych::cortest.bartlett(SAQ3)
head(SAQ3[,1:5])
round(cor(SAQ3),2)
cortest.bartlett(SAQ3)

psych::KMO(SAQ3)
?cortest.bartlett

psych::fa.parallel(SAQ3)

vss(SAQ3)

library(nFactors)
ev = eigen(cor(SAQ3))

ap = parallel(subject=nrow(SAQ3), var=ncol(SAQ3), rep=100, cent=.05)
ap
nS = nScree(x=ev$values, aparallel = ap$eigen$qevpea)
plotnScree(nS)

View(SAQ3)

fit=princomp(SAQ3, cor=T)
summary(fit)
loadings(fit)
plot(fit, type='lines')
plot(fit)
biplot(fit)


fit1 = psych::principal(SAQ3, cor=T, nfactors=23, rotate='none')
fit1

fit2 = principal(SAQ3, cor=T, nfactors=4, rotate='none')
fit2
fa.plot(fit2)
fa.graph(fit2)
fa.diagram(fit2)

fit3 = psych::principal(SAQ3, nfactors=4, rotate='varimax')
?principal
fit3
fa.plot(fit3)
fa.graph(fit3)
fa.diagram(fit3)

fit4 = factanal(SAQ3, factors=3, rotation = 'varimax')
print(fit4, digits=2, cutoff=0.3, sort=T)

SAQ4 = as.data.frame(SAQ3)
load= fit$loadings[,1:2]
plot(load)
text(load, labels = names(SAQ4), cex=0.7)

