# aggregate
cars = data.frame(cyl=c(4,4,3,4), gear=c(3,2,3,2), kpl=c(5,2,3,7))
cars
aggregate(cars, by=list(cars$cyl), FUN=mean)
(3+2+2)/3
(x=aggregate(cars, by=list(cyl1=cars$cyl, gear1=cars$gear), FUN=mean))
x[c(1,2,5)]
