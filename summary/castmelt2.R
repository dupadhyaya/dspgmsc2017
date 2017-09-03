# Cast and Melt
#https://www.r-statistics.com/2012/01/aggregation-and-restructuring-data-from-r-in-action/
  
rollno = rep(c(10,11,12,13),4)
sname = rep(c('Achal','Apoorva','Goldie','Hitesh'),4)
#exam2 = rep(c('unit-1', 'unit-2', 'unit-3', 'unit-4'),4)
exam = rep(c('1', '2', '3', '4'),4)

rpgm = rep(ceiling(runif(4,50,100)),4)
sql  = rep(ceiling(runif(4,50,100)),4)
df1 = data.frame(rollno, sname, exam, rpgm, sql)
df1  # 16 rows, 4 students, 4 Units, 2 subjects

# Melt the data : wide to Long (more rows)

md = reshape::melt(df1, id=c('rollno', 'sname', 'exam'))
head(md)
summary(md)
# Cast
# rollno + sname -> subjectwise mean
reshape::cast(md, rollno + sname ~ variable, mean)

# unitwise mean
reshape::cast(md, exam ~ variable, mean)
head(md)
# unitwse mean per student
# cat(names(md))
# aggregate(md[-2], by=list(rollno,exam), value , FUN=mean )
# ?aggregate
# reshape::cast(md, rollno + sname ~ exam, mean)
# str(md$exam)
# summary(df1)

reshape::cast(md, rollno + sname + exam  ~  variable, sum)
length(md); nrow(md)

