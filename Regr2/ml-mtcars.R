# Multiple Regression in R
(model1 = lm(mpg ~ disp + cyl + hp
            + drat + wt + qsec + carb, data=mtcars))

summary(model1)
anova(model1)
vcov(model1)

layout(matrix(c(1,2,3,4),2,2))
plot(model1)


(model2 = lm(mpg ~ disp + cyl + wt , data=mtcars))
summary(model2)

anova(model1, model2)


(model3 = lm(mpg ~ cyl + wt , data=mtcars))
summary(model3)

anova(model3, model2)

plot(model3)

anova(model3, model1)
anova(model1, model3)
