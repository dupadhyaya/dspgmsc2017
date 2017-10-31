#Chapter - 9 : Analysis of Variance ------------------------------------------

fit <- lm(weight ~ height, data=women)
summary(fit)
women$weight
women
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

fit3 <- lm(weight ~ height + I(height^2) + I(height^3), data=women)
summary(fit3)


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



# Student 
FAC1 = c('s1', 's2', 's3', 's4', 's5')
FAC2 = c('s6', 's7', 's8', 's9', 's10')
(FAC = stack(FAC1, FAC2))


# One way ANOVA
#Eg2
#Part-1
library(multcomp)
attach(cholesterol)
table(trt)
aggregate(response, by=list(trt), FUN=mean)
aggregate(response, by=list(trt), FUN=sd)
fit = aov(response ~ trt)
summary(fit)

#Part-2
library(gplots)
plotmeans( response ~ trt , xlab=' Treatement' , ylab='Response', main='Mean Plot \n with 95% CI')
detach(cholesterol)

#Eg3 : Multiple Comparisons
TukeyHSD(fit)
#Plot
par(las=2)
par(mar=c(5,8,4,2))
plot(TukeyHSD (fit))

par(las=0)
par(mar=c(5,4,6,2))
tuk = multcomp::glht(fit, linfct=mcp(trt='Tukey'))
plot(cld(tuk, level=0.05), col='lightgrey')


fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)




#9.5 2way Factorial ANOVA ----
attach(ToothGrowth)
table(supp, dose)
aggregate(len, by=list(supp, dose), FUN= mean)
aggregate(len, by=list(supp, dose), FUN= sd)
dose = factor(dose)
fit = aov(len ~ supp * dose)
summary(fit)

interaction.plot(dose, supp, len, type='b',
      col=c('red', 'blue'), pch=c(16,18),
      main='Interaction betweeen Dose and supp')


gplots::plotmeans(len ~ interaction(supp, dose, sep=' '),
                  connect=list(c(1,3,5), c(2,4,6)), col=c('red', 'darkgreen'),
                  main='Interaction Plot with 95% CIs', xlab ='Treatment
                  and Dose Combinations')

HH::interaction2wt(len ~ supp * dose)




library(effects)

plot(Effect("hp:wt", fit,
            list(wt=c(2.2,3.2,4.2))),
     multiline=TRUE)


lm_mtcars <- lm(mpg ~ wt, mtcars)

library(effects)
effect("wt", lm_mtcars, xlevels=list(wt = seq(2, 3, 0.1)))





