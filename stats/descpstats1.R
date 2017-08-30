# Descriptive Statistics
opar = par(no.readonly = T)

set.seed(1234)
(marks = ceiling(rnorm(100,50,20)))
x=marks


# Frequency Distribution

# Mean
mean(x)
  
# Median
median(x)

#Mode
table(x)
sort(table(x))
sort(table(x), decreasing =T)
sort(table(x), decreasing =T)[1]

#Mode - Method2
library(modeest)
?mlv
mlv(x,  method = "mfv")

##Graphs

#Histogram
#layout(matrix(1,1))
par(opar)
hist(x)
hist(x, breaks=12)
hist(x, breaks=5)
hist(x)
rug(x, ticksize = 0.03, side = 1, lwd = 0.5, col = par("fg"),
    quiet = getOption("warn") < 0)
# Histogram with lines showing distribution
hist(x, freq=F)
lines(density(x))


#Density
density(x)
?density
plot(density(x))

# relative Freq

#Box Plot
boxplot(x)

boxplot(x)
abline(h = min(x), col = "Blue")
mtext(4,at = min(x), text='Min' , las=2)

abline(h = max(x), col = "Yellow")
text(x=1.2, y=max(x), labels= 'Max', col='Yellow')

abline(h = median(x), col = "Green")
text(x=.8, y=median(x), labels= 'Median', col='Green')

abline(h = mean(x), col = "Violet")
text(x=1.2, y=mean(x), labels= 'Mean', col='Violet')

abline(h = quantile(x, c(0.25, 0.75)), col = "Red")
text(x=1.5, y=quantile(data, c(0.25, 0.75)), 
     labels= c('1QR','3QR'), col='Red')



#Histogram & Box Plot


#Skewness


#Variance


#Standard Deviation


#Quantiles

quantile(x, c(.25,.5,.75, 1))
IQR(x)
quantile(x, seq(0,1, by=0.1))  # deciles
quantile(x, seq(0,1, by=0.01)) # percentile

#Outliers
# values beyond 1.5 * IQR
outrange = 1.5 * IQR(x)
outrange
median(x)
(lower = median(x) - outrange)
(upper = median(x) + outrange)
x[x < lower]
x[x > upper]




# Box Plot and Histogram

# data 
summary(x)
# layout where the boxplot is at top  
matrix(c(1,2),2,1, byrow=TRUE)
# 2 figures 1 top, 2 below: height of 1st -1, lower=3
nf <- layout(mat = matrix(c(1,2),2,1, byrow=TRUE), 
             height = c(1,3))
#par(mar=c(3.1, 3.1, 1.1, 2.1))
min(x) ; max(x)
boxplot(x, horizontal=TRUE,  outline=TRUE, 
        ylim=c(min(x),max(x)), main='Box Plot',
        cex.main=0.5, frame=F, col = "green1")
hist(x,xlim=c(min(x),max(x)), col = "pink", 
     main='Histogram' , cex.main=0.5)


# Method2
# layout boxplot is at the bottom 
nf <- layout(mat = matrix(c(1,2),2,1, byrow=TRUE),  height = c(3,1))
par(mar=c(3.1, 3.1, 1.1, 2.1))
hist(x,xlim=c(min(x),max(x)), col = "pink")

text(min(x),1,'Min Value', cex=.5)
text(max(x),1,'Max Value', cex=.5)

rug(x, ticksize = 0.03, side = 1, lwd = 0.5)

boxplot(x, horizontal=TRUE,  outline=TRUE,ylim=c(min(x),max(x)), frame=F, col = "green1", width = 10)


#http://homepage.divms.uiowa.edu/~luke/classes/STAT4580/histdens.html

library(MASS)
hist(~ duration, data = geyser)
hist(diamonds$price)
