#Functions

# Commands 
args()
function()
formals()
lsf.str()
body()

# Create function
x=2 ; y = 3
(sumofnos = x + y)

x1 = c(1:10)
(sumofnos = sum(x1))

sumofnos = sum(x1)

fsum1 <- function(x1) {
  sumofnos = sum(x1)
}
# Code - Extract Function
# run above function lines
fsum1(x1)  # no output
(sumout = fsum1(x1))  # output seen : value assigned to a variable

# print output from function call
fsum2 <- function(x1) {
  sumofnos = sum(x1)
  return(sumofnos)
}
fsum2(x1)  # output seen

# another way.. printing values inside a function
fsum3 <- function(x1) {
  sumofnos = sum(x1)
  print(sumofnos)
  print(paste('Sum of object is ',sumofnos, sep=''))
  cat(paste('Sum of my object is ',sumofnos, sep=''))
  
  }
fsum3(x1)

# Check structure of function
body(fsum3)
body(fsum1)
args(fsum3)

args('bxp')  # args of built in function
body('bxp')  # 
# create a new function

# Area of Circle
areacircle = pi * r^2

areacircle <- function(constant=3.14, r) {
  areacircle = constant * r^2
  return(areacircle)
  }
# pi is constant neednot be givien
areacircle(r=4)

areacircle(r=4, constant=4)
body(areacircle)
args(areacircle)

library(plyr)
# Structure of functions
lsf.str()
search()
ls()
lsf.str(pos=-1)  # relate to functions
lsf.str(pos=1)  # relate to functions
lsf.str(pos=2)  # relate to 2nd package in order found in search()
lsf.str(pos=4)

save(areacircle, file='./data/dudata1.Rdata')
# Clear Invironment
rm(list=ls())
load('./data/dudata1.RData')  # Rdata RData are same in windows
ls()
lsf.str()
search()
lsf.str(pos=1)


# R Commands and objects name into character strings
(ch1 = deparse(args(areacircle)))
str(ch1)

# make result of function but donot print
areacircle(r=6)

areacircle2 <- function(constant=3.14, r) {
  areacircle = constant * r^2
  invisible(areacircle)
}
areacircle2(r=5)  # no output shown
(ch = areacircle2(r=5))  # assign and print

# Print command and options
pi
print(pi)
print(pi, digits = 2)

