#Hitesh
#predict the sale price of a listing based on information a user provides for this listing
#https://www.kaggle.com/c/mercari-price-suggestion-challenge/data

train = read.csv(file='E:/datasets/mercari_train.csv')
train2 = read.csv(file='E:/datasets/mercari_train.csv', nrows=100)

str(train2)
head(train2)
names(train2)
train2$item_description[1]
View(train2)
