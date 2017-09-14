# Data Science Students Sample Data
?read.csv
# Read from CSV File
getwd()
#dir()
getwd()
df1 = read.csv(file='./data/dsstudents.csv')
head(df1[,1:2])
str(df1)

df2 = read.csv(file='./data/dsstudents.csv',
               row.names = c(paste('R',1:11, sep='')))
df2 = read.csv(file='./data/dsstudents.csv',
               row.names = 1)

head(df2[,1:2])
df2$rollno2 = row.names(df2)
df2[,c('rollno2')]
str(df2)

df2 = read.csv(file='./data/dsstudents.csv', stringsAsFactors = F)
df2
str(df2)
head(df2)[1:4]


# Convert Gender and course into factors type
df2$Course = factor(df2$Course)
df2$gender = factor(df2$gender)
str(df2)
summary(df2)
table(df2$Course, df2$gender)

df2[c('name','gender')]  # display name & gender
names(df2)   # column names / attributes/ variables
row.names(df2)
df2$rollno[df2$rollno == 170113] = 17013  # change rollno fm.. to ..
df2$rollno  # check rollno coln
#df2$rollno[df2$name == 'Lalit Sahni'] = 17013
#df2$name == 'Lalit Sahni'   # check by name
fix(df2)  # edit DF & save back 
df2



?read.csv
read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)


?read.table


df1 = read.csv(file='./data/dsstudents.csv')
df1
df2 = read.csv(file='./data/dsstudents.csv', row.names = 1)
df2[,1:2]

write.csv(df2, file='./data/dsstudents2.csv')
