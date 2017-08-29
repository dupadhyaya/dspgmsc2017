#Chapter - 11 : Intermediate Graphs ------------------------------------------

# Scatter Plot
# 
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt), col='red', lwd=2, lty=1)  # best file line
lines(lowess(wt,mpg), col='blue', lwd=2, lty=2)  # smoothened line
# as wt increases mpg decreases

library(car)
scatterplot(mpg ~ wt | cyl, data=mtcars, lwd=2)
scatterplot(mpg ~ wt | cyl, data=mtcars, lwd=2
      , main='Scatter Plot of MPG vs Wt '
      , xlab='Weight of Car', ylab='Miles per Gallon'
      , legend.plot=T, id.method='identify'
      , labels=row.names(mtcars), boxplots='xy')
# points identified interactively by mouse clicks and labels displaye after esc key

# Simple Scatter Plot
pairs(~mpg + disp + drat + wt, data = mtcars, 
      main='Basic Scatter Plot Matrix')

scatterplotMatrix( ~ mpg + disp + drat + wt, data= mtcars,
          spread=F, lty.smooth=2)
# condition the plot on a factor
# include lineas & loess fit lines
# place box plots, densities or hist in principal diagonal
# add rug plots in margins of the cells
scatterplotMatrix( ~ mpg + disp + drat + wt, data= mtcars,
        diagonal='histogram', spread=F, lty.smooth=2)

cor(mtcars)
cor(mtcars[c('mpg','wt','disp','drat')])
str(mtcars)
library(gclus)
mydata = mtcars[c(1,3,5,6)]
mydata.corr = abs(cor(mydata))
mycolors = dmat.color(mydata.corr)
myorder = order.single(mydata.corr)
cpairs(mydata, myorder, panel.colors=mycolors, gap=1.5,
       main = 'Variables Ordered & Colored by Correlation')
#highest corr betw disp-wt and wt -mpg
#
#
#High Density Scatter -----------
set.seed(1234)
n = 1000
c1 = matrix(rnorm(n,mean=0, sd=.5), ncol=2)
c1
c2 = matrix(rnorm(n,mean=3, sd=2), ncol=2)
mydata = rbind(c1,c2)
mydata = as.data.frame(mydata)
names(mydata) = c('x','y')
mydata
with(mydata, plot(x,y,pch=19, 
                  main='Scatter Plot with 10,000 obsvn'))

with(mydata, smoothScatter(x,y, main='Scatterplot'))

library(hexbin)
with(mydata, {
  bin = hexbin(x,y,xbins=50)
  plot(bin, main='Hexagonal Binning with 10000 obsvn')
})

