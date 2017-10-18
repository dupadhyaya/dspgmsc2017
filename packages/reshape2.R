# reshape2

require(reshape2)  # another way to add library
(x = data.frame(subject = c("Lalit", "Vijay"), 
  time = c(1,1), age = c(33,NA),
  weight = c(80, NA),  height = c(2,2)))

# melt the data
(molten = reshape2::melt(x, id.vars = c("subject", "time")))

?melt
(molten = melt(x, id = c("subject", "time"), na.rm = TRUE))


dcast(molten, formula = time + subject ~ variable)
dcast(molten, formula = subject + time  ~ variable)
dcast(molten, formula = subject  ~ variable)
dcast(molten, formula = ...  ~ variable)

acast(molten, formula = subject  ~ time ~ variable)

data(airquality)
head(airquality)
(aqm <- melt(airquality, id=c("Month", "Day"), na.rm=TRUE))
library(plyr) # needed to access . function
acast(aqm, variable ~ Month, mean, 
      subset = .(variable == "Ozone"))


# aggregation
# Melt French Fries dataset
data(french_fries)
(ffm <- melt(french_fries, id = 1:4, na.rm = TRUE))

# Aggregate examples - all 3 yield the same result
dcast(ffm, treatment ~ .)
dcast(ffm, treatment ~ ., function(x) length(x))
dcast(ffm, treatment ~ ., length) 

# Passing further arguments through ...
dcast(ffm, treatment ~ ., sum)
dcast(ffm, treatment ~ ., sum, trim = 0.1)