#cut

set.seet(1234)
marks = ceiling(rnorm(100,50,10))
marks
range(marks)
(bks = seq(20,80,1))
(bks = seq(20,80,5))  # 12 interval
# Slabs : 20-25, 25-30 ....

(bks = seq(20,80,10))  # 6 intervals
# Slabs : 20-30, 30-40 ....

sort(marks)
classint = cut(marks, breaks=bks)
head(classint)
head(marks)
# 60 is enclosed in (50-60]
table(classint)  # Freq Table
cbind(table(classint)) # column format view 

?cut  # divides the range of x into intervals & codes the values in x 
# according to which interval they fall
cut(x, breaks, labels = NULL,
    include.lowest = FALSE, right = TRUE, dig.lab = 3,
    ordered_result = FALSE, ...)
# without giving manual breaks
cut(marks, breaks=6)
#(23.9-32.5] - not a clean break
#right=TRUE : interval close on right & open on left : Default
#right (0-10] : value of 10 included in this instead of (10-20]

# include.lowest =FALSE (default)
# x[i] = lowest when right=FALSE
# x[i] = highest when right=TRUE
# 0 2 5 5.1 10  : x[i] = 1 when right=F [0,5)
# 
# 0 2 5 5.1 10  : x[i] = 10 when right=T (5-10]
x1 = c(0,2,5.1,3,10,14.5, 15,16,20)
cut(x1,breaks=4, include.lowest=T )  # not good
#Levels: [-0.02,5] (5,10] (10,15] (15,20]
(bks2 = seq(0,20,5))
cut(x1,breaks=bks2, include.lowest=T )  # not correct
#Levels: sq[0,5] (5,10] (10,15] (15,20]
x1 
# 0.0  2.0  5.1  3.0 10.0 14.5 15.0 16.0 20.0
cut(x1,breaks=bks2, include.lowest=T, right=F )  #  correct
#Levels: s[0,5) [5,10) [10,15) s[15,20]s
#s[0,5)[0,5)[5,10) [0,5)[10,15)[10,15)[15,20][15,20] s[15,20]s

cut(x1,breaks=bks2, include.lowest=T, right=T )  #  correct
#[0,5] (5,10] (10,15] (15,20]

cut(x1,breaks=bks2, include.lowest=F, right=T )  #  correct
#Levels: (0,5]s (5,10] (10,15] (15,20]s sq
#<NA>(0,5](5,10](0,5](5,10](10,15](10,15](15,20](15,20]s


## generate data for clinical trial example
clinical.trial <-
    data.frame(patient = 1:100,              
               age = rnorm(100, mean = 60, sd = 8),
               year.enroll = sample(paste("19", 85:99, sep = ""),
                                    100, replace = TRUE))
summary(clinical.trial)
## basic usage of cut with a numeric variable
c1 <- cut(clinical.trial$age, breaks = 4)
table(c1)

c1

## year.enroll is a factor, so must convert to numeric first!
c2 <- cut(as.numeric(as.character(clinical.trial$year.enroll)),
              breaks = 3)
table(c2)
c2
