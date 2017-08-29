# Recycling of Vectors
x = c(1,2,4)
y = c(1,2,3,4)
x+y

y+x

x*y

#The "error" that you reported is in fact a "warning" 
#which means that R is notifying you that it is recycling but recycles anyway.
#options(warn=2) turned on, which converts warnings into error messages

#Recycling occurs when vector arithmetic is performed on multiple 
#vectors of different sizes. R takes the shorter vector and repeats them until it becomes long enough to match the longer one.

#https://binf.snipcademy.com/tutorials/r/vectors/recycling-arithmetic

c(1,2,3,4,5,6) + c(1,3)

c(1,2,3,4,5,6,7) + c(1,3)

c(1,2,3,4,5,6) + c(1,3,5)

c(1,2,3) * c(0,3,6)
#[1] 0 6 18

c(1,3,5) * c(2,4)

c(1,3,5,7) * c(2,4)



(x = seq(3, 12, 2))  # [1]  3  5  7  9 11
(y = seq(10, 6))   # [1] 10  9  8  7  6
(z = x + y) # [1] 13 14 15 16 17
#x + y = z
#[3, 5, 7, 9, 11] + [10, 9, 8, 7, 6] = [13, 14, 15, 16, 17]


#empty vector
M = NULL
M[3] = 1
M
