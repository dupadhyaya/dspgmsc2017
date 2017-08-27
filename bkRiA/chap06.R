#Chapter - 6 : Basic Graphs ------------------------------------------
# Bar, Box, Dot Plots
# Pie and Fan Charts
# Histograms and Kernel Density Plots


# 6.1  Barplot
height = seq(4,7,.25)
barplot(height)
barplot(height, horiz = T)

library(vcd)
head(Arthritis)
str(Arthritis)
counts = table(Arthritis$Improved)
counts

# Listing 6.1 Simple Bar Plots
barplot(counts, main='Simple Bar Plot', xlab='Improvement', ylab=' Frequency')
barplot(counts, main='Simple Bar Plot', horiz = T, 
        xlab='Improvement', ylab=' Frequency')

# if cat variable is (ordered) FACTOR - vertical plot 
str(Arthritis)
plot(Arthritis$Treatment)
str(Arthritis$Improved)
plot(Arthritis$Improved)  # see the order of display
plot(Arthritis$Improved, horiz=T)

# 6.1.2  Stacked and Grouped bar Plots
# if height is a matrix instead of vector, we can create stacked or gp bar plot
height = matrix(1:20, nrow=5)
height
barplot(height)
barplot(height, horiz = T)
barplot(height, horiz = T, beside=T)

barplot(height, beside=T) # side by side
barplot(height, beside=T, legend.text = ' Heights')

#colnames(height) = c('C1','C2', 'C3', 'C4')
#rownames(height) = c('A','B','C','D','E')
#height
#barplot(height, beside=T, legend=rownames(height), legend.text = ' Heights')


library(vcd)
counts= table(Arthritis$Improved, Arthritis$Treatment)  # X tab
counts
barplot(counts)
barplot(counts, col=c('red', 'green', 'blue'))
length(counts)
barplot(counts, col=rainbow(counts))
barplot(counts, col=heat.colors(counts))
barplot(counts, col=topo.colors(counts))
barplot(counts, col=cm.colors(counts))

barplot(counts, col=c('red', 'green', 'blue'), legend=rownames(counts))

barplot(counts, beside=T)
barplot(counts, beside=T, col=c('red', 'green', 'blue')
        , legend=rownames(counts))
barplot(counts, beside=T, col=c('red', 'green', 'blue')
        , legend=rownames(counts))

#--------
temp <- c(5,7,6,4,8)

barplot(temp, main="By default")
barplot(temp, col="coral", main="With coloring")
barplot(temp, col="#c00000", main="#c00000")
barplot(temp, col=c("#FF0099","#CCFF00","#33FF00",
                    "#00FF66","#FF9900"), main="With 5 colors")
barplot(temp, col=rainbow(5), main="rainbow")
barplot(temp, col=heat.colors(5), main="heat.colors")
barplot(temp, col=terrain.colors(5), main="terrain.colors")
barplot(temp, col=topo.colors(5), main="topo.colors")

# 6.1.3 Mean Bar Plots
# Bar plots need not be based on counts or freq
# They can be based on medians, SD, other aggregate functions
str(state.region) ; state.region  # 50 riws - row no like state.x77
str(state.x77) ; state.x77 # 50 rows
head(state.region) ; head(state.x77)
states = data.frame(state.region, state.x77)   # join by ID (State name)
head(states,n=2)
means = aggregate( states$Illiteracy, by=list(states$state.region), FUN=mean )
means
means = means[order(means$x),]
means
barplot(means$x, names.arg = means$Group.1 )
title(' Mean Illiteracy Rate')


# Tweaking Bar Plot -----------
# bar labels overlap, font size (cex.names), label bars with names.arg
par('mar')  # read current margin values
par(mar=c(6,8,4,6))   # set margins default 5.1 4.1 4.1 2.1
par(las=2)  # rotated bar lables
counts = table(Arthritis$Improved)
barplot(counts, main='Treatment Outcome', horiz=T)  # see labels rotated
barplot(counts, main='Treatment Outcome', horiz=T, cex.names=0.8,
        names.arg=c('No Improvement', 'Some \n Improvement', 'Marked\n Improvement')
        , space=.5)
par(las=0)  # rotated bar lables

?barplot
barplot(height, width = 1, space = NULL,
        names.arg = NULL, legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL, ...)

# Spinographs
# Stacked bar plot - rescaled - height of each bar is 1
# segment heights represent proportions spine() in vcd package
library(vcd)
counts = table(Arthritis$Treatment, Arthritis$Improved)
spine(counts, main='Spinograph Example')



# 6.2 Pie Charts -----------
pie(x, labels)
# simple, %, 3D, Sample Size
#par(mfrow=c(2,2))
par(mfrow=c(1,1))

slices = c(10,12,4,16,8)
lbls = c('US', 'UK', 'Australia', 'Germany', 'France')
pie(x=slices, labels=lbls)

pct = round(slices/sum(slices) * 100)
lbls2 = paste(lbls, ' ', pct,'%', sep="")
lbls2
pie(x=slices, labels=lbls2, col=rainbow(length(lbls2))
    , main=' Pie Chart with Rainbow Colors')

# 3D - plotrix
library(plotrix)
pie3D(x=slices, labels=lbls2, explode=0.1, main='3D Pie Plot')
?pie3D
pie3D(x,edges=NA,radius=1,height=0.1,theta=pi/6,start=0,border=par("fg"),
      col=NULL,labels=NULL,labelpos=NULL,labelcol=par("fg"),labelcex=1.5,
      sector.order=NULL,explode=0,shade=0.8,mar=c(4,4,4,4),pty="s",...)
pie3D(x=slices, labels=lbls2, radius=2, height=0.1, labelcex=.9, 
      explode=0.1, main='3D Pie Plot')

mytable = table(state.region)
mytable
lbls3 = paste(names(mytable),"\n", mytable, sep='')
lbls3
pie(mytable, labels=lbls3, main='Pie Chart from Table \n with sample sizes')

# Fan Plot ---------------------
library(plotrix)
slices = c(10,12,4,16,8)
lbls = c('US', 'UK', 'Australia', 'Germany', 'France')
fan.plot(x=slices, labels=lbls, main=' Fan Plot')
?fan.plot
fan.plot(x,edges=200,radius=1,col=NULL,align.at=NULL,max.span=NULL,
         labels=NULL,labelpos=NULL,label.radius=1.2,align="left",shrink=0.02,
         main="",ticks=NULL,include.sumx=FALSE,...)

fan.plot(x=slices, labels=lbls, col=terrain.colors(length(slices)), 
         ,label.radius=.75, ticks=3,main=' Fan Plot')

# 6.3 Histograms ---------
hist(x)
hist(x, freq=F) # plot based on densities, breaks - controls no of bins

mtcars$mpg
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=12)  # 12 bars
hist(mtcars$mpg, breaks=12, col=rainbow(mtcars$mpg)
     , xlab='Miles per Gallon', main = 'Colored Histogram')
# Rug and density : Density -smoother descp of distribution of scores
# rug - 1dim rep of actual data values (x points)
hist(mtcars$mpg, freq=F, breaks=12, col='red', main='Histogram with Rug & Density Plot')
rug(jitter(mtcars$mpg)) # lines above x axis
rug(jitter(mtcars$mpg), col='purple') # points +/- for overlapping value
?rug
rug(x, ticksize = 0.03, side = 1, lwd = 0.5, col = par("fg"),
    quiet = getOption("warn") < 0, ...)

lines(density(mtcars$mpg), col='blue', lwd=2)

# Normal Curve
x = mtcars$mpg
h = hist(x, breaks=12, col='green')
h
xfit = seq(min(x), max(x), length(40))  # seq nos for related x values
xfit
yfit = dnorm(xfit, mean=mean(x), sd=sd(x))
yfit 
yfit = yfit * diff((h$mids[1:2]) * length(x)) # h$mids - mid point
lines(xfit, yfit, col='blue', lwd=2)
box()   # box around the plot


# 6.4  Kernel Density Plots ---------------
plot(density(x))

d = density(mtcars$mpg)
d
plot(d)
plot(d, main=' Kernel Density of MPG')
polygon(d, col='red', border='blue')   # color the polygon shape
rug(mtcars$mpg, col='brown', side=1)
rug(mtcars$mpg, col='blue', side=3, lwd=3)
abline(v=mtcars$mpg)
?rug


# Superimpose Density Plots = sm:sm.density
library(sm)
sm.density.compare(x, factor)  # factor - grouping var
attach(mtcars)
cyl.f = factor(cyl, levels=c(4,6,8),
               labels=c('4 cyl', '6 Cyl', '8 Cyl'))
sm.density.compare(mpg, cyl, xlab='Miles per Gallon')
title(main='MPG Dist vs Car Cylinders')
colfill = c(2:(1+length(levels(cyl.f))))
legend('topright', levels(cyl.f), fill=colfill)
rug(mtcars$mpg, col='blue', side=3, lwd=3)
rug(mtcars$mpg, col='brown', side=1)


# 6.5 Box Plot -------------------
# Distri of cont var by plotting 5 no sum - min, max, Q1,A3, Median,
# Know outliers, values outside range of 1.5 * IQR- depicted as dots
boxplot(mtcars$mpg, main='Box Plot', ylab=' Miles per Gallon')
fivenum(mtcars$mpg)
lbl5no = c('min', 'IQR', 'Median', '3IQR', 'max')
abline(h=fivenum(mtcars$mpg))
text(x=.7,y=fivenum(mtcars$mpg)+.2, labels=paste(lbl5no), col='green')
text(x=1.5,y=fivenum(mtcars$mpg)+.2, labels=fivenum(mtcars$mpg))

# Example from Net

plot.new()
data    <- c(0.4, 0.7, 0.75, 0.82, 0.9)
endaxis <- c(0, 1)  # endpoints of axis
datamm  <- c(min(data), max(data))
boxplot(data, horizontal = T, range = 0, ylim = endaxis,
        axes = F, col = "grey", add = F)
arrows(endaxis, 1,  datamm, 1,  code = 1, angle = 90, length = 0.1)
valuelabels <- c(endaxis[1], round(fivenum(data)[2], digits = 2) ,
                 round(fivenum(data)[4], digits = 2), endaxis[2]  ) 
text(x = valuelabels, y = c(1.05, 1.25, 1.25, 1.05), labels = valuelabels)

# 6.5.1  Parallel Box Plots to compare groups
boxplot(formula, data= dataframe)
# formula y ~ A , y ~ A * B (each combination of A & B)
# varwidth = T : box plot widths proportional to square root of their sample size
# horz=T to reverse axis
head(mtcars[,c('mpg', 'cyl')])
boxplot( mpg ~ cyl, data= mtcars )
boxplot( mpg ~ cyl, data= mtcars, main= ' Car Mileage Data'
         , xlab='No of Cyl', ylab='Miles per Gallon', col=rainbow(3))
plot.new()
boxplot( mpg ~ cyl, data= mtcars, main= ' Car Mileage Data',
         xlab='No of Cyl', ylab='Miles per Gallon', 
         varwidth=TRUE, 
         notch= TRUE, # next line
         col='red')

# Listing 6.9 Box Plot for 2 crossed Factors
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4","6","8")) 
#Create factor for # of cylinders
mtcars$am.f <- factor(mtcars$am,
                      levels=c(0,1),
                      labels=c("auto", "standard")) 
#Create factor for transmission type
boxplot(mpg ~ am.f *cyl.f,
        data=mtcars,
        varwidth=TRUE,
        col=c("gold","darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type")


# Violin Plots: vioplot package
library(vioplot)
vioplot(x1, x2,....,  names=, col=)
# names - char vector of labels for violon plots

x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3,
        names=c("4 cyl", "6 cyl", "8 cyl"),
        col="gold")
title("Violin Plots of Miles Per Gallon")

# outer shape represents kernel density plots
# white dot - median, black box- IQR, Thin black lines- whiskers


# 6.6 Dot Plots ---------------
dotchart(x, labels=)

dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7,
         main="Gas Mileage for Car Models" 
         , pch = 23, gpch = 15, bg = par("bg"), color = 'blue', gcolor = 'green', lcolor = "red"
         , xlab="Miles Per Gallon")
?dotchart


# Dot Plot
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")
