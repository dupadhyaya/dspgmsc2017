# Data Handling on Student Data

# Read File ------
df1 = read.csv(file='./data/dsstudents.csv')
str(df1)
names(df1)

# start from here -------
colcls =c('numeric', NA, 'factor', 'factor', 'logical', 'character',
          'numeric', 'character' ,'character', 'character', rep('numeric',4)      )

df2 = read.csv(file='./data/dsstudents.csv', 
              colClasses = colcls, as.is=T)  # asis for name
str(df2)
# Now data structure seems to be alright


# Date Column ----------
as.Date('1967-20-15')  # wrong
as.Date('1967-10-15')  # right
?as.Date
#as.Date('05-Oct-1967',format="%d-%b-%Y")   # This is correct
as.Date('05-Oct-67',format="%d-%b-%y")   # This is correct

# now convert the date column
(df2$dob = as.Date(df2$dob,format="%d-%b-%y"))

#add another column -----
Sys.Date() - df2$dob # days -> age
(df2$age = ceiling(as.numeric(difftime(Sys.Date(), df2$dob, unit='weeks')) / 52.25 )  )

# Vector of colnames-------
cat(names(df2))
selcol = c("rollno","name","course", "gender", "hostel", "dob", 
           "fees", "email", "mobno", "city","rpgm", "excel", 
           "sql", "stats", "age")

#df2-------
# Filter -----
df2$age > 30 #  by age
df2[df2$age > 30, ][1:2]

# Filter -----------
df2[df2$gender == 'M' & df2$course=='PGDDS', ][1:2]  # by course & gender

# Find Indices ----------
df2[df2$hostel == TRUE,][1:2]  #stay in hostel
which(df2$hostel == TRUE)   # using which command
df2[ which(df2$hostel == TRUE) ,][c(1,2,4,5)]
df2[ which(! df2$hostel == TRUE) ,][c(1,2,4,5)]


# Sort ---------
df2$name[order(df2$age)]
df2[order(df2$age),c('name','age')]
df2[order(df2$fees, decreasing=T),c('name','age','fees')]
df2[order(df2$course, -df2$rpgm),c('name','age','fees','course','rpgm')]

# Function -----------
# using for 
feestatus = function(x) {
  if (x >= 150000)
    print(paste(x,'- Fee Paid'))
  else
    print(paste(x,'- Fee Not Paid -xxxx'))
}
feestatus(df2$fees[2])
for (i in c(1:11)) {
  feestatus(df2$fees[i])
}


# Subset --------
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
dplyr::sample_n(df2,5)[1:3]
# use set.seed(1234) to get same sample 
kimisc::sample.rows(df2, 10, replace=TRUE)[1:2]  # show how many times repeated


# Arrange - order of coln values --------
dplyr::arrange(df2, course)[c('name','course','gender')]
dplyr::arrange(df2, course, gender)[c('name','course','gender')]
dplyr::arrange(df2, -rpgm, sql)[c('name','course','gender','rpgm','sql')]
# one descending & other ascending
dplyr::arrange(df2, desc(course), gender)[c('name','course','gender')]

#Select 
dplyr::select(df2, course, gender)[1:4,]  # selected columns - 1-4 rows
dplyr::select(df2, course, -gender)[1:4,]  # confusion cannot mix
dplyr::select(df2, -course,-email, -gender)[1:4,]

#mutate - temporarily create column and join
dplyr::mutate(df2, total = rpgm + sql + excel)[c('name','total')]
dplyr::mutate(df2, total = rpgm + sql + excel,
      avg = round(total/3,1) )[c('name','total','avg')]

#Splitting data into smaller parts & then taking summary on them
by_course = dplyr::group_by(df2, course)
by_course
dplyr::summarise(by_course, total = mean(rpgm))

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
tidyr::gather(df4, key=c('rollno','name'), value=c('rpgm','stats'))
df4b= gather(df4,key='subject',value='marks', rpgm,stats,excel,sql)
df4b
str(df4b)
#melt
cat(selcol)
selcol2 = selcol[selcol %in% c('rollno', 'name', 'rpgm', 'stats','excel')]
selcol2
cat(names(df2))
(df6a =reshape::melt(df2[,selcol2], id=c('rollno','name')))



#  Long to Wide
(df4c= spread(df4b, key='subject', value='marks'))
?spread
str(df6a)
(df6b = reshape::cast(df6a, rollno + name ~ variable, mean))  # mean or sum - same here
(reshape::cast(df6a, rollno ~ variable, mean))  # mean or sum - same here


# Aggregation - Summarisation ------
?aggregate  # matric, numeric
aggregate(df2, by=list(course,gender), FUN=sum)  #incorrect
aggregate(df2$fees, by=list(course,gender), FUN=sum)  #correct
df5 = df2[,c('gender','hostel', 'course','fees','rpgm','stats', 'excel', 'sql')]
str(df5)
rownames(df5) = df2$rollno
df5
# now use matrix df[numeric cols] otherwise error arg of different length
aggregate(df5[4:8],list(df5$gender,df5$course,df5$hostel),sum)
aggregate(df5[4:8],list(gender=df5$gender,course=df5$course,hostel= df5$hostel),mean)

aggregate(. ~ gender, mean, data=df5[4:8])
aggregate(. ~ gender + course, mean, data=df5[4:5])
with(df5, aggregate(df5[4:7], by=list(hostel=hostel, course=course),FUN=mean))

aggregate(rpgm ~ . ,data=df5[4:5], FUN=mean)  # Formula correct
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

df7 = df2[,c('fees','rpgm','stats','excel','sql')]
df8 = df2[,c('rpgm','stats','excel','sql')]
rownames(df7) = df2$rollno
rownames(df8) = df2$rollno

df7mat = as.matrix(df7)
(df8mat = as.matrix(df8))

str(df7mat)
df7mat
apply(df7mat,2,max)  # colwise max
apply(df7mat[,2:5],1,mean)  # row-wise mean
apply(df7mat,c(1,2),mean)  # ???
apply(df7mat[,2:5],2,range)  # col-wise range
apply(df7mat[,2:5],2,fivenum)  # col-wise range

# function and apply it

apply(df7mat[,2:5],2,function(x) round(x/sum(x),2))  # col-wise function
apply(df7mat[,2:5],c(1,2), 
  function(x) ifelse(x>60,'P','F') )
apply(df7mat[,2:5],c(1,2), 
      function(x) ifelse(x>60,1,0) )
apply(df7mat[,2:5],2, 
      function(x) c(mu=mean(x), sd=sd(x)) )
apply(df7mat[,2:5],1, 
      function(x) c(mu=mean(x), sd=sd(x)) )

identical(df7mat[,2:5], 2)   #compare colns

apply(df8mat,1:2, mean)  # same as original matrix
apply(df8mat,1, mean)
apply(df8mat,2, mean)


# col Row Means Sums
colSums(df7amat)
rowSums(df7amat[,2:5])
round(colMeans(df7amat),2)
round(rowMeans(df7amat[,2:5]),2)

# Using by 
by(df2[,c('rpgm','stats','excel','sql')], df2$gender, colMeans)

# tapply
# 
#sapply - like lapply
#vapply - similar to sapply - specific value
#mapply - multivariate version of sapply
#
# lapply - retuns a list
# rapply - recursive version of lapply

#Contigency Tables ------
df2
# table
cat(names(df2))
df2table = table(df2$course,df2$gender)
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
addmargins(df2table, FUN=mean)
addmargins(df2table, 1)  # col sum shown as row
addmargins(df2table, 2) # rows sum shown as col

addmargins(prop.table(df2table), 1)  # col proportions shown as row
addmargins(prop.table(df2table), 2)  # col proportions shown as row
addmargins(prop.table(df2table))  # col proportions shown as row

addmargins(prop.table(df2table,2), 1)  # col proportions shown as row
addmargins(prop.table(df2table,1), 2)  # row proportions shown as col

# ftable
df2table2 = xtabs(~ course + hostel + gender, data= df2)
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