# Practise


df3 = read.csv(file='./data/dsstudents2.csv')
str(df3)

# Correct the structure - start from here
colcls =c('numeric', NA, 'factor', 'factor', 'logical', 'character',
          'numeric', 'character' ,'character', 'character',
          rep('numeric',4)      )

df3 = read.csv(file='./data/dsstudents2.csv', 
               colClasses = colcls, as.is=T)  # asis for name
str(df3)
summary(df3)
sapply(df3,class)
#class(df3$excel)

# Date
(df3$dob = as.Date(df3$dob,format="%d-%b-%y"))
df3$dob
(df3$age = ceiling(as.numeric(difftime(Sys.Date(),
            df3$dob, unit='weeks')) / 52.25 )  )
df3$age

summary(df3)  # check summary
sapply(df3,class)

# Missing Values
colSums(is.na(df3))

df3$hostel[is.na(df3$hostel)] = TRUE
df3$fees[is.na(df3$fees)] = mean(df3$fees,na.rm=T)

df3$excel[is.na(df3$excel)] = mean(df3$excel,na.rm=T)
df3$sql[is.na(df3$sql)] = mean(df3$sql,na.rm=T)
summary(df3)

head(df3)
sapply(df3,class)

# Add Row: Blanks to be put as NA
(s1age = ceiling(as.numeric(difftime(Sys.Date(),
        as.Date('1994-10-17'), unit='weeks')) / 52.25 ) )
cat(names(df3))  # check the structure and sequence
# this will not work as it will convert them into factor
#
s1= data.frame(17000,'Ramesh Singh', 'MSCDS','M',TRUE, '1994-10-17', 50000, 'ramesh@gmail.com',NA, 'Delhi',50,51,52,53, s1age)
str(s1)
lapply(df3,names)
lapply(s1,names)
names(s1) = names(df3)  # make names equal
identical(names(df3), names(s1))  # same
sapply(s1,class)

df3= rbind(df3,s1) # join s1 to df

dim(df3); dim(s1)
summary(df3)
sapply(df3, class)


# save it as an objects in mydata.Rdata
save(df3, file='./data/mydata.Rdata')

# clear all memory/ env
rm(list=ls())
ls()
load(file='./data/mydata.Rdata')
summary(df3)
nrow(df3)

# Again Check for missing values
colSums(is.na(df3))

# if all ok- proceed ahead


# split data wrt to course
split(df3[c('rollno','name','course','gender')], df3$course)
# split data wrt to gender, hostel
split(df3[c('rollno','name','course','gender')], 
      list(df3$gender, df3$hostel))

df3
# aggregate fees wrt to course
aggregate(df3$fees, list(course= df3$course), sum)
aggregate(df3$fees, list(df3$course), sum)
aggregate(df3$fees, list(df3$gender), mean)

aggregate(df3[11:15], list(course= df3$course), mean)

aggregate(df3$fees, list(DSCourse=df3$course, 
                        Gender=df3$gender), sum)

aggregate(cbind(df3$fees, df3$excel), list(DSCourse=df3$course, 
                         Gender=df3$gender), sum)
aggregate(df3[c('fees','excel')], list(DSCourse=df3$course, 
                                           Gender=df3$gender), sum)

cat(names(df3))
class(split(df3[1:3], df3$gender))
l1= split(df3[1:3], df3$gender)
dim(l1)
# Margins
(m = matrix(1:10, nrow=5))
dim(m)
dim(df3)
paste0('a','b','c')
paste('a','b',sep='2')
search()
?search
(v1 = 1:20)
diff(v1,2)
?diff
trunc(4.32)
round(4.67,1)
ceiling(4.67)
floor(4.67)
cummax(v1)
v2 = ceiling(runif(50,10,60))
v2
cummax(v2)
cummin(v2)
cumsum(v2)
cumprod(v1)
v4=1:5
cumprod(v4)
factorial(5)
round(scale(v4, center = F),2)
?scale
scale(v2, scale=F)
x =1/0
is.na(x)
is.infinite(x)
y=NA
is.nan(y)
is.nan
