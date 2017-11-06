#Chapter - 8 : Regression ------------------------------------------


x<-rchisq(100, df=2)
x
qqPlot(x)
qqPlot(x, dist="chisq", df=2)

qqPlot(lm(prestige ~ income + education + type, data=Duncan), 
       envelope=.99)
states['Nevada', ]
fitted(fit)['Nevada']
residuals(fit)['Nevada']
rstudent(fit)['Nevada']

#8.3.2
library(car)
data(state.x77)
states = as.data.frame( state.x77[ , c('Murder', 'Population',
          'Illiteracy', 'Income', 'Frost')])
fit = lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)

qqPlot(fit, labels=row.names(states),  id.method='identity',
       simulate=T, main='Q-Q Plot')
?qqplot




fit <- lm(weight ~ height, data=women)
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

# Polynomial
fit2 <- lm(weight ~ height + I(height^2), data=women)
summary(fit2)
plot(women$height,women$weight,
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height,fitted(fit2))

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

mtcars
mydata = mtcars[c('mpg','cyl', 'hp', 'wt', 'gear', 'carb')]
round(cor(mydata),2)

car::scatterplotMatrix(mydata, spread=FALSE, lty.smooth=2,
     main="Scatter Plot Matrix"    )
fit = lm(mpg ~ cyl + hp + wt + gear + carb, data= mydata)
summary(fit)



#8.6.1 Comparing Models
library(MASS)
?state.x77
str(state.x77)
class(state.x77)

head(state.x77)
states = as.data.frame(state.x77[,c('Murder','Population',
         'Illiteracy', 'Income', 'Frost') ])
fit1 = lm(Murder ~Population + Illiteracy + Income + Frost, data=states)         
fit2 = lm(Murder ~Population + Illiteracy , data=states)         
anova(fit2,fit1)

# AIC
fit1 = lm(Murder ~Population + Illiteracy + Income + Frost, data=states)         
fit2 = lm(Murder ~Population + Illiteracy, data=states)         

AIC(fit1, fit2)

fit1 = lm(Murder ~Population + Illiteracy + Income + Frost, data=states)         
fit2 = lm(Murder ~Population + Illiteracy + Income, data=states)         

AIC(fit1, fit2)


#All Subsets Regression
library(leaps)
states = as.data.frame(state.x77[,c('Murder','Population',
'Illiteracy', 'Income', 'Frost') ])

leaps = regsubsets(Murder ~Population + Illiteracy + Income + Frost, data=states, nbest=4)
plot(leaps, scale='adjr2')

library(car)
subsets(leaps, statistics = 'cp', main='Cp plot for all subsets Regression')
abline(1,1, lty=2, col='red')



#8.7.2 Cross Validation

shrinkage = function(fit, k=10) {
require(bootstrap)
theta.fit = function(x,y) { lsfit(x,y)}
theta.product = function(fit, x) {cbind(1,x) %x% fit $coef}
x = fit$model[,2:ncol(fit$model)]
y = fit$model[,1]
results = crossprod(x,y, theta.fit, theta.product, ngroup=k)
r2 = cor(y, results$cv.fit)^2
cat("Original R Square =", r2, '\n')
cat(k, " Fold Cross Validated R Square =", r2cv, '\n')
cat(' Change = ', r2-r2cv , '\n')
}

states = as.data.frame(state.x77[,c('Murder','Population',
      'Illiteracy', 'Income', 'Frost') ])
fit = lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)         
shrinkage(fit)

fit2 = lm(Murder ~ Population + Illiteracy, data=states)         
shrinkage(fit2)
