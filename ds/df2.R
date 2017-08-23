# Data Frame

mtcars
?mtcars
str(mtcars)
summary(mtcars)
mtcars[1]
mtcars[1][5,1] # 5th row, 1st column
class(mtcars[1])
mtcars[[1]] # vector  , no rownames
mtcars[[1]][5]
class(mtcars[[1]])
mtcars$mpg  # vector
mtcars$mpg[5]

mtcars[,1] # vector
mtcars[,'mpg'] #vector

mtcars[ , c('mpg', 'gear','am')]
mtcars[1, , drop=T]  # as List one row at time
class(mtcars[1, , drop=T])


mtcars[ grep("^4", mtcars$gear),  ]

dim(mtcars)
length(mtcars)
nrow(mtcars)
logv = c(rep(TRUE,16), rep(FALSE,16))
logv
mtcars[logv,]$mpg

library(dplyr)
filter(mtcars, row_number() == n())
filter(mtcars, row_number() == 1)
filter(mtcars, row_number() == 1:5)

slice(mtcars, 5:n() )
mtcars
