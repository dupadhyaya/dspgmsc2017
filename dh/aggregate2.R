# summary Stats with R 17 JUn 16
# http://r-exercises.com/2016/06/16/summary-statistics-with-aggregate-solutions/

# Aggregate the “airquality” data by “airquality$Month“, returning means on each of the numeric variables. Also, remove “NA” values.
aggregate(airquality, list(airquality$Month), mean, na.rm=T)
aggregate(mtcars, list(mtcars$am), mean, na.rm=T)


?with
# Aggregate the “airquality” data by the variable “Day“, remove “NA” values, and return means on each of the numeric variables.
aggregate(airquality, list(airquality$Day), mean, na.rm=T)
aggregate(airquality[c(1,2,3)], list(airquality$Day), mean, na.rm=T)

# Aggregate “airquality$Solar.R” by “Month“, returning means of “Solar.R“. The header of column 1 should be “Month“. Remove “not available” values.
aggregate(airquality$Solar.R, list(Month=airquality$Month), mean, na.rm=T)

#Apply the standard deviation function to the data aggregation from Exercise 3.
aggregate(airquality$Solar.R, list(Month=airquality$Month), sd, na.rm=T)

# The structure of the aggregate() formula interface is aggregate(formula, data, FUN)
# use aggregate.formula for a one-to-one aggregation of “airquality” by the mean of “Ozone” to the grouping variable “Day“.
aggregate(Ozone ~ Day, airquality, mean)

# Use aggregate.formula for a many-to-one aggregation of “airquality” by the mean of “Solar.R” and “Ozone” by grouping variable, “Month“.
aggregate(cbind(Solar.R, Ozone) ~ Month, airquality, mean)

# Dot notation can replace the “y” or “x” variables in aggregate.formula. Therefore, use “.” dot notation to find the means of the numeric variables in airquality“, with the grouping variable of “Month“.
aggregate(. ~ Month, airquality, mean)

# Use dot notation to find the means of the “airquality” variables, with the grouping variables of “Day” and “Month“. Display only the first 6 resulting observations.
head(aggregate(. ~ Day + Month, airquality, mean))

# Use dot notation to find the means of “Temp“, with the remaining “airquality” variables as grouping variables.
aggregate(Temp ~ ., airquality, mean)

# aggregate.ts is the time series method for aggregate().
aggregate(AirPassengers, nfrequency = 1, sd)
