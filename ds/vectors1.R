#Vectors

8.5:4.5                #sequence of numbers from 8.5 down to 4.5
## [1] 8.5 7.5 6.5 5.5 4.5
c(1, 1:3, c(5, 8), 13) #values concatenated into single vector
## [1]  1  1  2  3  5  8 13

#The vector function creates a vector of a specified type and 
#length. Each of the values in the result is zero, FALSE, or 
#an empty string, or whatever the equivalent of “nothing” is:

vector("numeric", 5)
## [1] 0 0 0 0 0
vector("complex", 5)
## [1] 0+0i 0+0i 0+0i 0+0i 0+0i
vector("logical", 5)
## [1] FALSE FALSE FALSE FALSE FALSE
vector("character", 5)
## [1] "" "" "" "" ""
vector("list", 5)


numeric(5)
## [1] 0 0 0 0 0
complex(5)
## [1] 0+0i 0+0i 0+0i 0+0i 0+0i
logical(5)
## [1] FALSE FALSE FALSE FALSE FALSE
character(5)
## [1] "" "" "" "" ""

#seq.int lets us create a sequence from one number to another.
seq.int(3, 12)     #same as 3:12
##  [1]  3  4  5  6  7  8  9 10 11 12


seq.int(3, 12, 2)
## [1]  3  5  7  9 11
seq.int(0.1, 0.01, -0.01)
##  [1] 0.10 0.09 0.08 0.07 0.06 0.05 0.04 0.03 0.02 0.01


#seq_len creates a sequence from 1 up to its input, so seq_len(5)
#is just a clunkier way of writing 1:5. However, the function 
#is extremely useful for situations when its input could be zero:

n = 0
1:n        #not what you might expect!
## [1] 1 0
seq_len(n)
## integer(0)

pp <- c("Peter", "Piper", "picked", "a", "peck", "of", "pickled", "peppers")
for(i in seq_along(pp)) print(pp[i])
# takes length from vector


length(1:5)
## [1] 5
length(c(TRUE, FALSE, NA))
## [1] 3

# Confusion here ?
sn <- c("Sheena", "leads", "Sheila", "needs")
length(sn)
## [1] 4
nchar(sn)
## [1] 6 5 6 5


# New Length
poincare <- c(1, 0, 0, 0, 2, 0, 2, 0)  #See http://oeis.org/A051629
length(poincare) <- 3  # reduce length
poincare
## [1] 1 0 0
length(poincare) <- 8
poincare
## [1]  1  0  0 NA NA NA NA NA

# Names to Vector 
c(apple = 1, banana = 2, "kiwi fruit" = 3, 4)
##      apple     banana kiwi fruit
##          1          2          3          4

x <- 1:4
names(x) <- c("apple", "bananas", "kiwi fruit", "")
x
##      apple    bananas kiwi fruit
##          1          2          3          4

names(x)
## [1] "apple"      "bananas"    "kiwi fruit" ""
#If a vector has no element names, then the names function returns NULL:
  
names(1:4)
## NULL


# Indexing Vectors
x <- (1:5) ^ 2
x
## [1]  1  4  9 16 25
#These three indexing methods return the same values:
  
x[c(1, 3, 5)]
x[c(-2, -4)]  # less 2 & 4 th values
x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
## [1]  1  9 25


names(x) <- c("one", "four", "nine", "sixteen", "twenty five")
x[c("one", "nine", "twenty five")]
x

x[c(1, -1)]      #This doesn't make sense!
## Error: only 0's may be mixed with negative subscripts
x[c(1,-2)]  # Error

x[c(1, NA, 5)]
x
##         one        <NA> twenty five
##           1          NA          25
x[c(TRUE, FALSE, NA, FALSE, TRUE)]
##         one        <NA> twenty five
##           1          NA          25


#Missing values don’t make any sense for negative indices, and cause an error:

x[c(-2, NA)]     #This doesn't make sense either!
## Error: only 0's may be mixed with negative subscripts

# out of range indices -error
x[6]

x[1.9]   #1.9 rounded to 1
x[-1.9]  #-1.9 rounded to -1
x[] # whole vector

which(x > 10)
##     sixteen twenty five
##           4           5
#which.min and which.max are more efficient shortcuts for which(min(x)) and which(max(x)), respectively:

which.min(x)
which.max(x)


# Vector Recycling
1:5 + 1
1 + 1:5
1:5 + 1:15
#When adding two vectors together, R will recycle elements in the shorter vector to match the longer one:
#If the length of the longer vector isn’t a multiple of the length of the shorter one, a warning will be given:
length(1:5) ; length(1:7)  
1:5 + 1:7


rep(1:5, 3)
##  [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
rep(1:5, each = 3)
##  [1] 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5
rep(1:5, times = 1:5)
##  [1] 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
rep(1:5, length.out = 7)
## [1] 1 2 3 4 5 1 2

rep.int(1:5, 3)  #the same as rep(1:5, 3) faster
##  [1] 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5

rep_len(1:5, 13)
##  [1] 1 2 3 4 5 1 2 3 4 5 1 2 3
#https://www.safaribooksonline.com/library/view/learning-r/9781449357160/ch04.html
