# Reeta Tomar
# Regression 
mls = read.csv(file='./data/mls2.csv')
mls
#names(mls) = c('PL','IE','IH')
model = lm(PL ~ IE + IH, data=mls)
summary(model)
plot(model)
model
