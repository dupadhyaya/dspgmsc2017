#Linear Regression

#myfit = lm(formula, data)
data(women)
women
?women
#height	 numeric	 Height (in)
#weight	 numeric	 Weight (lbs)

attach(women)
cov(height,weight)
cor(height,weight)
weight.lm = lm(weight ~ height, data=women)

weight.lm
summary(weight.lm)
plot(height, weight )
abline(weight.lm, col='red')

fitted(weight.lm)
lines(height, weight, col='blue')
lines(height, fitted(fit), col='green')
cbind(height,weight, fitted(weight.lm))
cbind(height,weight, fitted(weight.lm), weight-fitted(weight.lm), residuals(weight.lm))

summary(residuals(weight.lm))
new.data = data.frame(height= 70)
new.data = data.frame(height=c(70,75,80))

predict(weight.lm, newdata = new.data, interval='confidence')
predict(weight.lm, newdata = new.data, interval='prediction')

#http://www.dummies.com/programming/r/how-to-predict-new-data-values-with-r/



# Eruptions

attach(faithful)     # attach the data frame 
eruption.lm = lm(eruptions ~ waiting)
summary(eruption.lm)
newdata = data.frame(waiting=c(80,90,100))
predict(eruption.lm, newdata) #, interval="confidence")
head(faithful)
faithful[waiting==80,]
