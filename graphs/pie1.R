#Pie1

#Eg1
library(MASS)                 # load the MASS package 
school = painters$School      # the painter schools 
school.freq = table(school)   # apply the table function
pie(school.freq)              # apply the pie function

colors = c("red", "yellow", "green", "violet", 
    "orange", "blue", "pink", "cyan") 
pie(school.freq,             # apply the pie function 
      col=colors)                # set the color palette
