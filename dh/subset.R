# Subset
#subset( ) function is the easiest way to select variables 
#and observations. In the following example, we select all rows that have a value of age greater than or equal to 20 or age less then 10.
# We keep the ID and Weight columns.

# using subset function 
newdata <- subset(mydata, age >= 20 | age < 10, 
                  select=c(ID, Weight))
#we select all men over the age of 25 and 
#we keep variables weight through income (weight, income and all columns between them).
# using subset function (part 2)
newdata <- subset(mydata, sex=="m" & age > 25,
                  select=weight:income)

subset(airquality, select = Ozone:Wind)
subset(airquality, Temp > 80, select = c(Ozone, Temp))
subset(airquality, Temp > 80, select = - Temp)

subset(airquality, Month == 8 & Temp > 90) # better
airquality[airquality$Month == 8 & airquality$Temp > 90, ]



newdata = subset(mydata, is.na(age))