
library(zoo)
x <- zoo(data.frame(A = c(1,2,3,4,5,6),
    B = c(7,8,9,10,11,12),
    C = c(13,14,15,16,17,18)),
    order.by = seq(as.Date("2012-01-01"),
    as.Date("2012-06-01"), 
   by  = "month"))
x
# Replicate it DF 2 times
?coredata
coredata(x)
coredata(x)[rep(seq(nrow(x)),2),]
