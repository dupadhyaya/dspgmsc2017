#setwd("E:/rWork/Muit work/rproject1/Git Hub/Student datafest 2018")

# Import data
#Train <- read.csv("Train.csv")
Train <- read.csv(file.choose())

View(Train)
# new commands - Dhiraj
summary(Train)
str(Train)
cat(names(Train))
FactorCols = c('program_type', 'test_type', 'difficulty_level',  'gender', 'education', 'city_tier', 'is_handicapped', 'trainee_engagement_rating' ,'is_pass')
Train[FactorCols] = lapply(Train[FactorCols], factor)
lapply(Train, class)

dim(Train)  # there are some rows having missing values
sum(complete.cases(Train))
sum(!complete.cases(Train))
Train1 = Train[complete.cases(Train),]
head(Train1)
dim(Train1)

# divide data into test and train
library(caTools)
set.seed(243)
df = sample.split(Train1$age,SplitRatio = 0.8)
train_set = subset(Train1,df == TRUE)
test_set = subset(Train1,df == FALSE)
dim(train_set)
dim(test_set)
sum(complete.cases(test_set))


# Modeling----
regg1 = lm(age ~ .-id -trainee_id - program_id -is_pass,data = train_set)
summary(regg1)

regg2 = lm(age ~ .-id - program_id -is_pass - is_handicapped,data = train_set)
summary(regg2)

regg3 = lm(age ~ .-id - program_id -is_pass - is_handicapped -difficulty_level,data = train_set)
summary(regg3)

regg4 = lm(age ~ .-id - program_id -is_pass - is_handicapped -difficulty_level
          -program_type,data = train_set)
summary(regg4)

#regg5 = lm(age ~ . -id -program_id - test_id -trainee_id, data=train_set)
#summary(regg5)
regg5b = lm(age ~ ., data=train_set[,-c(1,2,5,6)])
summary(regg5b)
ndata= test_set[,-c(1,2,5,6)]
pred = predict(regg5b, newdata = ndata)
pred

test_set$pred = round(pred)
View(test_set)

error = test_set$age - test_set$pred
se = error**2
mse = sum(se)/length(se)
rmse = mse**0.5
rmse

Test <- read.csv("Test.csv")
View(Test)

regg = lm(age ~ .-id - program_id -is_pass,data = Train)
summary(regg)

pred1 = predict(regg,newdata = Test)
Test$age = round(pred1)

merge(Train,Test,by.x =id ,by.y =id)




# Is_pass treatment----
regg2 = glm(is_pass ~ . - id -program_id , data = Train,family = binomial)
summary(regg2)

regg2 = glm(is_pass ~ . - id -age -program_id , data = Train,family = binomial)
summary(regg2)

regg2 = glm(is_pass ~ . - id -gender -age -program_id , data = Train,family = binomial)
summary(regg2)

ispass = read.csv("test_ispass.csv")
ispass$is_pass = predict(regg2,type = "response",newdata = ispass)
#----
#setwd("E:/rWork/Muit work/rproject1/Git Hub/Student datafest 2018")

# Import data
#Train <- read.csv("Train.csv")
Train <- read.csv(file.choose())

View(Train)
# new commands - Dhiraj
summary(Train)
str(Train)
cat(names(Train))
FactorCols = c('program_type', 'test_type', 'difficulty_level',  'gender', 'education', 'city_tier', 'is_handicapped', 'trainee_engagement_rating' ,'is_pass')
Train[FactorCols] = lapply(Train[FactorCols], factor)
lapply(Train, class)

dim(Train)  # there are some rows having missing values
sum(complete.cases(Train))
sum(!complete.cases(Train))
Train1 = Train[complete.cases(Train),]
head(Train1)
dim(Train1)

# divide data into test and train
library(caTools)
set.seed(243)
df = sample.split(Train1$age,SplitRatio = 0.8)
train_set = subset(Train1,df == TRUE)
test_set = subset(Train1,df == FALSE)
dim(train_set)
dim(test_set)
sum(complete.cases(test_set))

regg5b = lm(age ~ ., data=train_set[,-c(1,2,5,6)])
summary(regg5b)
ndata= test_set[,-c(1,2,5,6)]
pred = predict(regg5b, newdata = ndata)
pred



