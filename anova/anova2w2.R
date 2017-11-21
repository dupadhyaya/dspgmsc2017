# Question-2
factorA = c('High', 'High', 'Low','Low')
factorB1 = c(15, 11, 27, 29)
factorB2 = c(10, 12, 15, 17)
factorB3 = c(22, 17, 31, 49)
df2 = data.frame(motivation=factor(factorA), self=factorB1, cr=factorB2, pc=factorB3)
df2
(df2b = reshape2::melt(df2, id.vars='motivation'))



#Q3------
#Course Types 