# Arrays
# 2 states ; Each State has 3 districts : Each District has 4 cities
company = c('coy1', 'coy2')
department = c('dept1','dept2', 'dept3')
salesman = c('salesman1', 'salesman2', 'salesman3', 'salesman4')
set.seed(1234)
sales  = ceiling(runif(2*3*4,50,100))
cat(sales)
sales; length(sales)
salesarray = array(sales, c(4,3,2) , dimnames = list(salesman,department,company))
salesarray
colnames(salesarray)
rownames(salesarray)

dimnames(salesarray)
length(salesarray)
nrow(salesarray)
ncol(salesarray)
dim(salesarray)
class(salesarray)

salesarray[3,2,1]
salesarray[1,1,1] # salesman1, dept1, coy1, 
salesarray[1,,] # salesman1 of all dept & copy
salesarray[,,1] # coy1

apply(salesarray, c(1), sum)  # salesman wise
apply(salesarray, c(2), sum)  # deptwise
apply(salesarray, c(3), sum) # coywise
apply(salesarray, c(2,3), sum) # all salesman - dept & coywise
apply(salesarray, c(1,2,3), length) # coywise = numbers

