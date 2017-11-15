# Repeated Measures Anova
data(CO2)
head(CO2,n=10)
unique(CO2[c("Plant", "Type", "Treatment")])
CO2$conc = factor(CO2$conc)
w1b1 = subset(CO2, Treatment='chilled')
unique(w1b1[c("Plant", "Type")])
unique(w1b1$Plant)
unique(w1b1$Type)
head(w1b1)
names(w1b1)
summary(w1b1)
#"Plant"     "Type"      "Treatment" "conc"      "uptake"
fit = aov(uptake ~ conc * Type + Error(Plant/conc), data=w1b1 )
summary(fit)

with(w1b1, interaction.plot(conc, Type, uptake, type='b',
            col=c('red', 'blue'), pch=c(16,18)))

boxplot(uptake ~ Type * conc, data=w1b1, col=c('gold', ' green'),
        main='Chilled Quebec & Mississipi Plants', ylab='CO2 uptake rate ')

x








#Interactions----
#https://stackoverflow.com/questions/7790732/unique-for-more-than-one-variable

with(w1b1, interaction(Type, conc, drop=TRUE))   # gives labels
with(w1b1, Type:conc)                            # ditto

aggregate(numeric(nrow(w1b1)), w1b1[c("Type", "conc")], length)    # gives a data frame

library(data.table)
# set the key to all columns
w1b1table = as.data.table(w1b1)
setkey(w1b1table)
names(w1b1table)
# Get Unique lines in the data table
unique(w1b1table[list('Type','conc','Plant','conc'), allow.cartesian=T])


library(data.table)

#create data table
dt <- data.table(
  V1=LETTERS[c(1,1,1,1,2,3,3,5,7,1)],
  V2=LETTERS[c(2,3,4,2,1,4,4,6,7,2)],
  V3=c(1),
  V4=c(2) )
head(dt)
dt
# set the key to all columns
setkey(dt)

# Get Unique lines in the data table
unique(dt[list(V1, V2), allow.cartesian=TRUE]) 
unique(dt[list(V1, V2, V3, V4), allow.cartesian=TRUE]) 
unique(dt[list(V3,V4)])  # variables to factor

course = as.factor(c('btech', 'bsc', 'pg', 'msc'))
gender = as.factor(c('M', 'F'))
(x=interaction(course, gender, drop=F))
