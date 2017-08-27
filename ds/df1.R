# Data Frame 1

#df1
n = c(2, 3, 5)
s = c("aa", "bb", "cc")
b = c(TRUE, FALSE, TRUE)
df1 = data.frame(n, s, b)
str(df1)
summary(df1) # s is a factor


# Empty DF
ab <- data.frame()
Age <- numeric() 
Name <- character() 
ID <- integer() 
Gender <- factor() 
Date <- as.Date(character()) 
df2 <- data.frame(c(Age, Name, ID, Gender, Date))
df2
str(df2)


# Built in DF Data Frame Properties
head(mtcars)
nrow(mtcars)
ncol(mtcars)
help(mtcars)

# Ways to Retrieve
# Columns
mtcars[1:3]
mtcars[,1:3]
mtcars[, "cyl"]
mtcars[ , c('mpg', 'gear','am')]
#Rows
mtcars[1, ]
mtcars[c(1,5), ]
mtcars[1:5, ]
mtcars["Mazda RX4", ]

#Rows & Colns
mtcars[4:5, 1:3]
mtcars["Mazda RX4", "cyl"]
mtcars[1, 2]
mtcars [ 2:6, c('mpg', 'gear','am')]

#Output as list
mtcars[1, , drop=T]

# Column as a Vector
mtcars[[9]]
mtcars[['am']]
mtcars$am
mtcars[,"am"]

#Based on Criteria
mtcars[mtcars$mpg > 25.0, ]
mtcars[ mtcars$gear == 4, ]
mtcars[rownames(mtcars) == 'Fiat 128', ]
mtcars[ grep("^4", mtcars$gear),  ]  # start with 4

#Patterns
mtcars[ grep("M", rownames(mtcars), ignore.case=T), ]

#Using Subset Comd
subset(mtcars, carb == '2' ]
subset(mtcars, hp == 110)


#DF Slicing
#Column Slice
#data frame column slice with the single square bracket "[ ]" operator.
mtcars[1] #Numeric Indexing
mtcars["mpg"] #Name Indexing

mtcars[c("mpg", "hp")]

#Row Slice single [ ,]
mtcars[24, ] #Numeric Indexing
mtcars[c(3, 24),]

mtcars["Camaro Z28",] #Name Indexing

mtcars[c("Datsun 710", "Camaro Z28"),]

#Logical Indexing
nrow(mtcars)
logv = c(rep(TRUE,16), rep(FALSE,16))
logv
mtcars[logv,]
#Eg2
L = mtcars$am == 0 > L
mtcars[L,]
mtcars[L,]$mpg


dplyr::slice

#1st Row
slice(mtcars, 1L)
slice(mtcars, n())
filter(mtcars, row_number() == n())
filter(mtcars, row_number() == 1L)

#5 to last row
slice(mtcars, 5:n() )
filter(mtcars, between(row_number() == 5, n() ) )
by_cyl = group_by(mtcars, cyl)
slice(by_cyl, 1:2)

