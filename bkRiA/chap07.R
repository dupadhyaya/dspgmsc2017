#Chapter - 7 : Basic Statistics ------------------------------------------
# Questions to answer
# What kind of mileage cars are getting these days
# Whats the distribution of miles per gallon ( Mean, SD, Median, Range)
# After a new drug trial, is there a improvement
# Does gender effect on drug outcome
# What is correlation between income and life expectancy.
# Are you likely to receive more punishment in some regions

.libPaths()
rm(list=ls())
# Descriptive Statistics --------------------------------------------------

#attach(cars) ;detach(cars)
mtcars
str(mtcars)
vars = c('mpg','hp','wt') # vector of variable names
vars
head(mtcars[vars])  # use these variable names as parameters to filter DF
str(mtcars)
dim(mtcars)  # 32 cars
#  am - auto tx : 0-automatic, 1-manual
#  cyl - no of cylinders - 4,5,6

# Descriptive Statistics --------------------
summary(mtcars)
summary(mtcars[vars])
# use apply or sapply to provide Descriptive Stats
?sapply # apply function of list or  Vector
sapply(x, FUN, options)
sapply(mtcars[vars],mean)
sapply(mtcars,fivenum)
# Other functions - fivenum, sd,var,min,max, median, length, 
# range, fivenum, quantile (since all colns are numeric)
# fivenum  - min, lowerhinge(Q1), median, upperhinge(Q3), max

# Function for skewness and kurtosis - no predefined function in base
mystats = function(x,na.omit=F) { 
  if (na.omit)
    x = x[!is.na(x)]
    m = mean(x)
    n = length(x)
    s = sd(x)
    skew = sum((x-m)^3/s^3)/n
    kurt = sum((x-m)^4/s^4)/n - 3
    return(c(n=n,mean=m, stdev=s,skew=skew, kurtosis=kurt))
}

sapply(mtcars[vars],mystats)

# if Missing values 
sapply(mtcars[vars], mystats, na.omit=T)

# Extensions
# retuns no of varaibles & obsvns, no of missing & unique values,
# mean, quantiles, 5 highest & lowest values
library(Hmisc)
describe(mtcars[vars])
vars

library(pastecs)
stat.desc(mtcars[vars])
stat.desc(mtcars[vars], basic=T, desc=T, norm=T, p=.95)  # very good function
# no of values, null values, missing values, min, max, sum, ; 
# median, mean, Std Error of mean,  .95 Conf Int, var, Std Dev, CoVar
# Stats significane, Test of normality, 

library(psych)
psych::describe(mtcars[vars])
# nonmissing values, mean, sd, median, trimmed mean, MAD, min, max, range,skew, kurtosis, SE of mean

Hmisc::describe(mtcars[vars]) # want to use Hmisc version of describe


# Descriptive Statistics by Group -----------------------------------------
# used when comparing groups of individuals/obvn instead of total sample

aggregate(mtcars[vars],by=list(mtcars$am),mean)
aggregate(mtcars[vars],by=list(am=mtcars$am),mean)  # group by AM 0, 1 -mean of variables
aggregate(mtcars[vars],by=list(am=mtcars$am),sd)
aggregate(mtcars[vars],by=list(am=mtcars$am,cyl=mtcars$cyl),mean)
# aggregate can use only singe grouping variables like, mean, sd, var
# list=(name1=groupvar2, name2=groupvar2...)
aggregate(mtcars[vars],by=list(am=mtcars$am, cyl=mtcars$cyl),mean)

# if more than 1 grouping variables are required use by
# Group using by --------------------------------------
dstats = function(x) {
  (c(mean=mean(x), sd=sd(x))) # Not working
}
x = 1:10
dstats(x)

library(doBy)
str(mtcars[vars])
mtcars$am = factor(mtcars$am)
#by(mtcars[vars],mtcars$am, dstats, simplify = T) # not working
?by
str(mtcars)
by(mtcars[vars],mtcars$am, summary)
str(mtcars)

by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)


# Do By
library(doBy)
?summaryBy
summaryBy(formula, data = dataframe, FUN=function1)
summaryBy(mpg+hp+wt~am,data=mtcars,FUN=mystats)  # grouping by AM
summaryBy(mpg+hp+wt~am,data=mtcars,FUN=mean)
summaryBy(mpg~am,data=mtcars,FUN=mystats)
#summaryBy(mpg+wt~am+hp,data=mtcars,FUN=mystats)

unique(mtcars$mpg)

library(psych)
psych::describeBy(mtcars[vars],mtcars$am)
# cannot use arbitrary function


# reshape : melt and cast -----------------------------------------------------------
# derive descriptive functions in flexible manner
dfm = reshape::melt(mtcars, measure.vars= c('mpg','hp','wt'),
                    id.vars=c('am','cyl'))
dfm
?melt

reshape::cast(mtcars, am + cyl  ~ ., mean)
reshape::cast(mtcars, am + cyl  ~ ., dstats)

# Distributions  of Quantitative Variables -----------------------------------------------------

# 7.2 Frequency and Contigency Tables ---------------------

library(vcd)
head(Arthritis)
?Arthritis
str(Arthritis)
# Categorical Attributes - Treatment, Sex, Age
#  Commands - table, xtabs, prop.table, margin.table, addmargines, ftable
# 1 way tables
mytable = with(Arthritis, table(Improved))
mytableas;asr
table(Arthritis$Improved)
prop.table(mytable) # relative %
round(prop.table(mytable) * 100)  # %

table(mtcars[,1], mtcars[,2])
xtabs(~mtcars[,1] +mtcars[,2])

# cannot take more than 3 colns
table(mtcars[,1], mtcars[,2],mtcars[,3])

# 2 way table
str(Arthritis)
table(Arthritis$Treatment, Arthritis$Sex)
mytable = xtabs(~ Treatment + Improved,data=Arthritis)
mytable

table(Arthritis$Treatment,Arthritis$Improved)
table(Arthritis$Improved, Arthritis$Treatment) # Rights side - Coln

margin.table(mytable,1) # Row Sum 1- 1st variable in the table
prop.table(mytable,1)  # Row Proportions

margin.table(mytable,2) # Col Sum 2- 2nd variable in the table
prop.table(mytable,2)  # ColProportions
round(prop.table(mytable)*100)  # Cell Proportions
prop.table(mytable)

addmargins(mytable) # add row and column rums
addmargins(prop.table(mytable,1),2) # add coln margins only
addmargins(prop.table(mytable,1),1) # add row margins only

library(gmodels)
gmodels::CrossTable(Arthritis$Treatment, Arthritis$Improved)

# Multidimensional Tables
#functions extend themselves - table, xtabs, margin.table, prop.table, addmargines, ftable(addl)
mytable2 = xtabs(~Treatment + Sex + Improved, data = Arthritis) # 3 way contingency table
mytable2

ftable(mytable2)

# Marginal Frequencies
margin.table(mytable2,1)
margin.table(mytable2,2) # 2nd factor
margin.table(mytable2,3)

margin.table(mytable2, c(1,3)) # 1st & 3rd Factor
margin.table(mytable2, c(1,2))

ftable(addmargins(prop.table(mytable2,c(1,2)),3))
ftable(round(addmargins(prop.table(mytable2,c(1,2)),3)*100))


# Tests of Independence -----------------------
# Chi Square, Fisher, Mantel 
# Chi Square Tests of Independence chisq.test() Ho- Independent -----------------
library(vcd)
mytable3 = xtabs(~Treatment+Improved, data =Arthritis)
chisq.test(mytable3) # p < .05 -> Ho reject : Not Independent
# 2X 2 table
mytable3 = xtabs(~Treatment+Sex, data =Arthritis)
chisq.test(mytable3) # p > .05 -> Ho accept: Independent

mytable3 = xtabs(~Improved+Sex, data =Arthritis)
chisq.test(mytable3) # p > .05 -> Ho accept: Independent
# Warning - some values may be less than 5


# Fisher Test fisher.test() Ho - Independent ---------------
mytable3 = xtabs(~Treatment+Improved, data =Arthritis)
fisher.test(mytable3) # p < .05 -> Ho Reject : Not Independent - Dependent
# any x * y table more than 2 x 2 table

# Mantel Tests 2 conditionally independent of 3rd variable-----------------
mytable3 = xtabs(~Treatment+Improved+Sex, data =Arthritis)
mantelhaen.test(mytable3) # Reject Ho : Not Indepedent
# Treatment & improved variable are idenpendent of each sex level
# Treated indls improved more than those receiving Placeo for sex

# Measures of Association -------------------
# if Ho is rejected ie. There is Dependency. Then find association
mytable4 = xtabs(~Treatment+Improved, data =Arthritis)
library(vcd)
vcd::assocstats(mytable4) # larger magnitude ? stronger association

# Converting Tables to flat files --------------
table2flat = function(mytable) {
  df = as.data.frame(mytable)
  rows = dim(df)[1]
  cols = dim(df)[2]
  x = NULL
  for (i in 1:rows) {
    for (j in 1:df$Freq[i]){
      row = df[i,c(i:cols-1)]
      x = rbind(x,row)
    }
  }
  row.names(x) = c(1:dim(x)[1])
  return(x)
}
# takes a R table with any no of rows & cols and retuns a Df in flat file

treatment = rep(c('Placebo','Treated'),times=3)
treatment
improved = rep(c('None','Some','Marked'),each=2)
improved
Freq = c(29,13,7,17,7,21)
mytable6 = as.data.frame(cbind(treatment,improved,Freq))
mytable6
str(mytable6)
mydata = table2flat(mytable6)  # NOT WORKING
#mydata

# 7.3 Correlations ------------------
# Strength 0 to 1; Direction +/-
# dataset state.x77 - population, income, illiteracy, life expectancy, murder rate, high school graduation
# packages - pysch, ggm
# Types - Pearson, Spearman(Rank), Kendall
help("state.x77") # matrix 50 rows & 8 colns
#cor(x - DF, use='everything' -missing data , method='person') person, spearman, kendall
states = state.x77[,1:6]
str(states)
dim(states)
head(states)
cov(states)   # Covariance
cor(states)   # Pearson Correlation
cor(states,method='spearman')   # Spearman  Correlation
# Strong + betw Income & HS Grad ; Strong - betw Illiteracy & life exp

x = states[,c('Population','Income','Illiteracy', 'HS Grad')]
y = states[,c('Life Exp', 'Murder')]
cor(x,y) # Relative relation between 2 sets

# Partial Correlation betn 2 Quantitative variables --------------
library(ggm)
ggm::pcor(c(1,5,2,3,6), cov(states))
# corr betw population & murder rate, others controlled(1,5,2,3,6)
head(states)
ggm::pcor(c(1,5,2,4,3,6), cov(states))

# Other type of Correlations -------------
#polycor::hetcor()  - hetergenous matrox

# Testing Correlations fo Significance Ho: No Relationship -----------
#cor.test(x,y,alternative='two.sided,..', method='pearson,....')
cor.test(states[,3],states[,5]) # Life Expectancy & Murder Rate is 0 : Reject, it is not 0
# only 1 correlation

psych::corr.test(states, use='complete') # Correlation & Sign levels for matrices for all corr tests
psych::corr.test(states, use='pairwise')

# Other Tests of Significance
#psych::pcor.test(r,q,n)

# t tests -----------------------------------------------------------------
# comparing samples - most common
# dataset in MASS::UScrime
str(MASS::UScrime)
# Are you more likely to be imprisoned if you commit a crime in South
# Compare 2 gp indepdent t test : Hypo that the 2 population means are equal
# t.tests(y~x,data) ; t.test(y1,y2) ; default unequal variances
# alternative = 2T, LT, RT ; var.equal=T, paired=T
library(MASS)
head(UScrime[,c('Prob','So')])  # So is a factor
t.test(Prob ~ So,data=UScrime) # two Tailed, Prob of imprisonment
# creates 2 samples So=0, So=1 out of the data set
# p<0.05, Reject Ho that they have equal probabilities

# 7.4.2 Dependent Tests --------------------------------
# Is unemployment rate greater in elder males
# Ho= Groups are not independent ie Dependent. Pre & Post measures
# Difference btw groups is normally distributed
sapply(UScrime[c('U1','U2')], function(x) (c(mean=mean(x),sd=sd(x))))
with(UScrime, t.test(U1,U2,paired=T))
# Diff of means is large, p< 0.05; Rejet Ho: Conclude - Independent

#7.5 Non Parametric Tests of Group Differences
# Comparing 2 groups
with(UScrime,by(Prob,So,median))

wilcox.test(Prob ~ So, data=UScrime)
# Reject the Ho that they are same - They are different
# used when groups are paried & assumptions of normality is not required

sapply(UScrime[c('U1','U2')],median)
with(UScrime, wilcox.test(U1,U2),paired=T)

# comparing more than 2 groups
# kruskal.test(y~A,data)
# friedman.test(y~A|B,data)

# incomplete......