#Assignment - 6 

# create a vector of 40 values at equal interval between 10 and 200; use integer values
(x1 = ceiling (seq(10, 200,length.out = 40)))

# use this vector to Create the matrix 5 x 8 : columnwise
m1<-matrix(x1,nrow=5)
m1

# Return the product of each of the rows
apply(m1,1,prod)

# Return the sum of each of the columns
apply(m1,2,sum)

# Return a new matrix whose entries are those of 'matrix' modulo 10
apply(m1,c(1,2),function(x) x%%10) 

# How many odd nos each column has
apply(m1, 2, function(x) length(x[x%%2 != 0]))
