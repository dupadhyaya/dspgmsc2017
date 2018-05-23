#Hitesh Case

data = read.csv(file.choose())
dim(data)     
length(unique(data$c))

str(data)           
df1 = data[1:5]

head(df1)
str(df1)
names(df1) = c('city','cityid', 'latitude', 'longitude', 'shipments')
head(df1)

df1[order(df1$cityid),]

library(dplyr)

df2 = df1[3:5]
head(df1) ; head(df2)
df2
#setup 300 collection centers for 1000 cities

dim(df2)

cluster1 = kmeans(df2, centers=300)
summary(cluster1)

cluster1$size
cluster1$cluster
cluster1$centers

#http://www.sthda.com/english/articles/29-cluster-validation-essentials/98-choosing-the-best-clustering-algorithms/
#https://cran.r-project.org/web/packages/clValid/clValid.pdf
#https://cran.r-project.org/web/packages/clValid/vignettes/clValid.pdf
#https://stackoverflow.com/questions/40771227/how-to-use-clv-and-clvalid-to-find-the-best-clustering-algorithm

library(clValid)
intern <- clValid(df2, nClust = 300, 
                  clMethods = clmethods, validation = "internal")
#it will say that there are large no of clusters.. still run it
# Summary
summary(intern)



#---- Another case
library(clValid)
# Iris data set:
# - Remove Species column and scale
df <- scale(iris[, -5])
# Compute clValid
clmethods <- c("hierarchical","kmeans","pam")
intern <- clValid(df, nClust = 2:6, 
                  clMethods = clmethods, validation = "internal")
# Summary
summary(intern)
