# Two Way Anova
# 4 Suppliers, 2 Types of looms: Measure Strength
(loom = rep(c('Jetta','Turk'),each=5))
length(loom); length(sup1)
sup1 = c(20.5, 18.0, 19.0, 21.3, 13.2, 18.5, 24.0, 17.2, 19.9, 18.0)
sup2 = c(22.6, 24.6, 19.6, 23.8, 27.1, 26.3, 25.3, 24.0, 21.2, 24.5)
sup3 = c(27.7, 18.6, 20.8, 15.1, 17.7, 20.6, 25.2, 20.8, 24.7, 22.9)
sup4 = c(21.5, 20.0, 21.1, 23.9, 16.0, 25.4, 19.9, 22.6, 17.5, 20.4)
length(loom); length(sup2)
(df = data.frame(loom=factor(loom), sup1,sup2,sup3, sup4))
# determine strength on Jetta looms are as strong Turk looms
aggregate(df[-1], by=list(loom), mean)
(XM = mean(as.matrix(df[-1])))  # Total Means
(xm = colMeans(df[-1]))
xm[1]
(SST = sum((sup1 - XM)^2) + sum((sup2 - XM)^2) + sum((sup3 - XM)^2) + sum((sup4 - XM)^2) )

sum1=0
for (i in 1:5){
  sum1= sum((sup1[i] - XM)^2)
}


lapply(df[2:5], sum)
apply(df[2:5], 2, sum)
apply(df[,2:5], 2, function(x) sum(x))
apply(df[1:5,2:5], 2, function(x) sum((x-XM)^2))
apply(df[6:10,2:5], 2, function(x) sum((x-XM)^2))
df

names(df)
#stack approach: stack(df) does not work
(df1a = data.frame(df[1], stack(df[2:ncol(df)])))
#melt approach
(df1b = reshape2::melt(df, id.vars='loom'))
str(df1b)



# Freq Table
table(df1b$loom, df1b$variable )

#Plots
boxplot(value ~ loom, data=df1b)
boxplot(value ~ variable, data=df1b)
boxplot(value ~ loom + variable, data=df1b)

#Interaction Plot
interaction.plot(x.factor = df1b$variable, trace.factor = df1b$loom, 
                 response = df1b$value, fun = mean, 
                 type = "b", legend = TRUE, 
                 xlab = "Supplier", ylab="Strength",
                 pch=c(1,19), col = c("#00AFBB", "#E7B800"))

library(ggpubr)
ggpubr::ggline(df1b, x = "variable", y = "value", color = "loom",
               add = c("mean_se", "dotplot"),
               palette = c("#00AFBB", "#E7B800"))

#aov
parachute.aov1 <- aov(value ~ loom + variable, data = df1b)
summary(parachute.aov1)

parachute.aov2 <- aov(value ~ loom + variable + loom * variable, data = df1b)
summary(parachute.aov2)

parachute.aov2b <- aov(value ~ loom * variable, data = df1b)
summary(parachute.aov2b)


require("dplyr")
group_by(df1b, loom, variable) %>%
  summarise(
    count = n(),
    mean = mean(value, na.rm = TRUE),
    sd = sd(value, na.rm = TRUE)
  )

model.tables(parachute.aov2b, type="means", se = TRUE)

TukeyHSD(parachute.aov2b, which = "variable")
TukeyHSD(parachute.aov2b, which = "loom")


multcomp::glht(parachute.aov2b, linfct = mcp(variable = 'Tukey'))

summary(multcomp::glht(parachute.aov2b, linfct = mcp(df1b$loom = 'Tukey')))

#pairwise.t.test(df1b$loom, df1b$value, p.adjust.method = "BH")

# Assumptions
plot(parachute.aov2b, 1)
car::leveneTest(value ~ loom*variable, data = df1b)
plot(parachute.aov2b, 2)

# Extract the residuals
aov_residuals <- residuals(object = parachute.aov2b)
# Run Shapiro-Wilk test
shapiro.test(x = aov_residuals )


# Tests --------
#Test1---------
#Main Effect of A



#Test2---------
#Main Effect of B



#Test3---------
#Effect of A & B is 0



