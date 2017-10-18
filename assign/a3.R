
#Q1:
sales= c(1000, 13000, 12000, 15000)
names(sales) = paste('Q',1:4,sep='')
sales
barplot(sales)

# Attendance
attnd05Sep17 = sample(c('A','P'), size=30, replace=T, prob = c(0.3,0.7)) 
table(attnd05Sep17)

# Cricket Players
set.seed(1000)
(p1 = ceiling(runif(10,50,100)))
set.seed(1100)
(p2 = ceiling(runif(10,50,100)))
set.seed(1200)
(p3 = ceiling(runif(10,50,100)))
set.seed(1300)
(p4 = ceiling(runif(10,50,100)))
set.seed(1400)
(p5 = ceiling(runif(10,50,100)))
scores = matrix(c(p1,p2,p3,p4,p5), byrow=F,ncol=5,
      dimnames=list(paste('M',1:10,sep=''),paste('P',1:5,sep='')))
scores
colMeans(scores)
rowMeans(scores)
for (i in 1:5) {
print(paste(paste('Player - ',i, sep=''), mean(scores[,i]), sep=' '))
}

for (i in 1:10) {
  print(paste(paste('Match ' ,i, sep='-'),mean(scores[i,]), sep=' '))
}
apply(scores, 2, mean)
apply(scores, 1, mean)



students =c('S1', 'S2', 'S3', 'S4', 'S5')
gender =c('M', 'F', 'M', 'M', 'F')
age = c(23,22,21,25,22)
city = c('Delhi','Noida','Lucknow','Delhi','Noida')
cat = c('Gen','OBC','Gen','SCST','Gen')
data6 = data.frame(students, gender, age, city, cat, stringsAsFactors = F)
data6
str(data6)
data6$gender=factor(data6$gender)
data6$cat= factor(data$gender)
str(data6)
# Tabulate Values
table(data6$gender)
data6$students = c(paste('Student',1:5, sep=''))
data6
