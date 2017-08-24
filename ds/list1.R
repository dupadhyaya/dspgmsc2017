# lists1

g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
l = data.frame(formno = c(17010, 17045, 17012), 
      name=c('Achal', 'Apoorva', 'Goldie'), 
      gender=c('M','F','M'), stringsAsFactors = F)
g;h;j;k;l
mylist = list(title=g, ages=h, j, h,students=l)
mylist   # full list
mylist[2] # ages
mylist[[2]]  # ages  as a vector
mylist[['ages']]  # ages as a vector
mylist$ages   # ages as a vector
sum(mylist[[3]])  # Sum Matrix Values
mylist$students$name
mylist[[1]]
mylist[[3]]
mylist[[4]]
mylist[['students']]
mylist[2]
mylist[3]
mylist[4] 
mylist[5]
myllst
