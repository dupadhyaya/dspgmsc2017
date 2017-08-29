# describeby

library(psych)
mtcars[1:5]
describeBy(mtcars[1:7], list(am=mtcars$am))
nrow(mtcars)
describeBy(mtcars[1:7], list(am=mtcars$am, gear=mtcars$gear))
