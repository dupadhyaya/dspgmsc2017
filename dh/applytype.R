# Apply Functions

#Data Structure
#Array ----
(a1 = array(1:24, dim=c(4,3,2), dimnames = list( c(paste('c',1:4,sep='')), c('d1','d2','d3'),c('s1','s2')) ))

#Matrix ----
m1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5),seq_len(length.out=10)), byrow=F, ncol =4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep='')
m1

#DataFrame ----
(df1 = data.frame(sub1=10:1, sub2=5, sub3=rep(c(5,6),5), sub4=seq_len(length.out=10)))

#List ----
(list1 = list(sub1=10:1, sub2=rep(5,3), sub3=rep(c(5,6),4),sub4=seq_len(length.out=10)))

#print objects
a1
m1
df1
list1


#apply --------
#apply(X, MARGIN, FUN, ...)
#X - array or matrix MARGIN=1 (Rows) ; 2 (Columns)
#FUN = mean, median, UDF, .... ... Others eg. na.rm=T
#Applies a function over the margins

#array
X=a1
apply(X, 1, sum)
class(apply(X, 1, sum))

apply(X, 2, sum)
#d1  d2  d3   68 100 132

apply(X, 3, sum)
#s1  s2   78 222

apply(X,c(3,2), sum)
#   d1 d2 d3 
#s1 10 26 42 
#s2 58 74 90

apply(X,c(2,3), sum)
#   s1 s2 
#d1 10 58 
#d2 26 74 
#d3 42 90

apply(X,c(1,2), sum)
#   d1 d2 d3 
#c1 14 22 30 
#c2 16 24 32 
#c3 18 26 34 
#c4 20 28 36

apply(X,c(1,3), sum)
#    s1 s2 
#c1 15 51 
#c2 18 54 
#c3 21 57 
#c4 24 60

##matrix------- 2 dim
X=m1
apply(X, 1, sum)
#R1  R2  R3  R4  R5  R6  R7  R8  R9 R10
#21  22  21  22  21  22  21  22  21  22

apply(X,2,sum)
#sub1 sub2 sub3 sub4
#55   50   55   55

apply(X,3,sum)
#Error in if (d2 == 0L) { : missing value where TRUE/FALSE needed

apply(X,c(3,2), sum)  #Error
apply(X,c(2,3), sum)  #Error

apply(X,c(1,2), sum) # original matrix
#sub1 sub2 sub3 sub4
#[1,]   10    5    5    1

apply(X,c(1,3), sum)  #error no 3rd dim

apply(X,sum)  # error - margins not specified

#dataframe -------------
# this acts like a matrix as all values are numeric
(X=df1)
apply(X, 1, sum)
#[1] 21 22 21 22 21 22 21 22 21 22

apply(X,2,sum)
#sub1 sub2 sub3 sub4    55   50   55   55

apply(X,3,sum)#  Error in if (d2 == 0L) { : missing value where TRUE/FALSE needed
apply(X,c(3,2), sum) #    Error
apply(X,c(2,3), sum) #    Error

apply(X,c(1,2), sum)  # original DF
#sub1 sub2 sub3 sub4
#[1,]   10    5    5    1

apply(X,c(1,3), sum)   #error

apply(X,sum)   #error no dime

#NA Values

m1[5] = NA
X=m1
apply(X,1,mean)
#R1   R2   R3   R4   R5   R6   R7   R8   R9  R10
#5.25 5.50 5.25 5.50   NA 5.50 5.25 5.50 5.25 5.50

apply(X,1,mean,na.rm=T)  # better
#R1   R2   R3   R4   R5   R6   R7   R8   R9  R10
#5.25 5.50 5.25 5.50 5.00 5.50 5.25 5.50 5.25 5.50

apply(X,2,mean)
#sub1 sub2 sub3 sub4
#NA  5.0  5.5  5.5

apply(X,2,mean,na.rm=T)  # better
#sub1 sub2 sub3 sub4
#5.44 5.00 5.50 5.50
    



#lapply ---------
#lapply(X, FUN, na.rm=T, ...)
X=list1
lapply(X,FUN=mean, na.rm=T)

#Egs: NA Values
X[[1]][5] = NA
lapply(X,FUN=mean, na.rm=F)


lapply(X,FUN=mean, na.rm=T)

#Unlist
unlist(lapply(X,FUN=mean, na.rm=T))

# sapply ----- like lapply - simplify outpu
sapply(df1,mean)

#tapply
(df1a = df1)
df1a$course = sample(c('MSC','PG'),10, prob=c(.7,.3), replace=T)
df1a
tapply(X=df1a$sub1, INDEX=df1a$course, mean)
df1a$gender = sample(c('M','F'),10, prob=c(.6,.4), replace=T)
tapply(X=df1a$sub1, INDEX=df1a$gender, mean)
# 2 indices
tapply(X=df1a$sub1, INDEX=list(df1a$gender,df1a$course), mean)
# 3 indices
df1a$hostel = sample(c('Y','N'),10, prob=c(.5,.5), replace=T)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel), mean)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel,df1a$gender), mean)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel,df1a$course), mean)

tapply(X=df1a$sub1, INDEX=list(df1a$hostel, df1a$gender,df1a$course), sum)
tapply(X=df1a$sub1, INDEX=list(df1a$hostel, df1a$gender,df1a$course), length)

df1a


#Aggregate --------
cat(names(mtcars))
aggregate(mtcars[c('disp', 'hp', 'wt')], by=list(mtcars$cyl,mtcars$gear), FUN=mean, na.rm=TRUE)
head(df1a)
# some colns are non-numeric, exclude them
aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], by=list(df1a$course), FUN=mean)
(dftemp = aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], 
          by=list(df1a$course, df1a$hostel, df1a$gender), FUN=mean))
dftemp[order(dftemp$Group.1, dftemp$Group.2, dftemp$Group.3),]

(dftemp = aggregate(x=df1a[c('sub1', 'sub2', 'sub3')], 
      by=list(gpcourse = df1a$course, gphostel=df1a$hostel,gpgender= df1a$gender), FUN=mean))
dftemp[order(dftemp$gpcourse, dftemp$gpgender, dftemp$gphostel),]
