# Write to File
# 

#Vector
gender = c('M','F','M','M','M','F','M','F','M','M','M')
is.character(gender)
# M F M ....
write(gender, file='./file/studentsds17' ) # no of rows

write(x=gender, file='./file/studentsds17', 
    ncolumns= if(is.character(x)) 1  else 5, sep=' ') # no of rows

rollno= c(17010,17045,17012,17087,17057,17056,17032,17084,
          17078,17018,17013)
is.character(rollno)
# check .....
write(x=rollno, file='./file/studentsds17', 
      ncolumns= if(is.character(x)) 1  else 10, sep=' ') # no of rows


(ser = seq(1,11))
write(x=ser, file='./file/serial.txt', ncolumns = length(x))

(course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS'))
write(x=course, file='./file/course.txt', ncolumns = 1)



# write to csv file # Matrix or DF
rollno= c(17010,17045,17012,17087,17057,17056,17032,17084,
          17078,17018,17013)
name= c('Achal','Apoorva','Goldie','Hitesh',
        'Kaustav','Meena','Rashmi','Shruti','Shubham','Vijay','Lalit')

course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')

gender = c('M','F','M','M','M','F','M','F','M','M','M')

df = data.frame(rollno, name, course, gender, 
          row.names = name, stringsAsFactors = F)
df
write.csv(df, file='./file/studentds1.csv', row.names = TRUE,
          col.names = TRUE)  # sep can be ignored as it is csv ,
#"Achal",17010,"Achal","PGDDS","M"

write.csv(df, file='./file/studentds2.csv', row.names=FALSE,
          col.names = TRUE)  # sep can be ignored as it is csv ,
#17010,"Achal","PGDDS","M"

write.csv(df, file='./file/studentds3.csv', row.names=FALSE
      )  # sep can be ignored as it is csv ,
#"rollno","name","course","gender"
#17010,"Achal","PGDDS","M"
#

# Lists to File
mylist = list(name='Dhiraj', courses=c('bsc','btech', 'mtech'))
mylist
dput(mylist, file='./file/listfile1.txt')

#structure(list(name = "Dhiraj", courses = c("bsc", "btech", "mtech"
#)), .Names = c("name", "courses"))

newlist = dget('./file/listfile1.txt')
newlist
