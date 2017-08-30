# names
# rownames colnames names dim 

# DF
str(mtcars)
names(mtcars)
dim(mtcars)
rownames(mtcars)
colnames(mtcars)
colnames(mtcars)[1:2]

colnames(mtcars)[1]='cylinder'
names(mtcars)


# Matrix
marks = ceiling(runif(24,5,10))
m1 = matrix(marks, nrow=6)
m1
str(m1)
class(m1)
names(m1)  # row
rownames(m1)
colnames(m1)
colnames(m1) = c('C1','C2','C3','C4')
rownames(m1) = paste('R',1:6,sep='')
rownames(m1)
row.names(m1)  # same
colnames(m1)

m1
names(m1)  # nothing
m1$C1  # invalid as matrix is atomic in nature
dimnames(m1)  # this works tells Rows & Cols

dimnames(m1) = NULL
dimnames(m1)
