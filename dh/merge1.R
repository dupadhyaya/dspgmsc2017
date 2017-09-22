#Merge

?merge

df2= merge(mtcars, mtcars)
df2
dim(mtcars)
dim(df2)
df3= merge(mtcars, mtcars, by.x = names(mtcars))
dim(df3)
