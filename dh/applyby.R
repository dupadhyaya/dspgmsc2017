# Apply Family - by
# used for DF split by factors
mtcars
# we can take am, gear or carb as factors
by(data, INDICES, FUN, ..., simplify = TRUE)
split(mtcars, mtcars$am)

by(mtcars$mpg,mtcars$am, FUN=sum )

# wrapper for tapply
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], mean)  # will not work

