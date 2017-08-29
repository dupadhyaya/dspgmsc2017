# add margins

library(vcd)
Arthritis
head(Arthritis)
table(Arthritis$Treatment)
table(Arthritis$Treatment, Arthritis$Improved)
table(Treatment, Improved, data=Arthritis)  # error

mytable = xtabs( formula= ~Treatment + Improved, data=Arthritis)
?xtabs
mytable
addmargins(mytable)
addmargins(mytable,1) # column wise sum - in row
addmargins(mytable,2) # row wise sum - in col

margin.table(mytable,2)
margin.table(mytable,1)

prop.table(mytable,2)
col1 = c(29,13); col2=c(7,7) ; col3=c(7,21)
(p1= col1/sum(col1)); (p2=col2/sum(col2)) ; (p3=col3/sum(col3))

prop.table(mytable,1)
row1 = c(29,7,7) ; row2=c(13,7,21)
(p4=row1/sum(row1)); (p5=row2/sum(row2))

addmargins(prop.table(mytable,1),2)
addmargins(prop.table(mytable,1),1)
addmargins(prop.table(mytable,1))
