# Course Data
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
rollno ;sname ; course ; gender ; hostel
sdata = data.frame(rollno, sname, course, gender, exp, hostel)
sdata

sdata$hostel[sdata$rollno==17057] = TRUE
sdata

rm(sdata2, rollno1)
#sdata2
rollno2 = c(10,11,12,13)
sname2 = c('Achal','Apoorva','Goldie','Hitesh')
gender2 = c('M','F','M','M')
sdata2 = data.frame(rollno2, sname2, gender2)
sdata2
colnames(sdata2) = c("rollno1", "name1", "gender1")
sdata2
sdata3 = data.frame(rollno3 = rollno2, sname3= sname2,
            gender3=gender2)
sdata3 # colnames at the time of creation

# attach the data frame
attach(sdata2)
rollno1
rollno1 =  rollno1 - 5
rollno1
sdata2$rollno1 = sdata2$rollno1 - 4
sdata2
sdata2$rollno1
sdata2[1:2] = NULL # remove 1st 2 columns
sdata2


#sdata3
sdata3 = data.frame()


#sdatamat1
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
strsplit(name," ")[1:11][1]

course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
gender = c('M','F','M','M','M','F','M','F','M','M','M')



#--------
## with 
with(sdata, table(course, hostel, dnn=c('Course', 'Hostel')))

(firstname = sapply(strsplit(sname, ' '), function(x) x[1]))

# Contingency table with Matrix
excel = ceiling(rnorm(11,7,2))
sql = ceiling(rnorm(11,7,2))
rpgm = ceiling(rnorm(11,7,2))
smarks = matrix(c(excel, sql, rpgm), byrow=F, ncol=3,
                dimnames = list(firstname, c('excel', 'sql','rpgm')))

smarks
