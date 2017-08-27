#Chapter - 9 : Analysis of Variance ------------------------------------------




fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)

library(effects)

plot(Effect("hp:wt", fit,
            list(wt=c(2.2,3.2,4.2))),
     multiline=TRUE)


lm_mtcars <- lm(mpg ~ wt, mtcars)

library(effects)
effect("wt", lm_mtcars, xlevels=list(wt = seq(2, 3, 0.1)))
