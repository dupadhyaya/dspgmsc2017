#lapply & sapply
#Work on list

list1 = list(A = matrix(1:9,3), B=1:5, C=matrix(1:4,2), D = 4)
list1
lapply(list1, sum)

names=c('Achal','Apoorva','Lalit')
lapply(names, nchar)
# Vector is a form of list 
# lapply & sapply can take vector as input
#