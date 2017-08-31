# Table 
?table
load('class/sdata.R')  # load from R Data
student
sdata
table(sdata$course, sdata$gender)

table(sdata$course, sdata$gender, dnn=c('Course', 'Gender'))
table(sdata$course, sdata$hostel, dnn=c('Course', 'Hostel'))

# with 
with(sdata, table(course, hostel, dnn=c('Course', 'Hostel')))

(firstname = sapply(strsplit(sname, ' '), function(x) x[1]))

# Contingency table with Matrix
excel = ceiling(rnorm(11,7,2))
sql = ceiling(rnorm(11,7,2))
rpgm = ceiling(rnorm(11,7,2))
smarks = matrix(c(excel, sql, rpgm), byrow=F, ncol=3,
          dimnames = list(firstname, c('excel', 'sql','rpgm')))

smarks

