# Data Frame

# Wide Format to Long Format 
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
lname  = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
name  = c('Achal','Apoorva','Goldie','Hitesh','Kaustav','Meena','Rashmi','Shruti','Shubham','Vijay','Lalit')

course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
stats = ceiling(runif(11,50,100))
excel = ceiling(runif(11,50,100))
rpgm = ceiling(runif(11,50,100))

students = data.frame(rollno, name, course, stats, excel, rpgm, stringsAsFactors = F)
students
students$course = factor(students$course)
str(students)
# data ready
head(students)

library(reshape2)
students2 <- melt(students, id.vars=c("rollno",'name','course'),
          measure.vars=c("stats", "excel", "rpgm"),
         variable.name="subject", value.name="marks")
students2


# Long to Short
students3 = students2
head(students3)
students4 = dcast(students3, rollno + name + course ~ subject, value.var='marks')
students4 

students5 = dcast(students3, course ~ subject, value.var = 'marks', mean)
students5

students6 = dcast(students3, name ~ subject, value.var = 'marks', mean)
students6  # name to factor

students7 = dcast(students3, rollno + name ~ course + subject, value.var='marks')
students7 # not meaninful here

?dcast
