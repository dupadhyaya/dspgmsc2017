# aggregate
# calc on ~ group variables

require(ggplot2)
data(diamonds)
head(diamonds)
str(diamonds)

aggregate(price ~ cut, diamonds, mean)
aggregate(price ~ cut + color, diamonds, mean)
aggregate(cbind(price, carat) ~ cut, diamonds, mean)
