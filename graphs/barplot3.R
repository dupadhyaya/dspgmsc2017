# Bar Plot


http://www.r-graph-gallery.com/202-barplot-for-likert-type-items/
  
# library
library(likert) 

# Use a provided dataset
data(pisaitems) 
items28 <- pisaitems[, substr(names(pisaitems), 1, 5) == "ST24Q"] 

# Realize the plot
l28 <- likert(items28) 
summary(l28) 
plot(l28)


#http://www.r-graph-gallery.com/37-barplot-with-number-of-observation
# Data
name= c("DD","with himself","with DC","with Silur" ,"DC","with himself","with DD","with Silur" ,"Silur","with himself","with DD","with DC" )
average= sample(seq(1,10) , 12 , replace=T)
number= sample(seq(4,39) , 12 , replace=T)
data=data.frame(name,average,number)

# Basic Barplot
my_bar=barplot(data$average , border=F , names.arg=data$name , las=2 , col=c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6) ,  rgb(0.3,0.9,0.4,0.6)) , ylim=c(0,11) , main="" )
abline(v=c(4.9 , 9.7) , col="grey")

# Add the text 
text(my_bar, data$average+0.4 , paste("n = ",data$number,sep="") ,cex=1) 

#Legende
legend("topleft", legend = c("Alone","with Himself","With other genotype" ) , 
       col = c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6) , rgb(0.3,0.9,0.4,0.6) ,  rgb(0.3,0.9,0.4,0.6)) , 
       bty = "n", pch=20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.05, 0.05))
