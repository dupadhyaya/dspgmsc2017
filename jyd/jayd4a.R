library('ggplot2') # visualization
library('ggthemes') # visualization
library('scales') # visualization
library('dplyr') # data manipulation
library('caTools') # Spliting data
library('rms') # For step wise regression
library('datasets')
data(Titanic)
Titanic
dataset <- read.csv("./data/train.csv",stringsAsFactors = F,na = "")
dataset
str(dataset)
table(dataset$Sex)

colSums(is.na(dataset))
table(dataset$Embarked)

dataset$Embarked[is.na(dataset$Embarked)]="S"
table(dataset$Embarked)

table(dataset$Embarked)
apply(dataset,2, function(x) length(unique(x)))

cols=c("Survived","Pclass","Sex","Embarked")
for (i in cols){
  dataset[,i]=as.factor(dataset[,i])
}

prop.table(table(dataset$Pclass, dataset$Survived))

ggplot(dataset,aes(x=Pclass,fill=factor(Survived))) +
  geom_bar()+
  ggtitle("Pclass v/s Survival Rate")+
  xlab("Pclass") +
  ylab("Total Count") +
  labs(fill = "Survived")  

ggplot(dataset, aes(x = Sex, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass) + 
  ggtitle("3D view of sex, pclass, and survival") +
  xlab("Sex") +
  ylab("Total Count") +
  labs(fill = "Survived")

ggplot(dataset, aes(x = Sex, fill = Survived)) +
  geom_bar() +
  ggtitle("Gender vs survival") +
  xlab("Sex") +
  ylab("Total Count") +
  labs(fill = "Survived")

head(dataset$Name)

names <- dataset$Name
title <-  gsub("^.*, (.*?)\\..*$", "\\1", names)
dataset$Title <- title

# Show title counts by sex
table(dataset$Sex, dataset$Title)


# Army folks, doctors and nobel people to be combined in one group - "Officer" level
officer <- c('Capt', 'Col', 'Don', 'Dr', 'Major', 'Rev', 'Sir', 'Jonkheer', 'the Countess')
dataset$Title[dataset$Title %in% officer]  <- 'Officer'

# Also reassign mlle, ms, and mme accordingly
dataset$Title[dataset$Title == 'Mlle']        <- 'Miss' 
dataset$Title[dataset$Title == 'Ms']          <- 'Miss'
dataset$Title[dataset$Title == 'Lady']         <- 'Miss' 
dataset$Title[dataset$Title == 'Dona']         <- 'Miss' 
dataset$Title[dataset$Title == 'Mme']         <- 'Mrs' 

# Show title counts by sex again
table(dataset$Sex, dataset$Title)

ggplot(dataset,aes(x = Title,fill=factor(Survived))) +
  geom_bar() +
  ggtitle("Title V/S Survival rate")+
  xlab("Title") +
  ylab("Total Count") +
  labs(fill = "Survived")


ggplot(dataset, aes(x = Title, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Pclass) + 
  ggtitle("3-way relationship of Title, Pclass, and Survival") +
  xlab("Title") +
  ylab("Total Count") +
  labs(fill = "Survived")


# Create a family size variable including the passenger themselves
dataset$Fsize <- dataset$SibSp + dataset$Parch + 1


# Use ggplot2 to visualize the relationship between family size & survival
ggplot(dataset, aes(x = Fsize, fill = Survived)) +
  geom_bar() +
  ggtitle("Family Size V/S Survival Rate") +
  xlab("FamilySize") +
  ylab("Total Count") +
  labs(fill = "Survived")


# Discretize family size
dataset$FsizeD[dataset$Fsize == 1] <- 'singleton'
dataset$FsizeD[dataset$Fsize < 5 & dataset$Fsize > 1] <- 'small'
dataset$FsizeD[dataset$Fsize > 4] <- 'large'

ggplot(dataset, aes(x = FsizeD, fill = Survived)) +
  geom_bar() +
  ggtitle("Family Size V/S Survival Rate") +
  xlab("FamilySize") +
  ylab("Total Count") +
  labs(fill = "Survived")


ggplot(dataset,aes(x = Embarked,fill=factor(Survived))) +
  geom_bar() +
  ggtitle("Embarked vs Survival") +
  xlab("Embarked") +
  ylab("Total Count") +
  labs(fill = "Survived") 
