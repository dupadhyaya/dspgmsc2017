# Assignment Jaideep
#Selection and summary statistics:

houses = read.csv(file.choose())
houses
write.csv(houses, './data/houses.csv')
str(houses)
names(houses)
head(houses[,c('date','price', 'zipcode')])
class(houses)
lapply(houses, class)
head()
as.Date(houses$date,format="%y-%b-%d")

# Extract Date from Data Column by splitting 
date1 = as.character(houses$date)
date2 = strsplit(date1,'T')

lapply(date2, `[[`, 1)
library(purrr)
map(date2, 1)
date3= unlist(date2)[ c(TRUE,FALSE) ]
do.call( rbind, date2)[,1]
head(date3)
(date4 = as.Date(date3,format="%Y%m%d"))
houses$date2 = date4


summary(houses)
# Which Pincode has highest average price
df2 = aggregate(houses$price, by=list(houses$zipcode), mean)
(zipmax = df2$Group.1[which.max(df2$x)])

#Select houses with this zip code
houses[which(houses$zipcode==zipmax),][,c('id','price','zipcode')]

#first select the houses that have ‘sqft_living’
#higher than 2000 sqft but no larger than 4000 sqft.
names(houses)
df3= houses[(houses$sqft_living > 2000) & (houses$sqft_living < 4000),][,c('id', 'sqft_living')]
nrow(df3); nrow(houses)
nrow(df3)/nrow(houses)
# 42% of houses

colSums(is.na(houses))
#Model1
names(houses)
fit1 = lm(price ~ bedrooms + bathrooms + sqft_living +sqft_lot 
          + floors + zipcode, data= houses)
summary(fit1)
#houses$sqft_basement

cat(print(names(houses),quote=F))
fit2 = lm(price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors + waterfront + view + condition  
          + grade + sqft_above + sqft_basement + yr_built + yr_renovated + zipcode + lat + long + sqft_living15 + sqft_lot15, data=houses) 
summary(fit2)          

yp2 = fitted(fit2)
#RMSE
RMSE = function(yp, yi){
  sqrt(mean((yp - yi)^2))
}

(rmse2 = RMSE(yp=yp2, yi=houses$price))
fit2$df.residual

(rmse1 = RMSE(fitted(fit1), houses$price))
#rmse2 has lesser rmse

anova(fit1, fit2)
#fit2 is better
AIC(fit1, fit2)
#fit2 has lower AIC


RMSE <- function(error) { sqrt(mean(error^2)) }
RMSE(fit$residuals)
metrics::rmse(actual, predicted)



# Predict with id = 5309101200
newdata= houses[houses$id==5309101200,]
predict(fit1, newdata=newdata) - newdata$price
predict(fit2, newdata=newdata) - newdata$price

#predict2 has larger difference
plot(fit1)
plot(fit1)


#using trg and test
require(caTools)
set.seed(101) 
sample = sample.split(houses, SplitRatio = .75)
train = subset(houses, sample == TRUE)
test  = subset(houses, sample == FALSE)

#Do it with above datasets
