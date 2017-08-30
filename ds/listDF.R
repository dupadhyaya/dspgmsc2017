# List to DF

cricket = c('Achal', 'Apoorva')
football = c('Achal','Apoorva','Goldie','Hitesh')
hockey  = c(1,5,3,8)
matcheswon = c(TRUE, FALSE)

#name= c('Achal','Apoorva','Goldie','Hitesh',
#        'Kaustav','Meena','Rashmi','Shruti','Shubham','Vijay','Lalit')
mylist = list(cricket, football, hockey, matcheswon)
mylist
str(mylist)

listDF = stack(mylist)   # cannot be used
# data has to be numeric
marks1 = c(1,2,3,4,5)
marks2 = c(1,2,3,4,5)
marks3 = c(1,3,7,8,10)
mylist2 = list(marks1, marks2, marks3)
mylist2

(myVector = unlist(mylist2))
myDF = stack(mylist2)

?stack



# Example
str(PlantGrowth)
formula(PlantGrowth)         # check the default formula
pg <- unstack(PlantGrowth)   # unstack according to this formula
pg
str(pg)
stack(pg)                    # now put it back together
stack(pg, select = -ctrl)    # omitting one vector



# DF to List
football = c('Achal','Apoorva','Goldie','Hitesh')
hockey  = c(1,5,3,8)
(df1 = data.frame(football,hockey))
str(df1)
unstack(df1)

(mylist3 = as.list(unstack(df1)))
mylist3
(mylist4 = stack(mylist3))
