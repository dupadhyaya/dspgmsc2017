#Regression with Dummy Variables
mycars <- mtcars
mycars$cyl <- factor(mycars$cyl)
contrasts(mycars$cyl)
fit <- lm( mpg ~ wt+cyl, data=mycars, x=T )
summary(fit)
?lm
fit$contrasts

head(fit$x)
cbind(mycars$mpg, fitted(fit))
