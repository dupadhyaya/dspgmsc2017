#Chapter - 3 : Getting Started with Graphs ------------------------------------------
# Creating and Saving Graphs
# Customising symbols, lines, colors & axes
# Annotating with text and titles
# Controlling a graphs dimensions
# Combining multiple graphs into one
# --- Graphs help in detecting relationship & patterns visually

#3.1 Working with Graphs
# Attach mtcars dataset, plot wt vs mpg; draw abline and give title to graph; detach mtcar

attach(mtcars)
help(mtcars)
str(mtcars)
#[, 1]	 mpg	 Miles/(US) gallon  ; [, 6]	 wt	 Weight (1000 lbs)
head(mtcars[,c(1,6)])

plot(wt,mpg)  # scatter Plot

abline(lm(mpg~wt))  # line of best fit

title("Regression of MPG on Weight")
detach(mtcars)

# Saving a Graph -----------
pdf('mygraph.pdf')
plot(mtcars$wt, mtcars$mpg)
abline(lm(mtcars$wt, mtcars$mpg))
title("Regression of MPG on Weight")
dev.off()
# other method saving Plot - Export - Save as Image / Pdf : Copy to Clipboard
# creating new graph by issuing plot(), hist(), boxplot() will overwrite previous
#dev.prev() dev.next() to view

#Table 3.1  : Patient Response to drugs
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type='b')   # x on plots and joins them b - lines & points

help(plot)

# 3.3 Graphical Parameters
# customise font,s colors, axes, titles 
# specify through par() function - values stay till end of R session or next change
#par(optionname=value, ....)
#par()  - list of current graphical settings
par()
par(no.readonly = T)  # list of options  can be changed
# plotting symbol triangle, dashed line
opar= par(no.readonly=T)  # copy of current settings
par(lty=2, pch=17)
plot(dose, drugA, type='b')
par(opar)  # change to earlier settings
# rewrite as
par(lty=2)
par(pch=17)

# Another way with plot command
plot(dose, drugA, type='b', lty=3, pch=18,cex=1.5)

# 3.3.1  Symbols & Lines -----------------
# pch - plotting sysbol
# cex - symbol size, 1.5 - 50% larger
# lty - line type
# lwd - line width : lwd=2 twice

# 3.3.2  = Colors
# col  - default plotting color col=c('red','blue','green') for 3 lines respectively
# col.axis
# col.lab    # axis labels
# col.main   # main title
# col.sub   # subtitles
#fg  # Foreground Color
#bg  # Background color
# White Colors : col=1, col='white', col='#FFFFFF', col=rgp(1,1,1), col =hsv(0,0,1) [ hue saturation]
# Vectors of colors - rainbow(), heat.colors(), terrain.colors(), topo.colors(), cm.colors(), gray(), gray(0:10/10)

n = 10
mycolors = rainbow(n)
pie(rep(1,n), labels=mycolors, col=mycolors)

mygrays = gray(0:n/n)
pie(rep(1,n), labels=mygrays, col=mygrays)

# 3.3.3 Text Characteristics
# specify text size, font, style
#cex, cex.axis, cex.lab , cex.main, cex.sub

# all graphs drawn after this statement will have same properties
opar = par(no.readonly = T)
par(font.lab=3, cex.lab=1.5, font.main=4, cex.main=2)

# font : 1 - plain, 2- bold, 3-italic, 4-bold italic, 5 - symbol 
# font.axis - axis text
# font.lab - font for data labels
# font.main - font for titles
# font.sub  - font for subtitles
# ps - point size 1/72 inch  ps = ps*cex
# family = serif, sans, mono  ( device dependent)
names(pdfFonts())  # check which fonts are available for output in pdf
pdf(file='myplot.pdf', family='fontname')

# 3.3.4  Graphs and margin dim
# pin - plot dimensions (width, height ) in inches
# mai - margin size - c(bottom, left, top, right) in inches
# mar - margin size - c(4,4,3,2) in inch respectively
par(pin=c(4,3), mai=c(1,5,1,.3))

#List 3.1
dose ; drugA ; drugB
opar = par(no.readonly = T)
par(pin=c(2,3))
par(lwd=2, cex=1.5)
par(cex.axis=.75, font.axis=3)
plot(dose, drugA, type='b', pch=19, lty=2, col='red')
par(pin=c(5,3))
plot(dose, drugB, type='b', pch=23, lty=6, col='blue', bg='green')
par(opar)
plot.new()

# 3.4 Adding Text, customised axes and legends ---------------- 

plot(dose, drugA, type="b",
     col="red", lty=2, pch=2, lwd=2,
     main="Clinical Trials for Drug A",
     sub="This is hypothetical data",
     xlab="Dosage", ylab="Drug Response",
     xlim=c(0, 60), ylim=c(0, 70))

# some high level graphs include default titles & lables
# remove them by adding ann=F in plot or sperate par()

# 3.4.1

title(main="main title", sub="sub-title",
      xlab="x-axis label", ylab="y-axis label")
plot(1, ann = F)
plot(1, ann = T)

title(main="My Title", col.main="red",
      sub="My Sub-title", col.sub="blue",
      xlab="My X label", ylab="My Y label",
      col.lab="green", cex.lab=0.75)

# 3.4.2 Axis --------------------
axis(side, at=, labels=, pos=, lty=, col=, las=, tck=, ...)
# when plotting customised axis suppress default axis plotting 
# axes=F, : xaxt='n'  , yaxt='n' frame will be drawn
plot(1, ann = F)
plot(1, axes=F, ann=F)
plot(1, xaxt='n', ann=F)
plot(1, yaxt='n', ann=F)

# Axis Options
#side : integer indicating side of graph 1-bottom, 2-left, 3-top, 4-right
#at   : location of tick marks
# labels : character vector of labels to be place at tick marks, if NULL, at values are used
#pos coordinates at which the axis line is to be drawn: value on other axis where it crosses
# lty : line type
# col - line & tick mark color
# las - lables parallel (0) or Perpendicular(2) to axis
# tck - length of tick mark : 0- suppress, 1 - gridline, default-0.01
#(...)

# Listing 3.2
x = c(1:10)
y = x
z = 10/x

opar = par(no.readonly = T)
par(mar=c(5,4,4,8) + 0.1)
plot(x,y)
plot(x,y, type='b')
plot(x,y, type='b', pch=21, col='red')
plot(x,y, type='b', pch=21, col='red', yaxt='n', lty=3, ann=T)
plot(x,y, type='b', pch=21, col='red', yaxt='n', lty=3, ann=F)

# Lines
lines(x,z, type='b', pch=22, col='blue', lty=2)
#axis
axis(2, at=x, labels=x, col.axis='red', las=0)
axis(4, at=z, labels=round(z, digits=2),
     col.axis='blue', las=2, cex.axis=0.7, tck=-0.01)
mtext('Axis y=1/x', side=4, line=3, cex.lab=1, las=2, col='blue')
title(' An Eg of Creative Axes', xlab='X Values', ylab='Y=X Values', sub='Sub Title')
par(opar)

# Minor Ticks-------------
# Ticks are dashed point
library(Hmisc)
minor.tick(nx=n, ny=n, tick.ratio=n)
#nx & ny specify no of intervals in which to divide area betw major tick marks on x & y axis
# tick.ratio - size of minor tick relative to major ticks
# par('tck') will return current size
par('tck')
minor.tick(nx=2, ny=4, tick.ratio=0.5)

# 3.4.3 Reference Lines ----------
abline(h=yvalues, v=xvalues)
# solid line at y=1,5,7
abline(v=seq(1,10,2), lty=2, col='blue')

# 3.4.4 Legend -----------------------------------
# more than 1 set of data or group incorporated in the graph
# legend helps in identifying whats being rep by each bar, pie, slice, line
legend(location, title, legend, ....)
# location - locator(1), bottomleft, left, topleft, top, topright, right, 
# bottomright, center : inset to specify amount to move into the graph
# title - character to describe
# legend - vector with labels
# ... colored lines - col=c(...)
#     points  - pch=c( ...)
#     lines with width and size : lwd, lty vectors
# colored boxes : fill= vector of colors
# Other options
# bty - box type ; bg- background color, cex - size, text.col - text color
# horiz=T  - legend horizontal 
# 
# Listing 3.3 Pg 61
par(opar)
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly=TRUE)
par(lwd=2, cex=1, font.lab=1)
plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")
lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")
abline(h=c(30), lwd=1.5, lty=2, col="gray")

library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)
#legend('topright', title='Drug Type', pch=c(15,17),c('A','B'))
legend("center", inset=.05, title="Drug Type", c("A","B"),
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))
par(opar)

# 3.4.5 Text Annotations
text(location, 'text to place', pos, ...) # text within the graph
mtext('text to place', side, line=n)  # text in the one of the margins
# pos = 1-below, 2-left, 3-above, 4-right; offset in % of character width
# can also use locator(1)
# side = 1-below, 2-left, 3-above, 4-right; 
# line= line in the margin, 0 onwards outwards
# adj=0 for left/ bottom alignment; adj=1 for top/right alignment
#others also avl - cex, col, font

attach(mtcars)
plot(wt, mpg, 
     main='Mileage vs Car Weight',
     xlab='Weight', ylab='Mileage',
     pch=18, col='blue')
text(wt, mpg, 
     row.names(mtcars), cex=0.6, pos=4, col='red')
detach(mtcars)

# display font families
opar = par(no.readonly = T)
par(cex=1.2)
plot(1:7,1:7, type='n')  # don't plot points
text(3,3, 'Example of default text')
text(4,4, family='mono','Example of mono text')
text(5,5, family='serif','Example of sanserif text')
par(opar)

# Math Annotations
help(plotmath)
demo(plotmath)
plot(1,1,xlab=expression(x %+-%y), ylab=expression(sqrt(x)))


# 3.5 Combining Graphs
# par and layout
par(mfrow=c(nrows, ncols))  # matrix of nrows x ncols
par(mfcol=c(nrows, ncols))  # matrix of nrows x ncols

attach(mtcars)
opar = par(no.readonly = T)
par(mfrow=c(2,2))
plot(wt,mpg, main='Scatterplot of wt vs mpg')
plot(wt,disp, main='Scatterplot of wt vs disp')
hist(wt, main=' Histogram of Wt')
boxplot(wt, main='Box Plot of Wt')
par(opar)
detach(mtcars)

# Second example of 3 plots in 3 rows & 1 column
attach(mtcars)
opar = par(no.readonly = T)
par(mfrow=c(3,1), mar=c(1,1,1,1))
hist(wt)
hist(disp, main='')  # suppress title
hist(mpg, ann=F)  # without title
par(opar)
detach(mtcars)


# Layout function 
attach(mtcars)
?layout # complex arrangement of plots
layout(mat, widths = rep.int(1, ncol(mat)),
       heights = rep.int(1, nrow(mat)), respect = FALSE)
layout.show(n = 1)  # no of figures to plot
layout.show(n = 3)  # no of figures to plot
hist(wt)
hist(disp)
hist(mpg)

layout(matrix(c(1,1,2,3), 2, 2, byrow=T))
hist(wt)
hist(disp)
hist(mpg)

lcm(2)  # absolute width in cm
hist(wt)
hist(disp)
hist(mpg)


# 1 fig in row1, 2 figs in row2, Fig1 - 1/3 of height of figures in row2
# fig in bottom right is 1/4 of width in bottom cell..

attach(mtcars)
m=matrix(c(1,1,2,3), 2,2)
m
layout(m)
hist(wt)
hist(disp)
hist(mpg)
#--------
layout(m,widths=c(3,1), heights=c(1,2))
hist(wt)
hist(disp)
hist(mpg)


# another example of Layout
m <- matrix(c(1, 0, 1,  3, 2, 3, 2, 0), nrow = 2, ncol = 4)
m
##set up the plot
layout(m)
## now put out the 3 plots to each layout "panel"
plot(1:10, main = "plot1")
plot(10:1, main = "plot2")
plot(rnorm(10), main = "plot3")
layout.show(1)
layout.show(2)
layout.show(3)
layout.show(4)

# 3.5.1  Creating Figure arrangement with fine control
# 2 box plot added to scatter plot to create single enhance graph
opar = par(no.readonly = T)
# full graph area (0,0) to (1,1) ( x1,x2,y1,y2)
par(fig=c(0,0.8,0,0.8)) # graphical parameter

# scatter plot from to 0.8 on x axis and 0.55 to 1 on y axis
plot(mtcars$wt, mtcars$mpg, xlab='Miles per Gallon',
     ylab='Weight in Pounds')

par(fig=c(0,0.8,0.55,1), new=TRUE)  # top
boxplot(mtcars$wt, horizontal = TRUE, axes=FALSE)

par(fig=c(0.65,1,0,0.8), new=TRUE)  # right
boxplot(mtcars$mpg, horizontal = FALSE, axes=FALSE)
mtext(' Enhanced Scatterplot', side=3, outer=T, line=-3)
par(opar)


#?par(fig)
#A numerical vector of the form c(x1, x2, y1, y2) which gives the
#(NDC) coordinates of the figure region in the display region
#of the device. you start a new plot, so to add to an existing plot use new = TRUE as well.

# http://seananderson.ca/courses/11-multipanel/multipanel.pdf


plot(wt,mpg, main='Scatterplot of wt vs mpg')
plot(wt,disp, main='Scatterplot of wt vs disp')
hist(wt, main=' Histogram of Wt')
boxplot(wt, main='Box Plot of Wt')
par(opar)
detach(mtcars)


attach(mtcars)

layout(matrix(c(1,1,2,3),2,3,byrow=T))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

# Listing 3.4 ----------------
boxplot(mtcars$wt)



x <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x,1,1) 
plot(x,y1,type="l",col="red") 
lines(x,y2,col="green")

# Different Axis
plot( x, y1, type="l", col="red" )
plot( x, y2, type="l", col="green", add=True )
