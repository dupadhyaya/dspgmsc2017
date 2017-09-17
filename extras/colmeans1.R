

test=matrix(c(1:15),nrow=3,ncol=5)
colnames(test)=c("A","A","B","B","B")
test
#     A A B  B B
#[1,] 1 4 7 10 13
#[2,] 2 5 8 11 14
#[3,] 3 6 9 12 15

#calculate the average of each replicates, 
#output to be
#     A   B
#[1,] 2.5 10
#[2,] 3.5 11
#[3,] 4.5 12

rowMeans(test)
rowMeans(test[, colnames(test)=='A'])
rowMeans(test[, colnames(test)=='B'])

cn = colnames(test)
#sapply(unique(cn), function(g) rowMeans(test[,cn==g,drop=FALSE]))
sapply(unique(cn), function(g) rowMeans(test[,cn==g]))

# Another Method
t(test)
by(t(test), colnames(test), FUN=colMeans)
by(t(test), colnames(test))

?by




library(limma) # NA for 3.4.1
limma::avearrays(test)
#   A  B
#[1,] 2.5 10
#[2,] 3.5 11
#[3,] 4.5 12