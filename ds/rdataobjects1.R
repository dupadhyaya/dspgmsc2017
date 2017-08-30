# R Data Objects
# 
save(x, y, z, ..., file=)  # one or more
x = rnorm(100,20,5)
y = runif(50,10, 100)
save(x, y, file='dudata.RData')
z = rbinom(10, 5, .5)
z
?rbinom
save.image(file='dudata1.RData')  # save all objects

# plain text  saving to disk
name = c('dhiraj', 'upadhyaya')
write(name, file='./ds/name.txt')


#write to csv files - seperate
#write.csv(data, file='abc.csv')


# remove all objects
rm(list=ls())  # remove
ls()  # check

#Loading files
getwd()
load(file='dudata1.RData')  # 3 objects
ls()
rm(list=ls())  # remove
ls()
load(file='dudata.RData')  # only 2 objects
ls()
