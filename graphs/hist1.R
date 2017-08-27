#hist1 histogram

#Eg1
duration = faithful$eruptions 
duration
hist(duration,    # apply the hist function 
         right=FALSE)    # intervals closed on the left
hist(duration, right=T)
hist(duration, breaks=c(1,2,3,max(duration)))
?hist

colors = c("red", "yellow", "green", "violet", "orange", 
           +   "blue", "pink", "cyan") 
hist(duration,    # apply the hist function 
        right=FALSE,    # intervals closed on the left 
         col=colors,     # set the color palette 
         main="Old Faithful Eruptions", # the main title 
          xlab="Duration minutes")       # x-axis label

