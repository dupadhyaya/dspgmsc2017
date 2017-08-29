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
marks = c(10 , 12, 13, 14 , 17)
mean(marks)  # 13.2

#Discrete
marks = c(10 , 12, 13, 14 , 17)
students = c(5,7,9,8,4)
sum(students)
markstotal = marks * students
markstotal
sum(markstotal/ sum(students)) #13.06061

#Continuous
marks3 =c("10-20","20-30","30-40","40-50")
students3 =c(5,7,9,8)
df3 = data.frame(marks3, students3)
df3
midpt3 =c(15,25,35,45)
markstotal = students3 * midpt3
markstotal
df3a = cbind(df3, markstotal)
df3a
mean3 = sum(markstotal)/ sum(students3)
mean3 #31.89


# Method2
#class = scan(what='character')
class3 =c("10-20","20-30","30-40","40-50")
class3
#freq3 = scan()
freq3 = c(5,7,9,8)
(class1 = as.numeric(unlist(strsplit(class3,"-"))))  # long method
(class2 = unique(class1))

# we need 15, 25, 35, 45
class2[-length(class2)]
diff(class2)/2
(mid3 = class2[-length(class2)] + diff(class2)/2)
mid3 = as.numeric(mid3)

class3 ; mid3 ; freq3
cbind(class3, mid3, freq3)  #midx3 is also character
(df3 = data.frame(class3, mid3, freq3))

(df3$midfreq = df3$mid3 * df3$freq3)
(meanx = sum(df3$midfreq)/ sum(df3$freq3))  # 31.89


# Method3
# convert into observations
(x = rep(mid3, freq3))
mean(x)


# Graphs
# Discrete
marks = c(10 , 12, 13, 14 , 17)
students = c(5,7,9,8,4)
x3a = rep(marks, students)
hist(x3a)
bb= barplot(students, names.arg=marks, ylim=c(0,max(students)+2))
text(x=bb, y= students+.5, labels = students)
?text

# Continuous Data
hist(x)
df3
df3$class3 = factor(df3$class3)
barplot(df3$freq3, names.arg= df3$class3)
pie(df3$freq3, labels=df3$class3)

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
#[1] (10,20]  (60,70]  (60,70]  (60,70]  (80,90]  (60,70]   [7] (0,10]   (20,30]  (60,70]  (50,60]  (60,70]  (50,60]
breaks = seq(0,100, by=10)
breaks
marks.cut = cut(marks, breaks)
marks.cut
marks.table = table(marks.cut)
cbind(marks.table)

