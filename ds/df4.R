# Data Frame4

# Merge

rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
name  = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
#course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
#gender= c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8)
#hostel =c(FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)

#students = data.frame(rollno, name, course, gender, exp, hostel, stringsAsFactors = F)
students = data.frame(rollno, name, exp, stringsAsFactors = F)

students
students$course = factor(students$course)
students$gender = factor(students$gender)
str(students)
summary(students)

# Column
students2 = students[,c('rollno', 'exp')]
students2
students2$explevel[students2$exp < 5 ] <- "Junior"
students2
students2$explevel[students2$exp >= 5 & students2$exp < 10  ] <- "Middle"
students2
students2$explevel[students2$exp > 10  ] <- "Senior"
students2

students3 = merge(students, students2, all=TRUE)
students3  # exp coln not added
str(students3)
students4 = merge(students, students2, by='rollno')
students4 # exp added

str(students2)
colnames(students2)[1] = c('formno') # change rollno coln
students2
str(student2)
students5 = merge(students, students2, by.x='rollno', by='formno')
students5

# Row Names
students
#students2 = students[,c('rollno', 'exp')] and exp level

rownames(students) = students$rollno
rownames(students2) = students2$rollno
head(students)
head(students2) # both DF to have same rownames
students6 = merge(students, students2, by=0, all=TRUE)
students6

# whichever method best suits, use it

# one of the DF has 1/ more rows less
students2
students2 = students2[-11,]
str(students2)  # last row deleted
students7 = merge(students, students2, by=0, all.y=TRUE)
students7
students8 = merge(students, students2, by=0, all.x=TRUE)
students8 # NA introduced as 1 row was less in y

# NA values
na.omit(students8) # removes NA rows - 3rd row Lalit
str(students8)
complete.cases(students8) # logical result 3rd row is false
students8[complete.cases(students8),] # rows which are complete
students8[!complete.cases(students8),] # rows which are incomplete


# DF to Matrix
students8
str(students8)
students9 = students8[,c(2,4)]
str(students9)
students9a = as.matrix(students9)
students9a
class(students9a)
