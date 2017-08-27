# Practise
# 
batch = data.frame(course= c('bsc', 'msc', 'bba', 'ba', 'llb')
       ,students= c(10, 5, 20, 18, 20)
       ,school=c('ds', 'ds', 'law', 'law', 'law'), stringsAsFactors=T)
str(batch)
summary(batch)
batch
batch$school
summary(batch$students)
names(batch)
rownames(batch)
colnames(batch)
row.names(batch)
dimnames(batch)  # all R & C

batch2 = matrix(1:24,nrow=4)
batch2
max(batch2)
min(batch2)
sum(batch2)
fivenum(batch2)
length(batch2)
summary(batch2)
rowMeans(batch2)
apply(batch2, 1, median)[1:3]
batch2
apply(batch2, 1, median)[c(1,2)]

table(batch)
table(batch$course, batch$school)
table(batch$course, batch$school, dnn=c('course','school'))



library(reshape)
head(mtcars)
dstats <- function(x)(c(n=length(x), mean=mean(x), sd=sd(x)))
dfm <- melt(mtcars, measure.vars=c("mpg", "hp", "wt"),
              id.vars=c("am", "cyl"))
head(dfm)

cast(dfm, am + cyl + variable ~ ., dstats)
cast(dfm, am + cyl + variable ~.)


help(warpbreaks)
head(warpbreaks)
with(warpbreaks, table(wool, tension))
table(state.division, state.region)

course = data.frame(course= c("bsc","msc","phd", "bsc","msc","phd"),
                    gender=c('male','male','male','female','female','female' ),
                    students=c(10,15,7,12,20,10))
course
ftable(course$course, course$gender, course$students)
xtabs(~course + gender + students, data=course)

student <- matrix(c(10,12,15,20,7,10),ncol=2,byrow=TRUE)
colnames(student) <- c('male','female')
rownames(student) <- c("bsc","msc","phd")
student <- as.table(student)
student
barplot(student)
plot(student)
margin.table(student)
margin.table(student,1)
margin.table(student,2)
prop.table(student)
prop.table(student,1)
prop.table(student,2)

addmargins(student)
addmargins(student,1)
addmargins(student,2)



ID <- seq(1:177)
Age <- sample(c("0-15", "16-29", "30-44", "45-64", "65+"), 177, replace = TRUE)
Sex <- sample(c("Male", "Female"), 177, replace = TRUE)
Country <- sample(c("England", "Wales", "Scotland", "N. Ireland"), 177, replace = TRUE)
Health <- sample(c("Poor", "Average", "Good"), 177, replace = TRUE)
Survey <- data.frame(Age, Sex, Country, Health)
head(Survey)     
source("http://pcwww.liv.ac.uk/~william/R/crosstab.r")
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "f")   
view(crosstab)
#http://rstudio-pubs-static.s3.amazonaws.com/6975_c4943349b6174f448104a5513fed59a9.html
# Row percentages
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "r")
# Column percentages
crosstab(Survey, row.vars = "Age", col.vars = "Sex", type = "c")
# Joint percentages (sums to 100 within final two table dimensions)
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "j")
# Total percentages (sums to 100 across entire table)
crosstab(Survey, row.vars = c("Age", "Sex"), col.vars = "Health", type = "t")
         