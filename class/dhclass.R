# Data Handling on Student Data

# Read File ------
df1 = read.csv(file='./data/dsstudents.csv')
#df1a = read.csv(file=file.choose())
df1b = read.csv(file='./data/dsstudents.csv', stringsAsFactors = F)
str(df1b)
str(df1)
names(df1)
?read.csv
# start from here -------
colcls =c('numeric', NA, 'factor', 'factor', 'logical', 'character',
          'numeric', 'character' ,'character', 'character',
          rep('numeric',4)      )

df2 = read.csv(file='./data/dsstudents.csv', 
              colClasses = colcls, as.is=T)  # asis for name
str(df2)
# Now data structure seems to be alright



?col
# Date Column ----------
as.Date('1967-20-15')  # wrong
as.Date('1967-10-15')  # right default %y-%b-%d : Learn This
?as.Date
as.Date('05-Oct-1967',format="%d-%b-%Y")   # This is correct
as.Date('05-10-1967',format="%d-%b-%Y")   # This is correct

as.Date('05-Oct-67',format="%d-%b-%y")   # This is also correct: Next Century
as.Date('05-Oct-1967',format="%d-%b-%Y")   # This is also correct: Next Century

str(df2$dob)
# now convert the date column
head(df2$dob)  # 1-Sep-96 : d-b-y 
#%d	Decimal date %b	Abbreviated month %y	2-digit year
(df2$dob = as.Date(df2$dob,format="%d-%b-%y"))
str(df2$dob)
#add another column -----Calc age
Sys.Date() - df2$dob # days -> age  : Numeric Values - days: Diff in weeks- > years
difftime(Sys.Date(), df2$dob, unit='weeks')
(df2$age = ceiling(as.numeric(difftime(Sys.Date(),
                    df2$dob, unit='weeks')) / 52.25 )  )
head(df2$age)

summary(df2)


# Save data
write.csv(x=df2,file='./data/dhiraj.csv') # save to CSV
# you can save to other formats using other tools/ options
?write.csv
saveRDS(object=df2, file='./data/du.RDS')  # only 1 object at time
markstotal = runif(11,50,150)
save(markstotal,df2, file='./data/du2.RData') # save multiple objects in R
save.image(file='./data/du3.RData') # save all current objects/multiple objects in R
save.image()  # saves to default RData

#Load objects from saved locations
# From CSV
# From RDS
readRDS(file='./data/du.RDS') # loads and prints
mydata = readRDS(file='./data/du.RDS') # save it into object
#load()  # for data in .RData this happens automatically
load(file='./data/du2.RData')
load(file='./data/du3.RData')

rm(list=ls())
# Vector of colnames-------
cat(names(df2))
selcol = c("rollno","name","course", "gender", "hostel", "dob", 
           "fees", "email", "mobno", "city","rpgm", "excel", 
           "sql", "stats", "age")
?data.frame

#df2-------
# Filter -----
df2$age > 30 #  by age
df2[df2$age > 30, ][1:2]

# Filter -----------
df2[df2$gender == 'M' & df2$course=='PGDDS',c('rollno','name') ]
df2[df2$gender == 'M' & df2$course=='PGDDS',c(1,2) ]

#[1:2]  # by course & gender

# Find from Indices ----------
df2[df2$hostel == TRUE,][1:2]  #stay in hostel
which(df2$hostel == TRUE)   # using which command Tells  indices
df2[ which(df2$hostel == TRUE) ,][c(1,2,4,5)]  # in hostel
df2[ which(! df2$hostel == TRUE) ,][c(1,2,4,5)]  # not in hostel

#13 Sep 17
# Sort ---------
df2
df2$name[order(df2$age)]  # sort by age; display names
#df2$name[order(-df2$age)]  # sort by descending age; display names
sort(df2$age)
rev(sort(df2$age))
sort(-df2$age)   # avoid
df2$name[rev(order(df2$age))]

df2[order(df2$age),c('name','age')]
df2[order(df2$hostel, df2$age),c('name','age','hostel')]  #hoste, age
df2[order(df2$hostel, -df2$age),c('name','age','hostel')] # hostel, rev(age)

# hostel asc, age desc 

df2[order(df2$fees, decreasing=T),c('name','age','fees')]
df2[rev(order(df2$fees)),c('name','age','fees')]

df2[order(df2$course, -df2$rpgm),c('name','age','fees','course','rpgm')]
df2$name[1]

# Move to Margins

#Contigency Tables ------
df2
# table
cat(names(df2))
(df2table = table(df2$course,df2$gender))
table(df2$course,df2$gender, df2$hostel)

# 1 way table
with(df2, table(course))
with(df2, table(gender))
with(df2, table(city))

#xtabs  - uses formula
xtabs( ~ course + gender, data = df2)
xtabs( ~ course + gender + hostel, data = df2)

# Margin Tables
margin.table(df2table,1)
margin.table(df2table,2)
margin.table(df2table)
margin.table(df2table,c(1,2))

# Freq to Prop table
prop.table(df2table)  # overall proportion x/ sum(x) wise - course
round(prop.table(df2table),2) # round off

round(prop.table(df2table),2)*100  # Percentage look

df2table
# margin Table - col and row
# 
margin.table(df2table,1)  # for row - distribution
margin.table(df2table,2)  # for cols distribution

addmargins(df2table)  # add sums all sides rows & colns
?addmargins   # u can do other operations sum mean sd
addmargins(df2table, FUN=list(sd,var))
addmargins(df2table, 1)  # col sum shown as row
addmargins(df2table, 2) # rows sum shown as col

addmargins(prop.table(df2table), 1)  # col proportions shown as row
addmargins(prop.table(df2table), 2)  # col proportions shown as row
addmargins(prop.table(df2table))  # col proportions shown as row

addmargins(prop.table(df2table,2), 1)  # col proportions shown as row
addmargins(prop.table(df2table,1), 2)  # row proportions shown as col

# ftable
(df2table2 = xtabs(~ course + hostel + gender, data= df2))
df2table2
ftable(df2table2)
margin.table(df2table2,1)
margin.table(df2table2,2)
margin.table(df2table2,3)
margin.table(df2table2,c(1,2))
margin.table(df2table2,c(1,3))
margin.table(df2table2,c(2,3))


ftable(prop.table(df2table2, c(1,2)))
ftable(prop.table(df2table2, c(1,3)))
ftable(prop.table(df2table2, c(2,3)))

ftable(addmargins(prop.table(df2table2, c(1,2)),3))




#14 Sep 
# Function -----------
# using for 
df2$fees
feestatus = function(x) {
  if (x >= 150000)
    print(paste(i, df2$name[i], x,'- Fee Paid'))
  else
    print(paste(i, df2$name[i], x,'- Fee Not Paid -xxxx'))
}
dim(df2)[1] ; nrow(df2)
for (i in c(1:nrow(df2))) {
  feestatus(df2$fees[i])
}


# Subset --------
?subset
subset(df2, rpgm > 60)[c('rollno','name', 'rpgm')]
subset(df2, gender=='F' & age > 25, select=rollno:hostel)  # variables between
subset(df2, hostel==FALSE & age > 25, select=c('rollno','name','gender','age'))  # variables between



# filter ----------
dplyr::filter(df2, course=='MSCDS') [1:3]
dplyr::filter(df2, city=='Noida') [c('name','city')]
dplyr::filter(df2, city !='Noida') [c('name','city')]

dplyr::filter(df2, city %in% c('Noida','Delhi')) [c('name','city')]


# summary  ---------
summary(df2)
dplyr::glimpse(df2)   # ignore error if it occurs

# views ------
dplyr::tbl_df(df2)  # shows the data type of each column

# Sample selection ----------
sample(df2, 2)  # any 2 columns
sample(nrow(df2),3)  # sample from numbers - use it indices
df2[sample(nrow(df2),3), ][1:3]  # select any 3 rows from DF
dplyr::sample_n(df2,5)[1:3]   # another way
# use set.seed(1234) to get same sample 
kimisc::sample.rows(df2, 10, replace=TRUE)[1:2]  # show how many times repeated


# Arrange - order of coln values --------
dplyr::arrange(df2, course)[c('name','course','gender')]  # coursewise
dplyr::arrange(df2, course, gender)[c('name','course','gender')] # course, gender
dplyr::arrange(df2, -rpgm, sql)[c('name','course','gender','rpgm','sql')]
# one descending & other ascending
dplyr::arrange(df2, desc(course), gender)[c('name','course','gender')]

#Select 
dplyr::select(df2, course, gender)[1:4,]  # selected columns - 1-4 rows
dplyr::select(df2, course, -gender)[1:4,]  # confusion cannot mix
dplyr::select(df2, -course,-email, -gender)[1:4,]  # ignore some colns

#mutate - temporarily create column and join
dplyr::mutate(df2, total = rpgm + sql + excel)[c('name','total')]
dplyr::mutate(df2, total = rpgm + sql + excel,
      avg = round(total/3,1) )[c('name','total','avg')]

#Splitting data into smaller parts & then taking summary on them
by_course = dplyr::group_by(df2, course)
by_course  # view the part summary
dplyr::summarise(by_course, total = mean(rpgm)) # now do summary by group

#Pipe Operator
library(dplyr)  # reqd for pipe
df2 %>% dplyr::group_by(course) %>% 
  dplyr::summarise(meanxl = mean(excel))

# #Tidy the data   Not working
# library(tidyr)
# library(dplyr)
# df3 <- df2 %>% 
#   gather(subject,marks, rpgm:excel) %>% 
#   mutate(subject = gsub('rpgm','excel',subject)) %>% 
#   arrange(name,subject, marks)
# df3[c('name','subject','marks')]

# Changing format Long-Wide ----- 
#  Wide to Long
df4 = df2[,c('rollno','name','rpgm','excel','sql','stats')]
str(df4)
?gather
tidyr::gather(df4, key='rollno', value='marks', rpgm,stats)

(df4b= tidyr::gather(df4,key='subject',value='marks', rpgm,stats,excel,sql))
str(df4b)
#melt - another method 
cat(selcol)
selcol2 = selcol[selcol %in% c('rollno', 'name', 'rpgm', 'stats','excel')]
selcol2
cat(names(df2))
(df6a =reshape::melt(df2[,selcol2], id=c('rollno','name')))



#  Long in lenght to Wide more colns
(df4c= tidyr::spread(df4b, key='subject', value='marks'))
?spread
str(df6a)
(df6b = reshape::cast(df6a, rollno + name ~ variable, mean))  # mean or sum - same here
(reshape::cast(df6a, rollno ~ variable, mean))  # mean or sum - same here


# Aggregation - Summarisation ------
?aggregate  # matric, numeric
df2
aggregate(df2, by=list(course,gender), FUN=sum)  #incorrect
aggregate(df2$fees, by=list(df2$course, df2$gender), FUN=sum)  #correct
aggregate(df2$fees, by=list(df2$course, df2$gender), FUN=mean)  #correct

df5 = df2[,c('gender','hostel', 'course','fees','rpgm','stats', 'excel', 'sql')]
str(df5)
rownames(df5) = df2$rollno
df5
# now use matrix df[numeric cols] otherwise error arg of different length
aggregate(df5[4:8],list(df5$gender,df5$course,df5$hostel),sum)
aggregate(df5[4:8],list(gender=df5$gender,course=df5$course,hostel= df5$hostel),mean)

aggregate(. ~ df5$gender, mean, data=df5[4:8])
aggregate(. ~ df5$gender + df5$course, mean, data=df5[4:5])
with(df5, aggregate(df5[4:7], by=list(hostel=df5$hostel, course=df5$course),FUN=mean))

aggregate(df5$rpgm ~ . ,data=df5[4:5], FUN=mean)  # Formula correct
aggregate(rpgm + excel + stats + sql  ~ fees ,data=df5[4:8], FUN=mean)  # Formula correct

# Other Packages
Hmisc::summarize()
doBy::summaryBy()

# Loops -----------
# 
#while

#do while

#ifelse

#


#Print all Names
for (x in df2$name) {
  print(x)
}

# Scaling -------
df2$rpgm
sort(df2$rpgm)
scale(df2$rpgm)
scale(df2$rpgm, center=F)
as.vector(scale(df2$rpgm, center=F, scale=F))
# center - col have mean subtracted off
# scale - col have sd divided after subtracting
# 
as.vector(scale(df2$rpgm, center=T, scale=F))
df2$rpgm - mean(df2$rpgm)  # same as above
as.vector(round(scale(df2$rpgm),2))
as.vector(sort(round(scale(df2$rpgm),2)))  # this is z score
sort(round((df2$rpgm - mean(df2$rpgm))/ sd(df2$rpgm),2))  # same as above




# Apply Commands -------

#apply : array/matrix -> vector/array/list
load('./data/du3.Rdata')
(df7 = df2[,c('fees','rpgm','stats','excel','sql')])
(df8 = df2[,c('rpgm','stats','excel','sql')])
rownames(df7) = df2$rollno
rownames(df8) = df2$rollno
head(df7); head(df8)
(df7mat = as.matrix(df7))
(df8mat = as.matrix(df8))

str(df7mat)
df7mat
apply(df7mat,2,max)  # colwise max
apply(df7mat[,2:5],1,mean)  # row-wise mean
apply(df7mat[,2:5],2,mean)  # col-wise mean

apply(df7mat,c(1,2),mean)  # display all - 2 dim only matrix

apply(df7mat[,2:5],2,range)  # col-wise range
apply(df7mat[,2:5],2,fivenum)  # col-wise range

# function and apply it

apply(df7mat[,2:5],2,function(x) round(x/sum(x),2))  # col-wise function
apply(df7mat[,2:5],c(1,2), 
  function(x) ifelse(x>60,'Pass','Fail') )
apply(df7mat[,2:5],c(1,2), 
      function(x) ifelse(x>60,1,0) )
apply(df7mat[,2:5],2, 
      function(x) c(mu=mean(x), sd=sd(x)) )
apply(df7mat[,2:5],1, 
      function(x) c(mu=mean(x), sd=sd(x)) )

identical(df7mat[,2:5], 2)   #compare colns

apply(df8mat,1:2, mean)  # same as original matrix
apply(df8mat,1, mean)  # row
apply(df8mat,2, mean)  # col


# col Row Means Sums - correct the object name
colSums(df7amat)
rowSums(df7amat[,2:5])
round(colMeans(df7amat),2)
round(rowMeans(df7amat[,2:5]),2)

#split
(df9 = df2[,c('gender','hostel', 'course','fees','rpgm','stats','excel','sql')])
(df9 = df2[,c('course','fees','rpgm','stats','excel','sql')])
df9s = split(df9,df9$course)
sapply(df9$fees, function(x) (mean(x))) # array
lapply(df9$fees, function(x) (mean(x))) # list
lapply(df9s, function(x) (mean(x))) # Not working properly



# Using by  - grouping variable
by(df2[,c('rpgm','stats','excel','sql')], df2$gender, colMeans)

# tapply
# 
#sapply - like lapply
#vapply - similar to sapply - specific value
#mapply - multivariate version of sapply
#
# lapply - retuns a list
# rapply - recursive version of lapply


# rowwise - x /rowsum



# String Operations
# 

#sweep
sweep(df8mat,2, 1:2)

#apply(df8mat, 2, mean)

passfail = function(x) {
  if (x > 60) {
    cat('Pass ')
  }
  else {
    cat('Fail ')
  }
}
