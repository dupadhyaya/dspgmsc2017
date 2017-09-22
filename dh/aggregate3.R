#Aggregate 3

#aggregate can be seen as another a different way of use tapply 
#if we use it in such a way.
(at <- tapply(iris$Sepal.Length , iris$Species , mean))
(ag <- aggregate(iris$Sepal.Length , list(iris$Species), mean))  # returns df

# The two immediate differences are that the second argument of aggregate must be a list while tapply can (not mandatory) be a list and that the output of
# aggregate is a data frame while the one of tapply is an array.

#power of aggregate is that it can handle easily subsets of the data with subset argument and 
#that it has methods for ts objects and formula as well.

#These elements make aggregate easier to work with that tapply in some situations

(ag <- aggregate(len ~ ., data = ToothGrowth, mean))

#achieve the same with tapply but the syntax is slightly harder and the output (in some circumstances) less readable:
(att <- tapply(ToothGrowth$len, list(ToothGrowth$dose, ToothGrowth$supp), mean))

#other times when we can't use by or tapply and we have to use aggregate.

(ag1 <- aggregate(cbind(Ozone, Temp) ~ Month, 
            data = airquality, mean))
# see difference , or +
(ag1 <- aggregate(Ozone + Temp ~ Month, 
                  data = airquality, mean))

#We cannot obtain the previous result with tapply in one call but we have to calculate the mean along Month for each elements and then combine them (also note that we have to call the na.rm = TRUE,
#because the formula methods of the aggregate function has by default the na.action = na.omit):
  
(ta1 <- tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE))
(ta2 <- tapply(airquality$Temp, airquality$Month, mean, na.rm = TRUE))

cbind(ta1, ta2)

#by we just can't achieve that in fact the following function call returns an error (but most likely it is related to the supplied function, mean):

(by(airquality[c("Ozone", "Temp")], airquality$Month, mean, na.rm = TRUE))
#error

#Other times the results are the same and the differences are just in the class (and then how it is shown/printed and not only --

(byagg <- by(airquality[c("Ozone", "Temp")], airquality$Month, summary))
(aggagg <- aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, summary))
#at some points what tool to use is just a matter of personal tastes and needs; the previous two objects have very different needs in terms of subsetting.
