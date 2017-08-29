#Vector Operations

crossprod(1:3, 4:6)  # 32
1*4 + 2*5 + 3*6 # 32
sum(c(1:3) * c(4:6))   # Same 32
crossprod(c(1,2,3),c(4,5,6))  # 32

crossprod(1:3, 4:7) # error

prod(1:3, 4:6) #720   
1*2*3*4*5*6

1:3 * 4:6  # 4 10 18
# explanation
1* 4 ; 2 * 5; 3 * 6

1*4 + 1*5 + 1*6 + 2*4 + 2*5 + 2*6 + 3*4 + 3*5 + 3*6  # 90 How

sum(rep(1:3,3) * c(4:6))# 96
#paste(rep(1:3,3),rep(4:6,3),sep='*')  # wrong

sum(seq(1,3,by=1) * c(4:6)) # 32

1:3 %*% 4:6 # 32


1*4 + 1*5 + 1*6  # 15  sum(1 * c(4:6))
2*4 + 2*5 + 2*6  # 30
3*4 + 3*5 + 3*6  # 45


cumsum(1:10) #[1]  1  3  6 10 15 21 28 36 45 55
cumprod(1:10)
#[1] 1 2 6 24 120 720 5040 40320 362880 3628800

cummin(c(3:1, 2:0, 4:2)) #[1] 3 2 1 1 1 0 0 0 0
cummax(c(3:1, 2:0, 4:2)) #[1] 3 3 3 3 3 3 4 4 4

# Maths Operations

(w = sqrt(2))
(x = exp(3))
(y = log(x))
(z = tan(pi/3))


(x = exp(-100))   # very small no
(y = x^10) # 0

#Boolean
3 + 2 < 5  # FALSE

(3 < 5) & (2 > 0)  # TRUE
(3 < 5) | (2 > 3) # TRUE
!(2 < 1) # negate F -> TRUE

(V = c(3,2,8,6,5,6,11,0))
(I = (V %% 2 == 1))


# Counting
(A = seq(100))
(B = (A %% 7 == 0))
(x = sum(B)) # T values
