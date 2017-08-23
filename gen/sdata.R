# Course Data
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
gender = c('M','F','M','M','M','F','M','F','M','M','M')
       
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8)
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
rollno ;sname ; course ; gender ; hostel
sdata = data.frame(rollno, sname, course, gender, exp, hostel)
sdata




#sdata
rollno = c(10,11,12,13)
sname = c('Achal','Apoorva','Goldie','Hitesh')
gender = c('M','F','M','M')
sdata = data.frame(rollno, sname, gender)
sdata
colnames(sdata) = c("rollno1", "name1", "gender1")
sdata
rm(list=ls())
attach(sdata)
rollno1
rollno1 =  rollno1 - 5
rollno1
sdata
sdata$rollno1
sdata[1:2] = NULL
sdata


