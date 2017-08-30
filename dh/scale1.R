# Scale
#standardization of the data
#scale is generic function whose default method centers and/or scales the columns of a numeric matrix.

x = rnorm(100,50,10)
scale(x)

hist(x)
hist(scale(x))
scale(x, center=T)
scale(x, center=2)
plot(scale(x, center=2))  # irrelevant

(marks1 = ceiling(runif(10,50,100)))
(marks2 = ceiling(runif(10,50,150)))
scale(marks1)
scale(marks1)[,1]
round(scale(marks1)[,1],2)
round(scale(marks2)[,1],2)

round(scale(marks1)[,1],2)

round(scale(marks1, center=F)[,1],2)
round(scale(marks2, center=F)[,1],2) 

round(scale(marks1, center=c(0,1))[,1],2)




#
s = sort(rexp(100))
s
range01 <- function(x){(x-min(x))/(max(x)-min(x))}
range01(s)


#
library("scales")
s=marks1
rescale(s)

rescale(marks1)
rescale(s, to=c(0,10))
rescale(s, from=c(0, max(s)))

x=marks1
scale(x,center=min(x),scale=diff(range(x)))[,1]



# Example Data
x = sample(-100:100, 50)

#Normalized Data
normalized = (x-min(x))/(max(x)-min(x))

# Histogram of example data and normalized data
par(mfrow=c(1,2))
hist(x,          breaks=10, xlab="Data",            col="lightblue", main="")
hist(normalized, breaks=10, xlab="Normalized Data", col="lightblue", main="")
par(mfrow=c(1,1))
