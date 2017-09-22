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


# aggregate fees wrt to course
aggregate(df3$fees, list=(df3$course), sum)
