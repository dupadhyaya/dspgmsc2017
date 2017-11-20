#Linear Regression

#myfit = lm(formula, data)
data(women)  # load women data set
women
?women  # weight depends on height
#height	 numeric	 Height (in)
#weight	 numeric	 Weight (lbs)

# Linear Regression y = mx + c 

attach(women)
cov(height,weight)
cor(women$height,women$weight)
(weight.lm = lm(weight ~ height, data=women))

summary(weight.lm)
plot(height, weight )
abline(weight.lm, col='red')
abline(v=c(62,64,66))
abline(h=140)
fitted(weight.lm)
lines(height, weight, col='blue')
lines(height, fitted(weight.lm), col='green')
cbind(height,weight, fitted(weight.lm))
cbind(height,weight, fitted(weight.lm), weight-fitted(weight.lm), residuals(weight.lm))

summary(residuals(weight.lm))
new.data = data.frame(height= 70)
new.data = data.frame(height=c(70,75,80))

predict(weight.lm, newdata = new.data, interval='confidence')
predict(weight.lm, newdata = new.data, interval='prediction')




# Polynomial Regression X2
weight.lm2 = lm(weight ~ height + I(height^2), data=women)
weight.lm2
summary(weight.lm2)
plot(women$height, women$weight, xlab='Ht in inch', ylab='Weight in lbs')
lines(women$height, fitted(weight.lm2), col='purple', lwd=2)
text(mean(women$height)+5, mean(women$weight), 'Polynomial', col='purple', cex=.8)
lines(women$height, fitted(weight.lm), col='red', lwd=3)
text(mean(women$height)-5, mean(women$weight), 'Linear', col='red', cex=.6)

# higher polynomial
weight.lmn = lm(weight ~ height + I(height^2) + I(height^3), data=women)
summary(weight.lmn) # max residual errors reduced

# scatter plot for above data
library(car)
car::scatterplot(weight ~ height, data=women, spread=F, smoother.args= list(lty=2),
    pch=19, main='Women age 30-39', xlab='Ht in inch', ylab='Wt in lbs' )

#http://www.dummies.com/programming/r/how-to-predict-new-data-values-with-r/



# Linear - Polynomial - Multiple Linear


# Eruptions

attach(faithful)     # attach the data frame 
eruption.lm = lm(eruptions ~ waiting)
summary(eruption.lm)
newdata = data.frame(waiting=c(80,90,100))
predict(eruption.lm, newdata) #, interval="confidence")
head(faithful)
faithful[waiting==80,]




# Another Example
area=c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3)
sales=c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1)
df = data.frame(area,sales)
sales.lm = lm(sales ~ area, data=df)
summary(sales.lm)
