# Melbourne Data Set
#https://www.kaggle.com/anthonypino/melbourne-housing-market

melbourne = read.csv('./data/Melbourne_house.csv')
str(melbourne)
summary(melbourne)
sum(is.na(melbourne))
colSums(is.na(melbourne))
