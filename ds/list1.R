# lists1

g ="My First List"
h = c(25, 26,18,39)
j = matrix(1:10,nrow=2)
k = c('one','two','three')
l = data.frame(formno = c(17010, 17045, 17012), 
      name=c('Achal', 'Apoorva', 'Goldie'), 
      gender=c('M','F','M'), stringsAsFactors = F)
g;h;j;k;l
mylist = list(g,h,j,k,h,l)
str(mylist)
mylist
mylist = list(title=g, ages=h, j, k, h,students=l)
mylist   # full list
mylist[2] # ages
mylist[[2]]  # ages  as a vector
mylist[['ages']]  # ages as a vector
mylist$ages   # ages as a vector
sum(mylist[[3]])  # Sum Matrix Values
str(mylist[3])
str(mylist[[3]])

sum(mylist[3])   # does not work because it is list
sum(mylist[[3]])  # works becos it is vector

mylist$students$name   # if students name not defd mylist[[5]]$name

mylist[[1]]
mylist[[3]]
mylist[[4]]
mylist[['students']]
mylist[2]
mylist[3]
mylist[4] 
mylist[5]
mylist
