# Pricipal Components Analysis
# entering raw data and extracting PCs 
# from the correlation matrix 
fit = princomp(dataset,cor=TRUE)

fit = princomp(na.omit(dataset), cor = TRUE)

fit = princomp(formula = ~., data = dataset, cor = TRUE, na.action=na.exclude)

fit= princomp(~ ., data = dataset, cor = TRUE)
fix(dataset)
fit <- princomp(mydata, cor=TRUE)
summary(fit) # print variance accounted for 
loadings(fit) # pc loadings 
plot(fit,type="lines") # scree plot 
fit$scores # the principal components
biplot(fit)