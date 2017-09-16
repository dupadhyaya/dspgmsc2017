#Chapter - 8 : Regression ------------------------------------------


x<-rchisq(100, df=2)
x
qqPlot(x)
qqPlot(x, dist="chisq", df=2)

qqPlot(lm(prestige ~ income + education + type, data=Duncan), 
       envelope=.99)
states['Nevada', ]
fitted(fit)['Nevada']
residuals(fit)['Nevada']
rstudent(fit)['Nevada']

#8.3.2
library(car)
data(state.x77)
states = as.data.frame( state.x77[ , c('Murder', 'Population',
          'Illiteracy', 'Income', 'Frost')])
fit = lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)

qqPlot(fit, labels=row.names(states),  id.method='identity',
       simulate=T, main='Q-Q Plot')
?qqplot
