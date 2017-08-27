#Chapter - 4 : Basic Data Management ------------------------------------------

# Manipulating Dates and Missing Values
# Understanding Data Type Conversions
# Creating and Recoding Variables
# Sorting, Merging and Subsetting datasets
# Selecting and dropping values

# 4.1 Working Example
# table 4.1 Gender Difference : Ratings given to managers by their boss
# 5 statements  q1 to q5
# 99 shows missing data
manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5, stringsAsFactors=FALSE)
leadership

# Combine 5 ratings q1 to q5 


# Recode values like 99 for age to missing

# create new dataset with only variables of interest

# create new variable with age group to category based on age

# Study wrt to period... 


# 4.2 Creating New variables
mydata = data.frame(x1=c(2,2,6,4) , 
                    x2=c(3,4,2,8))
mydata
mydata$sumx = mydata$x1 + mydata$x2
mydata$meanx = (mydata$x1 + mydata$x2)/2
mydata

attach(mydata)
mydata$sumx2 = x1 + x2
mydata$meanx2 = (x1 + x2)/2

# best method
mydata = transform(mydata,
                   sumx3 = x1 + x2,
                   meanx3 = (x1 + x2)/2)
mydata

# Recoding Variables
# Continuous to Categories
# Miscoded with Correct Values
# Pass/ Fail on cut off

# Table 4.3  Logical Operators
# <, <=, >, >=, ==, !=, !x, x|y, x & y , isTRUE(x)
leadership$age
leadership
leadership$age == 99
leadership$age[leadership$age == 99] = NA # 99 to missing NA
leadership

leadership$age
leadership$agecat[leadership$age > 75] = 'Elder'
leadership$agecat

leadership$agecat[leadership$age >= 55 &
                    leadership$age <= 75] = 'Middle Aged'
leadership$agecat

leadership$agecat[leadership$age < 55] = 'Young'
leadership$agecat

leadership$agecat = NULL
leadership$agecat
leadership

# Compact method
leadership = within(leadership, {
  agecat = NA
  agecat[age > 75] = 'Elder'
  agecat[age >= 55 & age <= 75 ] = 'Middle Aged'
  agecat[age <= 55] = 'Young'
  
})
leadership

# Others - car::recode(), doBy::recodevar() : cut


# 4.4 Renaming Variables

fix(leadership)

reshape::rename(dataframe, c(oldname='newname', ...))
reshape::rename(leadership, c(manager='managerID', date='testDate'))
leadership

names(leadership)[2] = 'testDate'
leadership
names(leadership)

names(leadership)[6:10] = c('item1','item2','item3','item4','item5')

# Missing Values by NA same for character and numeric
# Impossible values buy NaN (not a number)

y = c(1,2,3, NA)
y
is.na(y)

manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5, stringsAsFactors=FALSE)
leadership

is.na(leadership)
is.na(leadership)[,6:10]

leadership$age[leadership$age == 99 ] = NA
leadership

# 4.5.2 Excluding Missing values from analysis

x = c(1,2, NA, 3)
x[2]
y = x[1] + x[2] + x[3] + x[4]
z = sum(x)
y;z  # Not calcuated due NA values
y= sum(x, na.rm = T)
y

# remove data by na.omit() : List wise deletion
leadership
# remove row 4  # 5 has age=99
newdata = na.omit(leadership)  # data frame with complete cases
newdata

# 4.6 Date values Pg 80
as.Date(x, 'input_format')
?as.Date
# %d  %a%A  %m%b%B %y%Y

mydate = as.Date(c('2007-06-22', '2004-02-03'))
mydate
Sys.Date() - mydate

strDates = c('01/05/1965', '08/16/1975')
dates = as.Date(strDates, '%m/%d/%Y')
Sys.Date() - dates

myformat = '%m/%d/%y'
class(leadership$date)
leadership$date = as.Date(leadership$date, myformat)
class(leadership$date)
leadership
date()  # date and time
Sys.Date() - leadership$date

format(Sys.Date(),'%d - %A - %Y')
dob = as.Date('2016-01-01')
difftime(Sys.Date(),dob, units='weeks' )
difftime(Sys.Date(),dob, units='days' ) # secs, mins, hours, days

strDate = as.character(dates)
strDate

# lubridate
# is.numeric()  as.numeric()
a = c(1,2,3)
a
is.numeric(a)
is.vector(a)
is.data.frame(a)

# Sorting Data ----------------
newdata = leadership[order(leadership$age),]
leadership
newdata
newdata2 = leadership[order(leadership$gender, - leadership$age),]
newdata2


# Merging Datasets
# adding columns
total = merge(DFA, DFB, by='ID')
total = merge(DFA, DFB, by=c('ID','Country'))

total = cbind(A,B) # same no of rows, sorted in same way

# Adding rows
rbind()
total = rbind(DFA, DFB)  # same variable may not in same order; match variables before adding

# Subsetting datasets
DF[rowindices, colindices]
newdata = leadership[,c(6:10)]
newdata

myvars = c('q1','q2','q3','q4','q5')
newdata = leadership[myvars]
newdata
myvars = c(paste('q',1:5,sep=''))
myvars

# 4.10.2 Excluding dropping variables
myvars = names(leadership) %in% c('q1','q4')
myvars
newdata = leadership[!myvars]
newdata

newdata = leadership[c(-8,-9)]
newdata

#deletion
leadership$q3 = leadership$q4 = NULL
leadership

#4.10.3 Selecting Observations
newdata = leadership[1:3,]
newdata = leadership[which(leadership$gender == 'M' &
                             leadership$age > 30),]
newdata

# Dates
leadership$date = as.Date(leadership$date, '%m/%d/%y')
startdate = as.Date('2009-01-01')
enddate = as.Date('2009-10-31')
newdata = leadership[which(leadership$date >= startdate & 
                             leadership$date <= enddate), ]
newdata

# 4.10.4 Subset functions
manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5, stringsAsFactors=FALSE)
leadership



newdata = subset(leadership, age >= 35 | age < 24,
                 select=c(q1,q2,q3,q4))
newdata

leadership
newdata = subset(leadership, gender=='M' & age > 25,
                 select=gender:q4)
newdata


# Random samples
mysample = leadership[sample(1:nrow(leadership), 3, replace=FALSE),]
mysample

# sampling package, survey package

# SQL Statements to manipulate DFs

#sqldf package
library(sqldf)
newdf = sqldf('select * from mtcars where carb=1 order by mpg', row.names=T)
newdf

sqldf('select avg(mpg) as avg_mpg, avg(disp) as avg_disp, 
      gear, cyl from mtcars where cyl in (4,6) group by gear')
