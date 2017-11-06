# Logistic Regression

# Contingency Table for Tx of Cars
data(mtcars)
?mtcars
(t= table(mtcars$am))
(amt = addmargins(t))
(ppt = prop.table(t))
p1 = 19/32   #automatic Probability
# Prob that am=Manual
(p0a = 1 - 19/32 )
# Odds Ratio
(p1 = 19/13 )
(p2 = 13/19 )

#glm
attach(mtcars)
base = glm(am ~ 1, data=mtcars, family = binomial())
base
