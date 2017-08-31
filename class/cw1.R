
marks1= scan()
cat(marks1)
marks1 = c(7.5, 10, 8.33, 6.67, 9.17, 5.83, 6.67, 4.17, 7.5, 7.5, 8.33)
marks1
mean(marks1)
median(marks1)
table(marks1)
names(sort(table(marks1), decreasing=T))

library(modeest)
(mlv(marks1,  method = "mfv"))
#7.5

var(marks1)
sd(marks1)
mad(marks1, center=mean(marks1))  # 1.3 Excel
mad(marks1, center=median(marks1))  #1.24 Excel

?mad # Median Absolute Deviation
range(marks1)
summary(marks1)

quantile(marks1,c(.25, .5, .75))
IQR(marks1)

library(e1071)
e1071::kurtosis(marks1)
e1071::skewness(marks1)

hist(marks1)
plot(density(marks1))


qqnorm(marks1)
qqline(marks1)

# Stem and Leaf
marks1
stem(marks1)

(marks2= ceiling(runif(100,50,60)))
stem(marks2, scale=2)
?stem

y<-c(0.056, -0.022)
stem(y, scale = 2)

stem(y, scale=0.5, atom=0.1)
