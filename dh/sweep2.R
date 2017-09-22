#sweep

#The basic idea is to sweep through an 
#array row- or column-wise and return a modified array.

#you have a matrix and want to standardize it column-wise:

(dataPoints <- matrix(4:15, nrow = 4))

# Find means per column with `apply()`
(dataPoints_means <- apply(dataPoints, 2, mean))

# Find standard deviation with `apply()`
(dataPoints_sdev <- apply(dataPoints, 2, sd))

# Center the points 
(dataPoints_Trans1 <- sweep(dataPoints, 2, dataPoints_means,"-"))
print(dataPoints_Trans1)
##      [,1] [,2] [,3]
## [1,] -1.5 -1.5 -1.5
## [2,] -0.5 -0.5 -0.5
## [3,]  0.5  0.5  0.5
## [4,]  1.5  1.5  1.5
# Return the result
dataPoints_Trans1
##      [,1] [,2] [,3]
## [1,] -1.5 -1.5 -1.5
## [2,] -0.5 -0.5 -0.5
## [3,]  0.5  0.5  0.5
## [4,]  1.5  1.5  1.5
# Normalize
(dataPoints_Trans2 <- sweep(dataPoints_Trans1, 2, dataPoints_sdev, "/"))

# Return the result
dataPoints_Trans2
##            [,1]       [,2]       [,3]
## [1,] -1.1618950 -1.1618950 -1.1618950
## [2,] -0.3872983 -0.3872983 -0.3872983
## [3,]  0.3872983  0.3872983  0.3872983
## [4,]  1.1618950  1.1618950  1.1618950

#NB: for this simple example the same result can of course be achieved more easily by
apply(dataPoints, 2, scale)
