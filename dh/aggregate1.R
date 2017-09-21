#aggregate1

rm(list=ls())
load(file='./data/du3.Rdata')
df2

# subset to be numeric, by to be factor type or which can be treated like a factor
aggregate(df2[c('sql', 'fees')], by=list(hostel), sum)


aggregate(df2[c('sql', 'rpgm')], by=list(gender,hostel), 
          function(x) c(sum(x), mean(x)))
str(df2)

