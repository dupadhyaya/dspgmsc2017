# Data Frame 3

#Properties
#sdata
rollno = c(10,11,12,13)
name = c('Achal','Apoorva','Goldie','Hitesh')
gender = c('M','F','M','M')
sdata = data.frame(rollno, name, gender)
sdata

#Change Row and Colnmames
colnames(sdata) = c("rollno1", "name1", "gender1")
colnames(sdata)
rownames(sdata) = c("ID1", "ID2", "ID3", "ID4")
rownames(sdata)

#Dimensions
dim(sdata)
dim(sdata)[1]
#Number of rows
dim(sdata)[2]
#Number of columns

#No of Rows & Colns
nrow(sdata)
ncol(sdata)
length(sdata)

#Changing Data
attach(sdata)
rollno1 = rollno1 - 5
rollno1
#reduce rollno by 5 (does not store in DF)
sdata$rollno1


#Remove Colns/ Rows
#Colns
sdata[1] <- NULL
#Rows
rows_to_keep <- c(TRUE, FALSE, TRUE, FALSE)

#Method1
df_limit = df[rows_to_keep, ]
df_limit

#Method2
df_limit2 <- df[ !rows_to_keep, ]
df_limit2

#Threshold
df_limit3 <- df[df$col1 > 40, ]
df_limit3

# Add Rows & Columns to DF
cbind(df, x)# x - same no of rows as df
rbind(df, y) # y - same no of colns as df



#Sort / Order / Rank
#Order
order(mtcars)

#sort
sort(mtcars) # error
sort(mtcars[1, ])  # order row 1 by values

sort(mtcars[ , 1]) # sort coln 1

sort(mtcars$mpg, decreasing=F)
mtcars
order(mtcars$mpg)
mtcars[ order(mtcars$mpg), ]

order( mtcars$mpg, mtcars[ , 2], decreasing=F)

with( mtcars$mpg, order(mpg, cyl))

#rank
rank(mtcars$mpg)
rank( c(10, 7, 3, 4, 5))

# Options na.last=T , ties.method = c('average', 'first', 'random', 'max', 'min'))            

dplyr::arrange
dplyr::arrange(mtcars, cyl, disp)
dplyr::arrange(mtcars, desc(disp))
