#mapply
# to each element of multiple lists
list1 = list(A = matrix(1:16, 4), B=matrix(1:16,2), C=1:5)
list1
list2 = list(A = matrix(1:16, 4), B=matrix(1:16,2), C=15:1)
list2
#compare 2 lists
?identical
mapply(identical, list1, list2)
