# Ftable

mytable = xtabs(~ Treatment+ Sex + Improved, data=Arthritis)
# improved - matrix, sex-col, Treatment-row
mytable

margin.table(mytable)
margin.table(mytable,1)
margin.table(mytable,2)
margin.table(mytable,3)
margin.table(mytable,c(1,2))
margin.table(mytable,c(1,3))
margin.table(mytable,c(2,3))

ftable(prop.table(mytable,c(1,2)))
ftable(prop.table(mytable,c(1,2)),3)
round(ftable(prop.table(mytable,c(1,2)),3) * 100,2)
paste(round(ftable(prop.table(mytable,c(1,2)),3) * 100,2),'%',se=' ')
paste(round(ftable(prop.table(mytable,c(1,2)),3) * 100,2),'%',se=' ')
# align to right  ??
