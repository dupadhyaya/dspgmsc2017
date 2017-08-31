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

cut(x1,breaks=4, include.lowest=T)  # not good
#Levels: [-0.02,5] (5,10] (10,15] (15,20]


(bks2 = seq(0,20,5))

cut(x1,breaks=bks2, include.lowest=T )  # not correct
#Levels: sq[0,5] (5,10] (10,15] (15,20]
x1 
# 0.0  2.0  5.1  3.0 10.0 14.5 15.0 16.0 20.0

cut(x1,breaks=bks2, include.lowest=T, right=F )  #  correct
#Levels: s[0,5) [5,10) [10,15) s[15,20]s
#s[0,5)[0,5)[5,10) [0,5)[10,15)[10,15)[15,20][15,20] s[15,20]s

#understand these steps

#when u do right=TRUE, intervals closed on right. 
#max value included in last interval, but min value may be lost
#therefore include.lowest=T required to have it in first interval

x1
(xc1= cut(x1,breaks=bks2, include.lowest=T, right=T ) ) #  correct
#s[0,5] (5,10] (10,15] (15,20]s
#[0,5] [0,5](5,10][0,5] (5,10](10,15](10,15](15,20] (15,20]

# vice-versa works as include.highest now
(xc2= cut(x1,breaks=bks2, include.lowest=F, right=F ))  # not  correct
# NA value for max -> correct it
(xc3= cut(x1,breaks=bks2, include.lowest=T, right=F ))  #  correct
#Levels: (0,5]s (5,10] (10,15] s[15,20]s 
#[0,5)[0,5)[5,10)[0,5)[10,15)[10,15)[15,20][15,20][15,20]

table(xc1,useNA='ifany')
table(xc2, useNA='ifany')
table(xc3, useNA='ifany')
?table


# labels to classes
marks
(bks = seq(20,80,10))  # 6 intervals
classint = cut(marks, breaks=bks)
bks
length(bks)
(classint = cut(marks, breaks=bks))  # intervals
table(classint)
(classint = cut(marks, breaks=bks, labels=F))  # integers
table(classint)
(classint = cut(marks, breaks=bks, labels=LETTERS[1:length(bks)-1]))  # integers
table(classint)
?cut
(classint = cut(marks, breaks=bks, ordered_result = T,
        labels=LETTERS[1:length(bks)-1]))  # integers
table(classint)
plot(classint)

#dig.lab
## sometimes the default dig.lab is not enough to be avoid confusion:
aaa <- c(1,2,3,4,5,2,3,4,5,6,7)
cut(aaa, 3)
cut(aaa, 3, dig.lab = 4, ordered = TRUE)

## Label construction:
y <- stats::rnorm(100)
table(cut(y, breaks = pi/3*(-3:3)))
table(cut(y, breaks = pi/3*(-3:3), dig.lab = 1))
table(cut(y, breaks = pi/3*(-3:3), dig.lab = 2))
table(cut(y, breaks = pi/3*(-3:3), dig.lab = 3))
table(cut(y, breaks = pi/3*(-3:3), dig.lab = 4))


## sometimes the default dig.lab is not enough to be avoid confusion:
aaa <- c(1,2,3,4,5,2,3,4,5,6,7)
cut(aaa, 3)
cut(aaa, 3, dig.lab = 4, ordered = TRUE)



## generate data for clinical trial example----------
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
