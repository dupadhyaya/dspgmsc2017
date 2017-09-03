#Repeat  rep

rep(x, ...)

rep.int(x, times)

rep_len(x, length.out)

x = 10
rep(x)
rep(x,2)
rep(x, length.out=3)

?rep
rep(x, times=1, length.out=NA, each=1)
x = c(1,2,5)
rep(x)
rep(x,2)
rep(x, length.out=4)  # recycle

# on DF , not meaningful
x = mtcars[1:5]
x
rep(x)
rep(x,2)
rep(x, length.out=4)  # recycle



(examunit = rep(c(1,2,3,4), times=4))
(examunit = rep(c(1,2,3,4), each=4))
