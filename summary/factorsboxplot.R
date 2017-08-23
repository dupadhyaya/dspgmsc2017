#Factors2
months = c('Jan','Feb', 'Mar', 'Apr','May')
sales  = c(160, 220, 190, 230, 250)

table(months)

monthlysales1 = data.frame(months, sales, stringsAsFactors = F)
str(monthlysales1)
boxplot(monthlysales1) # will not work

#stringasfactors =T  (Default)
monthlysales2 = data.frame(months, sales)
str(monthlysales2)
monthlysales2$months  # no ordering : alphabetical by default

boxplot(monthlysales2)
boxplot(sales ~ months, data= monthlysales2)
# unordered months
monthlysales2$months = factor(monthlysales2$months, 
        levels = c('Jan', 'Feb', 'Mar', 'Apr','May')) 
monthlysales2



# Boxplot of MPG by Car Cylinders 
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")

#Insects
#The problem
#Boxplot of how many insect counts there are for each insect spray
str(InsectSprays)
head(InsectSprays)
boxplot(count~spray,data=InsectSprays,xlab="spray",ylab="insect count",main="InsectSpray data")
#What if we would like a different order than A,B,C,D,E,F?

#The solution
#Make a new factor that reflects the desired order
#For this example, A should be the 4th, B the 1st and so on
order<-as.factor(rep(c(4,1,2,5,6,3), each=12))
table(order)
#Column bind order to the existing InsectSprays data
ispray<-cbind(InsectSprays,order) # new DF
#Rename the factor levels of order to reflect the names in spray 
levels(ispray$order)<-c("B","C","F","A","D","E")
#Boxplot using order instead of spray
boxplot(count~order,data=ispray,xlab="spray",ylab="insect count",main="InsectSpray data")
str(ispray)


boxplot(count ~ spray, data=ispray)
boxplot(count ~ order, data=ispray)

with(ispray, boxplot(split(count, order)))
#(split() does automate the construction of a suitable data structure.)
?split
s = split(ispray, order)
s

#box plot of variable boxthis with respect to two factors f1 and f2. 
#f1 and f2 are factor variables and each of them takes two values and
#boxthis is a continuous variable. 
#4 boxplots on a graph, each corresponding to one combination from the possible combinations that f1 and f2 can take.
#https://stats.stackexchange.com/questions/11406/boxplot-with-respect-to-two-factors-using-ggplot2-in-r

library(ggplot2)

df <- data.frame(f1=factor(rbinom(100, 1, 0.45), label=c("m","w")), 
                 f2=factor(rbinom(100, 1, 0.45), label=c("young","old")),
                 boxthis=rnorm(100))
rbinom(100, 1, 0.45) 
rbinom(100, 1, 0.45)
?rbinom
df
df$f1f2 <- interaction(df$f1, df$f2) # various combination
df$f1f2
ggplot(aes(y = boxthis, x = f1f2), data = df) + geom_boxplot()
#add extra space between boxplots
ggplot(aes(y = boxthis, x = f1f2), data = df) + geom_boxplot(position = position_dodge(width = .9))
ggplot(aes(y = boxthis, x = f2, fill = f1), data = df) + geom_boxplot()
ggplot(aes(y = boxthis, x = f2, fill = f1, dodge=f1), data = df) + geom_boxplot()
