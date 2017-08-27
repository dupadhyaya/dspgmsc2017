# MTCARS R work
#http://www.theanalysisfactor.com/r-tutorial-part-13/
#http://www.r-tutor.com/r-introduction/data-frame/data-frame-column-slice

# Exercise1
x = c(60,75,58,46,NA,75,55,76,72,64)
y = c(30,68,65,56,71,69,59,78,70,75)
# Length  and Mean of x
length(x)
mean(x,na.rm=T)
# use edit commands to update first value of y to 50
y=fix(y)
y[1] =50 ; y;
# Median  and Std Dev of y 
median(y)
sd(y)

#mode of y
table(y)
uniqy <- unique(y) ; y[which.max(tabulate(match(y, uniqy)))]
modeest::mlv(y,method='mfv')

# Replace NA value in x by mean value of x
x[is.na(x)] = mean(x,na.rm=T)

# Range, IQR, 50th Percentile
range(x)
IQR(x)
quantile(x,.5)

# Stem & Leaf
stem(y)

# Covaraince and Correlation between x & y
cov(x,y)
cor(x,y)


# Round of the values of x to 2 decimal places
x = round(x,2)
x

# Join x & y as matrix row bind them
matxy = as.matrix(rbind(x,y))
matxy
# Transpose the Matrix 
t(matxy)

# Joint x & y as data.frame column bind them
dfxy = as.data.frame(cbind(x,y))
# add a column 'ser' serially numbered
dfxy$ser = 1:10
dfxy

# Sort the data frame by x column
sort(dfxy[,'x'])
# store this dataframe as file1.csv file
write.csv(dfxy,'file1.csv')


# Excercise 2
str(mtcars)
dim(mtcars)
data1 = mtcars
str(data1)
class(mtcars)
# Columns which can be made to factors
# Factors - carb, am, cyl

#Plot
plot(data1$wt,data1$mpg)
abline(lm(mtcars$mpg~mtcars$wt),data=mtcars)
title("Regression of MPG on Weight")

# Histogram
hist(mtcars$wt)

# Convert to Factors
data1$carb = factor(data1$carb)
data1$cyl = factor(data1$cyl)
data1$am = factor(data1$am)
str(data1)

# Mean of all columns use apply family of commands
apply(mtcars,2,mean)

#Box Plot : Draw plot as per diagram
boxplot(wt~cyl, data=data1, main=toupper("Vehicle Weight"), font.main=3, cex.main=1.2, xlab="Number of Cylinders", ylab="Weight", font.lab=3, col="darkgreen")
boxplot(mpg ~ cyl, data = data1, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

# First row & 2nd coln
data1[1,2] 

#Number of rows
nrow(data1)

#Number of columns
ncol(data1)

#First Coln with row names
data1[1]

#25th-30th  row, 3rd to 6th coln
data1[25:30,3:6]

#List cars wt and mpg with automatic Transmission am= 0
data1[data1$am==0,c('wt','mpg')]





rm(list=ls())
library(MASS)

# data set faithful (MASS)

# Range(Time) of eruptions faithful
duration = faithful$eruptions
range(duration)

# Frequency distribution of duration with interval [1.5,5.5 at interval of .5]
breaks = seq(1.5,5.5,by=0.5)
breaks
duration.cut = cut(duration,breaks, right=F)
duration.cut
duration.freq = table(duration.cut)
cbind(duration.freq)
# Draw a Pie Graph of the distribution
pie(duration.freq)

# Statistical Analysis ----------------------------------------------------

# Hypothesis Testing ---------------

# Chi Square Tests : Data set survey(MASS). Smoking and Exercise Level. 
# Test the hypothesis whether the students smoking habit is
#indepdent of their exercises level at .05 level.

library(MASS)
tbl = table(survey$Smoke, survey$Exer)
tbl
chisq.test(tbl)

# Simple Linear Regression
#Apply the simple linear regression model for the data set faithful 
# and estimate the next eruption duration if the waiting time since the 
# last eruption  has been 100 minutes
eruption.lm = lm(eruptions ~ waiting, data=faithful)
coeffs = coefficients(eruption.lm)
coeffs
duration = coeffs[1] + coeffs[2]* 100
duration  # next one to last 5.688

predict(eruption.lm, data.frame(waiting=100)) # predict

# Normality tests
eruption.stdres = rstandard(eruption.lm)
qqnorm(eruption.stdres)


# t tests
#A study was performed to test whether cars get better mileage on premium gas than on regular gas. 
# with Regular Fuel =(16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
# With Premium Fuel =(19, 22, 24, 24, 25, 25, 26, 26, 28, 32)
#use a paired ttest to  determine whether cars get significantly better mileage with premium gas
reg = c(16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
prem = c(19, 22, 24, 24, 25, 25, 26, 26, 28, 32)
t.test(prem,reg,alternative="greater", paired=TRUE)

#The results show that the t-statistic is equal to 4.47 and the p-value is 0.00075. Since
#the p-value is very low, we reject the null hypothesis. There is strong evidence of a
#mean increase in gas mileage between regular and premium gasoline


# Time Series
#https://rdrr.io/rforge/TTR/man/MovingAverages.html
library(TTR)
data(ttrc)
str(ttrc)
#ttrc

# Simple 20 day Moving Average
sma.20 = SMA(ttrc[,'Close'],20)
head(sma.20,n=21)
# Weighted Mean 30 day 
wma.30 = WMA(ttrc[,'Close'],wts=c(1:30),30)
head(wma.30,n=31)
# Exponential Weighted Mean
ema.25 = EMA(ttrc[,'Open'],n=25)
head(ema.25,n=26)

# ----------------------
# Time Series
#https://rdrr.io/rforge/TTR/man/MovingAverages.html
library(TTR)
x=1:20
# Simple 3 pd Moving Average
sma.3 = SMA(x,3)
head(sma.3)

# Weighted Mean 30 day 
wma.3 = WMA(x,wts=c(.2,.3,.5),n=3)
head(x)
head(wma.3)
# Exponential Weighted Mean
ema.2 = EMA(x,wilder=T,2)
head(ema.2)

library(xts)
temp = ts(x,start = c(2000),end=c(2011),  frequency = 1)
#temp = ts(x,start = c(2000,1),end=c(2012,3),  frequency = 12)

temp
plot(temp)
print(temp)

