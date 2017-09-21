#with by
#functions that can help write simpler and more efficient code.
with(data=mtcars, aggregate(by=list(cyl), FUN=mean))
by(x=mtcars, mtcars$am, function(x) mean(x))

#with ------
#applys an expression to a dataset. I
# with(data, expression)
# example applying a t-test to a data frame mydata 
with(mydata, t.test(y ~ group))




#by -----
#by( ) function applys a function to each level of a factor or factors. It is similar to BY processing in SAS.

# by(data, factorlist, function)
# example obtain variable means separately for
# each level of byvar in data frame mydata 
by(mydata, mydata$byvar, function(x) mean(x))
