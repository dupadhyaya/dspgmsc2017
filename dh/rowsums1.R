# Row and Column Sums / Means

?rowsum
#rowsum - Colsum - M/ F based on gp variable
rowsum(x=mtcars, group=mtcars$cyl, reorder = T)

rowsum(x=mtcars, group=mtcars$hp, reorder = T)
# cyl - 4,6,8 ; cyl - sum 

?colsum  # NA

colSums()

colMeans()

rowMeans()

rowSums()

rownames(x, do.NULL = TRUE, prefix = "row")
rownames(x) <- value

row.names()

colnames(x) <- value
?colnames(mtcars,do.NULL = T, prefix='col')
colnames(mtcars)
x = mtcars



m0 <- matrix(NA, 4, 0)
rownames(m0)

m2 <- cbind(1, 1:4)
colnames(m2) = colnames(m2, do.NULL = FALSE, prefix='col')
colnames(m2)

colnames(m2) = NULL
colnames(m2)
# do.NULL - if F & names are empty, names are created
# if T, names are not empty, names are not created
colnames(m2) = colnames(m2, do.NULL = FALSE, prefix='sub')
colnames(m2)
m2
(m2 = cbind(m2, 1:4))
is.na(colnames(m2))
colnames(m2)[3] = NULL

colnames(m2)
colnames(m2) = colnames(m2, do.NULL = TRUE, prefix='subject')
colnames(m2)


colnames(m2) <- c("x","Y")
colnames(m2)

rownames(m2)
rownames(m2) <- rownames(m2, do.NULL = FALSE, prefix = "Obs.")
m2

?setNames
x= setNames(data.frame(matrix(ncol = 3, nrow = 0)), 
         c("name", "age", "gender"))
str(x)

