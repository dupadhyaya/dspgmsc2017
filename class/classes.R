# Class Data Summarisation
#
pgmsc = read.csv('./data/pgmsc.csv')
colcls =c('character', rep('factor',3), 
          'numeric', rep('factor',11),
          'character')
colcls
dim(pgmsc)
str(pgmsc)
pgmsc = read.csv('./data/pgmsc.csv', colClasses = colcls)
str(pgmsc)
head(pgmsc)
pgmsc$date = as.Date(pgmsc$date,format= '%d-%b-%Y')
head(pgmsc)
pgmsc[,1]

library(data.table)
DT = data.table(pgmsc)
DT[, sum(hrs), by=date]
DT[, sum(hrs), by=fac]

aggregate(pgmsc[,'hrs'], FUN=sum, by=list(pgmsc$fac))

library(dplyr)
pgmsc %>% group_by(date) %>% summarise(TotalClass = sum(hrs))
pgmsc %>% group_by(fac) %>% summarise(TotalClass = sum(hrs))


# Summarise Fac and month wise
# 
(month = as.numeric(format(pgmsc$date,"%m")))
pgmsc <- transform(pgmsc,month=as.numeric(format(pgmsc$date,"%m")))
str(pgmsc)
#This is the solution
pgmsc %>% group_by(fac, month) %>% summarise(TotalClass = sum(hrs)) %>% arrange(fac,month)

pgmsc %>% group_by(month) %>% summarise(sum(hrs))

cat(names(pgmsc))
x = c('A', 'P', NA, 'A')
length(which(x=='P'))

# This just counts
pgmsc %>% summarise( length(Achal), length(Lalit))
#Meena Goldie Kaustav Rashmi Hitesh Shruti Shubam Achal Apoorva Vijay Lalit

apply(pgmsc[6:16],2, function(x) length(which(x=='P')))
pgmsc %>% summarise(rashmi= length(which(Rashmi=='P')))

# Attendance for each Student with Subject Teachers
(m1= aggregate(pgmsc[6:16], by = list(Faculty=pgmsc$fac), 
          FUN = function(x) length(which(x=='P'))))       
(m2 = (m1[-1]))
class(m2)
str(m2)
names(m2)
mode(m2)  # internal storage as list
attributes(m2)
?attributes
apply(m2,2, class)
colMeans(m2)
rowMeans(m2)
sapply(m2, mean)
addmargins(m2,2,mean)  



library(lubridate)
#monthwise Hours of Classes
pgmsc %>% group_by(month=floor_date(date, "month")) %>%
  summarize(hr=sum(hrs))
pgmsc %>% group_by(month=floor_date(date, "month"),
      faculty = fac) %>%  summarize(hr=sum(hrs))

month(pgmsc$date)
(monsum = pgmsc %>% group_by(month=month(date),
                   faculty = fac) %>%  summarize(hr=sum(hrs)))
monsum
library(tidyr)
monsum2 = monsum %>% tidyr::spread(faculty,hr) %>% data.frame 



#BTech
colcls2 =c('character', rep('factor',3), 
          'numeric', rep('factor',5),
          'character')
colcls2
btech = read.csv('./data/btech.csv', colClasses = colcls2)
str(btech)
head(btech)
btech$date = as.Date(btech$date,format= '%d-%b-%Y')
head(btech)
btech %>% group_by(month=floor_date(date, "month"),
                   faculty = fac) %>%  summarize(hr=sum(hrs))
(monsum3 = btech %>% group_by(month=month(date),
                             faculty = fac) %>%  summarize(hr=sum(hrs)))

(monsum4 = monsum3 %>% tidyr::spread(faculty,hr) %>% data.frame )
btech

(pgmsc = transform(pgmsc, course='pgmsc'))
(btech = transform(btech, course='btech'))

# Total for Btech & PG
total = rbind(pgmsc[,c(1:5,)], btech[,c(1:5)])
total

total %>% group_by(month(date),
                   faculty = fac) %>%  summarize(hr=sum(hrs))
(monsum5 = total %>% group_by(month(date),
      faculty = fac) %>%  summarize(hr=sum(hrs)))
  
(monsum6 = monsum5 %>% tidyr::spread(faculty,hr) %>% data.frame )
btech
