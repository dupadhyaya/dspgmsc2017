#apply2
#used o matrix - same datatype
#
m1 = matrix(1:9, nrow=3)
# sum all rows
apply(m1, 1, sum)
#sum all columns
apply(m1, 2, sum)

# Alternate
rowSums(m1)
colSums(m1)
sum(m1)

rowSums(m1, na.rm=TRUE)
