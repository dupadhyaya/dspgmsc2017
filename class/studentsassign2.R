# Student PPT
# Shruti
month <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
           'August', 'September', 'October', 'November', 'December')
high_2000 <- c(32.5, 37.6, 49.9, 53.0, 69.1, 75.4, 76.5, 76.6, 70.7, 60.6, 45.1, 29.3)
low_2000 <- c(13.8, 22.3, 32.5, 37.2, 49.9, 56.1, 57.7, 58.3, 51.2, 42.8, 31.6, 15.9)
data1 <- data.frame(month, high_2000,low_2000)
data1
mean(data1$high_2000)
sd(data1$high_2000)
qqnorm(data1$high_2000,main="Normal Q-Q Plot of the Temperature",
       xlab="Theoretical Quantiles of the 2007 High Temp",
       ylab="Sample Quantiles of the 2007 High Temp")
qqline(data1$high_2000)

qqnorm(data1$low_2000,main="Normal Q-Q Plot of the Temperature",
       xlab="Theoretical Quantiles of the 2007 High Temp",
       ylab="Sample Quantiles of the 2007 High Temp")
qqline(data1$low_2000)



#Meena
attach(mtcars)
mtcars$carb
mean(carb)
summary(carb)
str(mtcars)
boxplot(wt, main='Box Plot of Carb')
hist(wt)
lines(wt)

marks= rnorm(100,50, 10)
hist(marks, freq=F)
lines(density(marks))
