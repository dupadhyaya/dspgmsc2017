# Modeling on women data set
data(women)
cor(women)
plot(women)  #par(mfrow=c(1,1))
abline(lm(weight ~ height, data=women),col='red' )
fit <- lm(weight ~ height, data=women)
plot(fit)
summary(fit)
women$weight

coefficients(fit)
fit$effects
cor(fitted(fit), women$weight)
fitted(fit)
residuals(fit)
plot(women$height,women$weight,xlab="Height (in inches)",
     ylab="Weight (in pounds)")
abline(fit)
# Weight = -87 + 3.455 x Height
#(mfrow=c(2,2))
plot(fit)
residualPlots(fit)

plot(y=residuals(fit),x= fitted(fit))

cbind(y=sqrt(scale(residuals(fit)^2)), x=fitted(fit))
residuals(fit)

x1 = residuals(fit)
y1=(x1 - min(x1)) / diff(range(x1))
plot(y=sqrt(y1), x=fitted(fit), ylim=c(0,1.5))

qqplot(residuals(fit))
scatter.smooth(y=sqrt(scale(residuals(fit))), x=fitted(fit))

loess.smooth(y=sqrt(scale(residuals(fit))), x=fitted(fit)) 
             
# Polynomial
fit2 <- lm(weight ~ height + I(height^2), data=women)
summary(fit2)
plot(women$height,women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height,fitted(fit2))


#8.3.2 -----
fit2 = lm(weight ~ height + I (height ^ 2), data = women)
par(mfrow=c(2,2))
plot(fit2)

newfit = lm(weight ~ height + I (height ^ 2), data = women[-c(13,15),])
par(mfrow=c(2,2))
plot(newfit)


#Plot
par(mar=c(4,4,3,2))
library(car)
car::scatterplot(weight ~ height,
                 data=women,
                 spread=FALSE, lty.smooth=2,
                 pch=19,
                 main="Women Age 30-39",
                 xlab="Height (inches)",
                 ylab="Weight (lbs.)")

women$height
attach(women)
cbind(h=height, w= weight, W=round(fitted(fit),2), R=round(residuals(fit),2) )




#Eg1
data("women")
x = women$height
y = women$weight
mod1 <- lm(y ~ x)
plot(mod1)
plot(x, y, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod1, lwd=2)

res <- signif(residuals(mod1), 5)
pre <- predict(mod1) #
segments(x, y, x, pre, col="red")
library(calibrate)
textxy(x, y, res, cx=0.7)
# Difference Data Set; try the same thing
x <- c(173, 169, 176, 166, 161, 164, 160, 158, 180, 187)
y <- c(80, 68, 72, 75, 70, 65, 62, 60, 85, 92) # plot scatterplot and the regression line

#Different Data
x <- c(173, 169, 176, 166, 161, 164, 160, 158, 180, 187)
y <- c(80, 68, 72, 75, 70, 65, 62, 60, 85, 92)
mod2 <- lm(y ~ x)
plot(x, y, xlim=c(min(x)-5, max(x)+5), ylim=c(min(y)-10, max(y)+10))
abline(mod2, lwd=2)
res <- signif(residuals(mod2), 5)
pre <- predict(mod2)
segments(x, y, x, pre, col="red")
library(calibrate)
textxy(x, y, res, cx=0.7)



fit= lm(weight ~ height, data=women)
plot(x=fitted(fit), y=residuals(fit), main=' Residuals vs Fitted Values')
lines(loess.smooth(x=fitted(fit), y=residuals(fit)))

scatter.smooth(x=fitted(fit), y=residuals(fit), col='red',
               lpars= list(col='blue', lwd=3,lty=3))
points(x=fitted(fit), y=residuals(fit), col='green', pch=20)
labeltext = paste(rownames(women),paste(paste(women$height, women$weight,sep=','), round(fitted(fit),1),sep='-'), sep='=') 
labeltext
text(x=fitted(fit), y=residuals(fit),labeltext, cex=.75)
plot(fit, which=1)
text(x=fitted(fit), y=residuals(fit),labeltext, cex=.75)

# 
plot(lm(dist ~ speed, data = cars), which=1)

y=11:20 ; x=1:10
plot(x,y)
plot(lm(y ~ x), which=1)

influencePlot(lm(weight ~ height, data=women), id.method='identify',
              main='Influence PLot' , sub='Circle size is proportional to Cooks Distance' )

avPlots(lm(weight ~ height, data=women,
        ask=F, id.method='identify'))

avPlots(lm(mpg ~ hp + wt + cyl,
           data= mtcars),  ask=F, id.method='identify')


cutoff = 1/ nrow(women) -
  (length(lm(weight ~ height,
            data=women)$coefficients) - 2)
cutoff
plot(lm(weight ~ height,
        data=women), which=4, cook.levels=cut.off)


