# Frequency Tables
#https://www.zoology.ubc.ca/~schluter/R/display/

A=Year      <- c(rep(c("2006-07", "2007-08", "2008-09", "2009-10","2010-11"), each = 4))
B=Category  <- c(rep(c("A", "B", "C", "D"), times = 4),'A','A','A','A')
y=Frequency <- c(168, 259, 226, 340, 216, 431, 319, 368, 423, 645, 234, 685, 166, 467, 274, 251,110,100,130,170)
x= 1:20
Data      <- data.frame(Year, Category, Frequency,x)
Data
table(Year,Category)
ftable(Year,Category)

mytable <- table(Year, Category)
addmargins(mytable, margin = c(1,2), FUN = sum, quiet = F)
mytable <- table(Category, Year)
mytableDF = data.frame(mytable)
str(mytableDF)
mytableDF

myftable <- ftable(Data, row.vars = c("Year","Category")) # flat table
myftable
x1 <- data.frame(myftable)    # save the results in a new data frame "x1"
str(x1)
x1

tapply(Frequency, INDEX = Year, FUN = mean, na.rm = TRUE)
tapply(Frequency, INDEX = Category, FUN = sum, na.rm = TRUE)
tapply(Frequency, INDEX = list(Year, Category), FUN = sum, na.rm = TRUE, addmargins=T)

# graphs
mosaicplot(table(Year, Category), col = TRUE, las = 2, cex.axis = 0.8)
barplot(table(A,B), beside = TRUE)
barplot(table(A,B), beside = TRUE, space = c(.1,.3))
barplot(table(A,B), beside = TRUE, cex.names = 0.8)    # adj label size
barplot(table(A,B), beside = TRUE, legend.text = TRUE) # add legend
boxplot(y ~ A)      # formula method: response ~ explanatory
boxplot(y ~ A
  ,cex.axis = 0.8       # reduce size of axis labels (to fit them onto figure)
  ,boxwex = .9         # adjust width of boxes
  ,varwidth = TRUE      # widths proportional to sqrt(n)
)

stripchart(y ~ A, vertical = TRUE)      # formula method datapoints not many
stripchart(y ~ A, vertical = TRUE, method = "jitter", jitter = 0.2) #use jitter to reduce overlap of points.
stripchart(y ~ A, vertical = TRUE, cex.axis = 0.8, pch = 1)
stripchart(y ~ A, vertical = TRUE, pch = "-")
y[B=='A'];A[B=='A']
# nOT WORKING
stripchart(y ~ A, vertical = TRUE, method = "jitter", pch = "")
stripchart(y[B=='A'] ~ A[B=='A'], method = "jitter", pch = 1, add = TRUE)
stripchart(y[B=='B'] ~ A[B=='B'], method = "jitter", pch = 16, add = TRUE)

stripchart(y ~ A, vertical = TRUE, method = "jitter", pch = 1)
tapply(y,A, FUN = mean, na.rm = TRUE)
points( c(1,2,3,4,5), tapply(y, A, mean), pch = 16) #  working 5 colns ie. 1 to 5
points( c(1,2,3,4,5) + 0.2, tapply(y, A, mean), col='red', pch = 16) # Offset points

# lines for categorical x values ??? # not working
lines( c('2006-07',300), c('2008-09',700))                 # vertical line
lines(  c(5,10) ~ c(1,1))               # same using formula method
arrows(1, 5, 1, 10, angle=90, code=3)   # same with line ends


# Interaction Plots
interaction.plot(A, B, y)
interaction.plot(B, A, y)                            # Put B along x-axis instead
interaction.plot(A, B, y, fun = median)              # median of y
interaction.plot(A, B, y, col = 1:length(unique(B))) # color the lines
interaction.plot(A, B, y, las=2)                     # more room for A's labels


# xy plot    : lattice
library(lattice)
lattice::xyplot(y ~ x | B, data = Data, pch = 16, aspect = 0.7)
histogram(~ x | B, data = Data, layout = c(1,4), right = FALSE)
barchart( ~ table(A) | B, data = Data)
table(A) ;B; table(A,B)
barchart(table(A) ~ names(table(A)) | B, data = Data, scales = list(x=list(rot=60)))
barchart(table(B) ~ names(table(B)) | A, data = Data)
xyplot(y ~ x | B, data = Data, pch = 16, aspect = 0.7)
xyplot(y ~ x | B, data = Data, pch = 16, aspect = 0.7,
       panel=function(x, y) { # Use x and y here, not real variable names
         panel.xyplot(x, y)   # draws the scatter plot
         panel.lmline(x, y)   # fits the regression line
       }
)
