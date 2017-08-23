# file2.R

mtcars
m= mean(mtcars[,1])
m # this will not be printed
print(m)
cat(m)
hist(mtcars$mpg)
#source('./gen/file2.R')