# Data Handling on Student Data

df1 = read.csv(file='./data/dsstudents.csv')
str(df1)
names(df1)
colcls =c('numeric', NA, 'factor', 'factor', 'logical', 'character',
    'character' ,'character', 'character', rep('numeric',4)      )

# start from here
df2 = read.csv(file='./data/dsstudents.csv', 
              colClasses = colcls, as.is=T)  # asis for name
str(df2)
# Now data structure seems to be alright


# Date Column
as.Date('1967-20-15')  # wrong
as.Date('1967-10-15')  # right
?as.Date
#as.Date('05-Oct-1967',format="%d-%b-%Y")   # This is correct
as.Date('05-Oct-67',format="%d-%b-%y")   # This is correct

# now convert the date column
(df2$dob = as.Date(df2$dob,format="%d-%b-%y"))

#add another column age
Sys.Date() - df2$dob # days
(df2$age = ceiling(as.numeric(difftime(Sys.Date(), df2$dob, unit='weeks')) / 52.25 )  )

# Filter by age
df2$age > 30
df2[df2$age > 30, ][1:2]

# Filter by course & gender
df2[df2$gender == 'M' & df2$course=='PGDDS', ][1:2]

# Find Indices - stay in hostel
df2[df2$hostel == TRUE,][1:2]
which(df2$hostel == TRUE)   # using which command
df2[ which(df2$hostel == TRUE) ,][c(1,2,4,5)]
df2[ which(! df2$hostel == TRUE) ,][c(1,2,4,5)]

# Subset 
subset(df2, rpgm > 60)[c('rollno','name', 'rpgm')]

# filter
dplyr::filter(df2, course=='MSCDS') [1:3]
dplyr::filter(df2, city=='Noida') [c('name','city')]
dplyr::filter(df2, city !='Noida') [c('name','city')]

dplyr::filter(df2, city %in% c('Noida','Delhi')) [c('name','city')]


# summary
summary(df2)
dplyr::glimpse(df2)   # ignore error if it occurs

# views
dplyr::tbl_df(df2)  # shows the data type of each column

# Sample selection
sample(df2, 2)  # any 2 columns
sample(nrow(df2),3)  # sample from numbers - use it indices
df2[sample(nrow(df2),3), ][1:3]  # select any 3 rows from DF

# Arrange - order of coln values
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

# Changing format
#  Wide to Long
df4 = df2[,c('rollno','name','rpgm','excel','sql','stats')]
str(df4)
tidyr::gather(df4, key=c('rollno','name'), value=c('rpgm','stats'))
df4b= gather(df4,key='subject',value='marks', rpgm,stats,excel,sql)
df4b
str(df4b)


#  Long to Wide
(df4c= spread(df4b, key='subject', value='marks'))
?spread


#Print all Names
for (x in df2$name) {
  print(x)
}


