# Question-3
factorA = c('High', 'High', 'Low','Low')
factorB1 = c(15, 11, 27, 29)
factorB2 = c(10, 12, 15, 17)
factorB3 = c(22, 17, 31, 49)
df2 = data.frame(motivation=factor(factorA), self=factorB1, cr=factorB2, pc=factorB3)
df2
(df2b = reshape2::melt(df2, id.vars='motivation'))
names(df2b)

motivation.aov1 <- aov(value ~ motivation + variable, data = df2b)
summary(motivation.aov1)

motivation.aov2 <- aov(value ~ motivation * variable, data = df2b)
summary(motivation.aov2)

#546.8/31.4; 265.8/31.4
interaction.plot(df2b$motivation, df2b$variable,df2b$value, type="b", col=c(1:3), 
                 leg.bty="o", leg.bg="beige", lwd=2, pch=c(18,24,22),	
                 xlab="Motivation Level", 
                 ylab="Methods of Teaching", 
                 main="Interaction Plot")

anova(motivation.aov2)
#interaction.plot(factorA, factorB, Response)


(fit2 = lm(value ~ motivation + variable, data=df2b))
summary(fit2)

qqnorm(fit2$res)
plot(fit2$fitted,fit2$res,xlab="Fitted",ylab="Residuals")
