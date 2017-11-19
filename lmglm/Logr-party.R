#Log Regression
#https://visualstudiomagazine.com/articles/2016/12/01/logistic-regression-using-r.aspx
#
Age <- c(1,5,3,2,6,3,7,4,2,4)
Edu <- c(4,8,7,5,7,2,5,5,3,7)
Party <- c("red","red","red","red","red", "blue","blue","blue","blue","blue")
mydf <- data.frame(Age,Edu,Party)
mydf$Party <- factor(mydf$Party, levels=c("red","blue"))
mydf
