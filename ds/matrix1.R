# Matrix

# Matrices
# 2 D arrray where each element as same datatype
y = matrix(1:20,nrow=5,ncol=4)
y
col(y)
ave(y)
cells = c(1,26,24,68)
ave(cells)
rnames = c('R1','R2')
cnames = c('C1','C2')
# filled by coln first
mymatrix = matrix(cells,nrow=2,ncol=2,byrow=F,dimnames=list(rnames,cnames))
mymatrix
# filled by row first
mymatrix = matrix(cells,nrow=2,ncol=2,byrow=T,dimnames=list(rnames,cnames))
mymatrix
