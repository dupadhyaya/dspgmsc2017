# Factors2
directions = c(rep("North",3), rep("South"), 'East', 'West')
directions
directions2 = factor(directions, levels= c("North", "East",
                             "South", "West"), labels=c("N", "E", "S", "W"))
directions2


#birthmonth = vector(mode = 'character', length=0)
birthmonth1 = c('Jan','Jun','Apr', 'Mar','Dec', 'Jan')
birthmonth1a = factor(birthmonth1)
birthmonth1a
birthmonth1b = factor(birthmonth1, levels=month.abb[1:12], ordered=T)
birthmonth1b

birthmonth1c = factor(birthmonth1, labels =c('Jun', 'Mar', 'Jan', 'Apr'))
birthmonth1c = factor(birthmonth1, labels =c('Jun', 'Mar', 'Jan', 'Apr','Dec'))

birthmonth1c  # order by label order

# Month as Number
birthmonth2 = c(1,4, 6, 12, 3,1)
month.abb[birthmonth2]
birthmonth2a = factor(birthmonth2)
birthmonth2a # number ordering
birthmonth2a[7] = 10  # cannot add, not in list as factor
birthmonth2a
birthmonth2a[7] = 1

# create more levels intially only: all possible values
birthmonth2b = factor(birthmonth2, levels=1:12, labels=month.abb[1:12])
birthmonth2b
birthmonth2b[7] = 'Nov'  # can add
birthmonth2b
birthmonth2b[8] = 7  # cannot add
birthmonth2b

birthmonth2b[8] = 'Sep'
birthmonth2b

