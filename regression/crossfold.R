mtcars

split(mtcars , f = rep_len(1:4, nrow(mtcars) ) )

library(ISLR)
library(boot)
Auto
attach(Auto)
model1 = glm(mpg ~ horsepower, data =Auto)
mse_loocv = cv.glm(Auto, model1)
mse_loocv
model1 = lm(mpg ~ horsepower, data=Auto)
mse_fold = cv.glm(Auto, model1, K=3)
mse_fold
