# Exam Questions
# BSC - Stats
#Q1 
x = c(8,7,9,4,8,10,9,9,3,5)
mean(x)
median(x)
modeest::mlv(x,method='mfv')

#Probability that an occupational disease will strike workers in a factory is 20%. 
#What is the probability out of six workers chosen at random, Four or more will suffer from disease
mean1 = .2 * 6 
mean1
x1=c(0,1,2)
prob <- function(mean1, x1) {
  exp(-mean1) * mean1^x1 / factorial(x1)
}
1- sum(prob(mean1,x1))

#Q3 Assuming that the mean weight of soldiers is 68 Kgs with a variance of 10 Kgs2 inches. Find how many soldiers in a regiment of 1000, would you expect to be between 70 and 80 Kgs weight.
#Assume normal distribution
m1 = 68 ; v1=10 ; n=1000
z1 = (70-68)/sqrt(10)
z2 = (80-68)/sqrt(10)
z1 ; z2
(pnorm(z2)- pnorm(z1))*1000



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
