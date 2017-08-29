#Chapter - 5 : Advanced Data Management ------------------------------------------
# Mathematical and Statistical Functions
# Character Functions
# Looping and conditional Execution
# User Written Functions
# Ways to Aggregate and reshape data

# 5.1 Data Mgt challenge
# Transformation due to varied ranges of marks
# 5.2 Numerical and Character Functions

# 5.2.1 Mathematical Functions
# abs, sqrt, ceiling, floor, trunc, round, signif, cos, sin tan
# acos, asin, atan, Hyperbolic: cosh, sinh, tanh, acosh, asinh, atanh
# log(x,base=n), log(x): Natural Log, log10(x): common log, exp
sqrt(c(4,16,25))

# 5.2.2 Statistical Functions
x= 1:1000
y = mean(x)
y
x= c(1:5, 500:1000, 2000:2005)
mean(x)
z = mean(x, trim=0.05, na.rm=T)
z
# z trimmed mean; dropping highest & lowest trim% of scores and missing value
# mean, median, sd, var, mad, quantile, range, sum 
# diff(x, lag=n): lagged diff, min, max, 
# scale(x, center=T, scale=T):  column Center or standardise(center=T, scale=T)

x = c(1,2,3,4,5,6,7,8)
mean(x)
sd(x)
(n=length(x) )
# another way 
(meanx = sum(x)/length(x))
(css  = sum((x - meanx)^2) )
(sdx = sqrt( css / (n-1) ) )

# Standardize Data  
# Scale
x = c(50:60, 70:80,95:99)
stdx = scale(x)   # std to mean of 0, SD=1
mean(stdx)  # almost 0
sd(stdx)

# Std to arbritary Mean
SD = 1.5 ; M = 65
stdx2 = scale(x) * SD + M  # Desired SD and M
stdx2
mean(stdx2)  # almost 65
sd(stdx2)    # to 1.5

sdf = read.csv(file='sdata.csv', header=T, stringsAsFactors = F)
sdf
# Data - Marks Range : sas(100), python(75), excel(200), rpgm(500)
sdf[,c(2:5)]
sdf2 = scale(sdf[,c(2:5)])
sdf2  # all are scaled with mean 0 and SD 1 wrt their column

# One column
sdf[,2]
mean(sdf[,2])
sd(sdf[,2])
scale(sdf[2])
scale(sdf[2]) * 10 + 60
normal = function(x){(x-min(x))/(max(x)-min(x))}
normal(sdf[2])

compare = data.frame(sdf[2], scale(sdf[2]),scale(sdf[2]) * 10 + 60, normal(sdf[2]) )
compare
summary(compare)

# Transform  1 by one
(newdata = transform(sdf, python1=scale(python)*10 + 50))
(newdata = transform(sdf, rpgm1=scale(rpgm)*10 + 50))


#library(clusterSIM) 
#normX = data.Normalization(x,type="n4") # Normalise between 0 and 1

# 5.2.3 Probability Functions ----------------------
# Used to generate simulated data with known characteristics & calc prob values
# [dpqr] distribution_abbreviation()
# d- density, p - distribution func, q - quantile, r - random generation

# Common Distributions
# beta, binom, cauchy, chisq, exp, f, gamma, geom, hyper
# lnorm, logis, multinom, nbinom, norm, pois, signrank, t, unif, weibull, wilcox

# Table 5.5
x = pretty(c(-3,3), 30)
#?pretty  sequence of about n+1 equally spaced ‘round’ values which cover the range of the values in x. 
#The values are chosen so that they are 1, 2 or 5 times a power of 10.
x
y = dnorm(x)
y
plot(x,y, type='l', xlab='Normal Deviate', ylab='Density', yaxs='i')

pnorm(1.96)

qnorm(.9, mean=500, sd=100)
rnorm(50, mean=50, sd=10)

# seed - each time random no, different results
# to make them reproducible, specify set.seed(value)

runif(5)  
runif(5)  # different nos

set.seed(1234)
runif(5)
set.seed(1234)
runif(5)  # same no series

# Generaing Multivariate Normal Data
# used in Monte Carlo Studies with given mean , covariance matrix
library(MASS)
mvrnorm(n, mean, sigma)
mvrnorm(5, 10,2)

options(digits=3)
set.seed(1234)
meanv = c(230.7, 146.7, 3.6)   # 3 Columns will have 3x3 covariance matrix
sigmav = matrix(c (15360.8, 6721.2, -47.1,
                   6721.2, 4700.9, -16.5,
                   -47.1, -16.5, 0.3), nrow=3, ncol=3)
mydata = mvrnorm(500, meanv, sigmav)
head(mydata)
summary(mydata)
mydata = as.data.frame(mydata)  # matrix to DF
names(mydata) = c('y', 'x1', 'x2')  # colnames
dim(mydata)
str(mydata)
head(mydata, n=10)
cor(mydata)
cov(mydata) # same as input 
plot(mydata)

# 5.2.4  Character Functions ------------------
# nchar, subst(x, start, stop), 
# grep(pattern, x, ignore.case=F, fixed=F)
# sub(pattern, replacement, x, ignore.case=F, fixed=F)
# strsplit(x, split, fixed=F)
# paste(..., sep='')
# toupper(x)  tolower(x)
x = c('ab', 'cde', 'fghij')
length(x)
nchar(x)

x= 'abcdef'
substr(x,2,4)  # want bcd
substr(x,2,4) = '222222'
x   # replace selected substr

grep('A', c('b','A','c'))
#2  # Matching indices

sub('\\s', '.', 'Hello There')
# replace space with dot .
sub('o', 'O', 'Hello There')
sub('e', 'E', 'Hello There')
?sub

stringr::str_replace_all(string, pattern, replacement)
stringr::str_replace_all('Hello There', 'e', 'E')

# split elements
strsplit('abc','')
strsplit('a bc def j','\\s')

y= strsplit('abc','')
unlist(y)[2]
sapply(y,"[",2)

paste('x', 1:3,sep='')  # x1 x2 x3
paste('x', 1:3,sep='M')  # xM1 xM2 xM3
paste('Todays date is ', date(), sep=' - ')  

toupper('AbC')
tolower('AbC')

# ^[hc]?at  # start with h or c. followed by at
# eg. cat, hat, not bat


# 5.2.5  Other Useful Functions
length(x)
x = c(2,5,6,9)
length(x)

seq(from, to, by)
seq(1,10,2)

rep(x, n) # x - n times
rep(1:3, 2)
rep(1:3, 4)

cut(x, n) # divide x into n levels, ordered_result=T
cut(1:100,5)

pretty(x,n) # pretty breakpoints. continuous var x into n intervals
# by selecting n+1 equally spaced rounded values. often used in plotting
pretty(1:100,5)


cat(..., file='myfile', append=F)
firstname = c('Dhiraj')
cat(' Hello ', firstname, ' Upadhyaya', '\n')

# Regular Expression which is not mathematical

# 5.2.6 Applying functions to matrices and DFs
a = 5
sqrt(a)
b=c(1.243, 5.654, 2.99)
round(b)

c = matrix(runif(12), nrow=3)
c
log(c)  # natural log base e
log(c, base=exp(1))  # natural log base e

log(c,base=2)  # base 2
log2(c)

log10(c)  # base 10
log(c,base=10)  # base 10

mean(c)

# Apply

apply(x, MARGIN, FUN)

mydata = matrix(rnorm(30), nrow=6)
mydata
apply(mydata, 1, mean)  # rows
apply(mydata, 2, mean)  # cols
apply(mydata, 2, mean, trim=0.2)  # ignore extreme 20% values
# apply - margins of an array
# lapply & sapply to list

#5.3 Solution for our Data Management Challenge
# Combine test score into a a single performance indicator 
# for each student, grade each student from A to F based on 
# their relative standing (top 20%, next 20%)
# sort students by students lastname followed by first name


options(digits=2)
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
               "David Jones", "Janice Markhammer", "Cheryl Cushing",
               "Reuven Ytzrhak", "Greg Knox", "Joel England",
               "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                       stringsAsFactors=FALSE)
roster
z <- scale(roster[,2:4])
z
score <- apply(z, 1, mean)
score
roster <- cbind(roster, score)
roster
# ------
score
sort(score)
# Cut off for various grades A-.8, B-.6, C-.4, D-.2
y = quantile(score,c(.8,.6,.4,.2) )
y; y[1]; y[2]
# add another col grade
roster$grade[score >= y[1]] = 'A'
roster

roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"
roster
# seperate first and last name
name <- strsplit((roster$Student), " ")
# Vector of strings returns a list  [ - extract part of the object
name[1] ; name[[1]] ; sapply(name, "[[", 2)
sapply(name, "[[", 1); # first item of each list item
sapply(name, "[[", 2)  # 2nd item of each list item
sapply(name, "[", 2)


name
# first data from left is firstname, second is lastname
lastname <- sapply(name, "[", 2)
firstname <- sapply(name, "[", 1)
# remove first coln of roster and add first and last name
roster <- cbind(firstname,lastname, roster[,-1])  # order
roster <- roster[order(lastname,firstname),]  # sort
roster

# 5.4 Control Flow
# statement, cond, expr, seq
# Repetition and looping
# for (var in seq) statement
for (i in 1:10) print(paste(i, 'Hello'))

# while (cond) statement
i = 10  # Initialise and then reduce by 1
while (i > 0) {print(paste(i," Hello Friend")); i = i - 1 }

# 5.4.2 Conditional Execution
# if (cond)  statement ; if (cond) statement1 else statement2
# grade vector
roster
str(grade)
if (is.character(grade)) grade = as.factor(grade)
str(grade)
#line check
is.factor(grade)
if (!is.factor(grade)) {
  grade = as.factor(grade) 
  } else { 
  print(' Grade is already is a factor') 
  }

# ifelse
score
ifelse(score > 0.5, print('Passed'), print('Failed'))

# switch(expr, ..)
# listing 5.7  # not a good example
feelings = c('sad', 'afraid', 'angry')
for (i in feelings)
  print (
    switch (i,
           happy = ' I am glad you are happy',
           afraid = ' There is nothing to fear',
           sad = ' Cheer up',
           angry = ' Calm down now'
  )
  )

# 5.5  User written functions
myfunction = function(arg1, arg2, ...) {
  statements
  return(object)
}

mysumfunc <- function(x, y) {
  mysum = x + y
}

# long example

mystats <- function(x, parametric=TRUE, print=FALSE) {
  if (parametric) {
    center <- mean(x); spread <- sd(x)
  } else {
    center <- median(x); spread <- mad(x)
  }
  if (print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center, spread=spread)
  return(result)
}

set.seed(1234)
x = rnorm(500)
y = mystats(x)
y

# Date
mydate <- function(type="long") {
  switch(type,
         long = format(Sys.time(), "%A %B %d %Y"),
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n")
  )
}
mydate()
mydate("long")
mydate("short")
mydate("shorten")

# 5.6  Aggregating and Restructuring
# 5.6.1  Transpose  Reverse rows & columns

head(mtcars)
cars = mtcars[1:5, 1:4]  # 1 to 5 rows, 1:4 columns
cars
t(cars)

# 5.6.2 Aggregating Data
aggregate(x, by, FUN)
# by - list of variables, FUN- summary stats function
options(digits=3)
attach(mtcars)
head(mtcars)
# for No of Cyl Type, then Gear Nos - find average of all other values
aggdata = aggregate(mtcars, by=list(cyl, gear), FUN=mean, na.rm=TRUE)
head(aggdata)
str(mtcars)  # 32 observations
head(mtcars)

# reshape package
# melt data into any shape.
id= c(1,1,2,2)
time = c(1,2,1,2)
x1 = c(5,3,6,2)
x2 = c(6,5,1,4)
mydata = data.frame(id, time, x1, x2)
mydata
# each values in X1 & X2 identified by combination of ID & Time
# name & dob - unique

library(reshape)
md = melt(mydata, id=(c('id', 'time')))
md
mydata

# casting : cast()
newdata = cast(md, formula, FUN) # md melted data, FUN - optional agg func
# FUN = rowvar1 + ...
md
cast(md, id+time~variable)  # without aggregation
cast(md, id ~ variable, mean)
melt(mydata, id=c('id','time'))
cast(md,id+variable ~ time)
cast(md, id~variable + time)
cast(md, id ~ time, mean)


# Summary =========







# ------ extras
with( sdf, {
  mean(sas)
  sd(sas) })

