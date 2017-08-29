# describe
library(Hmisc)
str(mtcars)
Hmisc::describe(mtcars[c('hp', 'wt', 'hp', 'mpg')])
