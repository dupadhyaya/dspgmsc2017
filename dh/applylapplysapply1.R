#apply LAPPLY SAPPLY


#lapply - When you want to apply a function to each element of a list in turn and get a list back.

#This is the workhorse of many of the other *apply functions. 
(x <- list(a = 1, b = 1:3, c = 10:100) )
lapply(x, FUN = length) 
# $a 
# [1] 1
# $b 
# [1] 3
# $c 
# [1] 91

lapply(x, FUN = sum) 
# $a 
# [1] 1
# $b 
# [1] 6
# $c 
# [1] 5005



#sapply ------
#sapply - When you want to apply a function to each element of a list in turn,
#but you want a vector back, rather than a list.

#If you find yourself typing unlist(lapply(...)), stop and consider sapply.

x <- list(a = 1, b = 1:3, c = 10:100)
#Compare with above; a named vector, not a list 
sapply(x, FUN = length)  
#a  b  c   
#1  3 91

sapply(x, FUN = sum)   
#a    b    c    
#1    6 5005 

#In more advanced uses of sapply it will attempt to coerce the result to a multi-dimensional array, if appropriate. For example, if our function returns vectors of the same length, 
#sapply will use them as columns of a matrix:
  
sapply(1:5,function(x) rnorm(3,x))
#If our function returns a 2 dimensional matrix, 
#sapply will do essentially the same thing,
#treating each returned matrix as a single long vector:
  
sapply(1:5,function(x) matrix(x,2,2))
#Unless we specify simplify = "array", in which case it will use
#the individual matrices to build a multi-dimensional array:
  
sapply(1:5,function(x) matrix(x,2,2), simplify = "array")
#Each of these behaviors is of course contingent on our function returning 
#vectors or matrices of the same length or dimension.
