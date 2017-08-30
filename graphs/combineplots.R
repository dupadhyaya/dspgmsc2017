# Combining Plots
# 4 figures arranged in 2 rows and 2 columns
opar= par(no.readonly = T)
par(opar)

attach(mtcars)
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
