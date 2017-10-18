#Assign1:
#Ques-1 :Q1 -----------
#Below are the marks of 20 students Marks : 10 10 10 20 20 20 20 20 30 30 10 10 40 40 40 40 50 50 50 50
#Make Discrete Freq Distribution of marks : How does one generate such values in R
#A1
marks2 = c(rep(10,3), rep(20,5), rep(30,2), 10,10,rep(40,4), rep(50,4))
marks2
length(marks2)
table(marks2)
mean(marks2)  # 28.5

#-------------------------
#Ques-2 : Q2 ---------
#Find Mean of Various Forms of Data; 
#Draw a Histogram & Pie Chart of Discrete & Continuous Distribution
##Observation
#Marks : 10 , 12, 13, 14 , 17
##Discrete FD
#Marks : 10 12 13 14 17 
#No of Students : 5 7 9 8 4
##Continuous FD
#Marks: 10-20 20-30 30-40 40-50
#No of Students : 5 7 9 8
#A2
#Obsvn
marks2a = c(10 , 12, 13, 14 , 17)
sum(marks2a)/ length(marks2a)
mean(marks2a)  # 13.2

#Discrete
marks2b = c(10 , 12, 13, 14 , 17)
students2b = c(5,7,9,8,4)
sum(students2b)
(markstotal2 = marks2b * students2b)
sum(markstotal2b/ sum(students2b)) #13.06061

x=rep(marks2b, students2b)
table(x)
mean(x)

#Continuous
marks2c =c("10-20","20-30","30-40","40-50")
students2c =c(5,7,9,8)
(df2c = data.frame(marks2c, students2c))
str(df2c)
midpt2c =c(15,25,35,45)
(markstotal2c = students2c * midpt2c)
df2c$mid2c = midpt2c
df2c$mid2c
df2c[,3]
df2c
df2c$total = df2c$students2c * df2c$mid2c
df2c
sum(df2c$total)/sum(students2c)

x =rep(df2c$mid2c, df2c$students2c)
mean(x)


(df2c = cbind(df2c, markstotal2c))

(mean2c1 = sum(markstotal2c)/ sum(students2c))
#31.89


# Method2
#class = scan(what='character')
class1 = marks2c =c("10-20","20-30","30-40","40-50")
(students2c =c(5,7,9,8))
#freq3 = scan()

(class2 = as.numeric(unlist(strsplit(class1,"-"))))  # long method
(class3 = unique(class2))

# we need 15, 25, 35, 45
class3[-length(class3)]
diff(class3)/2
(mid3 = class3[-length(class3)] + diff(class3)/2)
(mid3 = as.numeric(mid3))

class3 ; mid3 ; students2c
cbind(class1, mid3, students2c)  #mid3 is also character here use DF
(df2c = data.frame(class1, mid3, students2c))

(df2c$midfreq = df2c$mid3 * df2c$students2c)
(mean2c2 = sum(df2c$midfreq)/ sum(df2c$students2c))  # 31.89


# Method3
# convert into observations
(x3 = rep(mid3, students2c))
mean(x3)  # 31.89

#rm(list=ls())
# Graphs
# Discrete
marks = c(10 , 12, 13, 14 , 17)
students = c(5,7,9,8,4)
x3a = rep(marks, students)
x3a
hist(x3a)
hist(x3a, breaks=6)
x = rnorm(100, 50,10)
hist(x,10)
bb= barplot(students, names.arg=marks, ylim=c(0,max(students)+2))
text(x=bb, y= students+.5, labels = students)
?text

# Continuous Data
(x3 = rep(mid3, students2c))
hist(x3)
students2c ;class1
barplot(students2c, names.arg= class1)
pie(students2c, labels=class1)

# ------------------------------------------------------------
#Ques-3 :Q3
#Following are marks of 50 students in a class
#12 63 61 63 87 65 1 24 67 52 70 55 29 93 30 84 29 27 19 24 32 31 16
#4 22 82 53 92 84 5 46 27 31 51 19 76 21 26 100 81 56 65 32 63 33 51 68 49 25 77
#Create a continuous Frequency Distribution Table
#Hint: seq, cut(breaks), table, cbind

#A3
set.seed(1234)
marks=ceiling(runif(50, 0, 100))
marks
cat(marks)
range(marks)
# we need this (10,20]  (60,70]  (60,70]  (60,70]  (80,90]  (60,70]   [7] (0,10]   (20,30]  (60,70]  (50,60]  (60,70]  (50,60]
breaks = seq(0,100, by=10)
breaks
marks.cut = cut(marks, breaks)
marks.cut
marks.table = table(marks.cut)
marks.table
cbind(marks.table)
marks
hist(marks, breaks=10)

