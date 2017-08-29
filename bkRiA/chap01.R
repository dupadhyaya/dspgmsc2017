#Chapter - 1 : Introduction
x = rnorm(5)
x
x1 <- rnorm(5)
x1

# I prefer = instead of <- 
# List 1.1
age <- c(1,3,5,2,11,9,3,9,12,3)
age
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)
weight
mean(weight)

#[1] 7.06
sd(weight)
#[1] 2.077498
cor(age,weight)
#[1] 0.9075655

plot(age,weight)

#q()    # quit

demo(graphics)

demo(Hershey)

demo(persp)

demo(image)

demo()  # all list of demos


help.start()

help('mean')   # function

example('mean')

RSiteSearch('mean')

apropos('mean', mode='function')

data()  # List of available example datasets contained in currently loaded packages

vignette()  # list of avl vignetters - Intro topics in pdf format. Not all have 
#View a specified package vignette, or list the available ones; display it rendered in 

vignette('tables')

# Workspace - current R Working eng
# Functions for managing R Workspace

getwd()
#setwd('my dir')   # windows use c:\xxx\xx
#dir.create(' ...')  # to create directory
ls() # list of objects in current ws
rm(z)   # remove an object
help(options) # available options

options()   # View or set current options

history(5)  # last 5 commands

savehistory('myhistory')  # save history to file

loadhistory('myhistory')

save.image('myfile')  # Save WS to myfile ( default=.RData)

save(age, weight, file='myfile2') # save objects to file*.RData

load('myfile2')


# setwd('   ')
options(digits=3)
x = runif(20)
summary(x)
hist(x)
savehistory()
save.image()


x
options(digits=4)
x = runif(20)
x
options(digits=1)
x = runif(20)
x


# 1.3.4  Input and Output ----------------------
source('test.R')   # submit script to current session
sink('test2.R', append=T, split=T)  # output to file
# split=T - output to file and screen, append=T- append output to file

# Functions for saving graphic output
pdf('filename.pdf')
win.metafile('filename.wmf')
png('filename.jpg')
bmp('filename.bmp')
postscript('filename.bmp')

# output to file and screen
sink('test3', append=T, split=T)
pdf('mygraph.pdf')
source('test.R')
sink()
dev.off()

source('test.R')  # only to screen


# Packages

.libPaths()

library()   # packages in library

search() # which packages are loaded

install.packages('gcplus')  # install packages

update.packages()  # update packages

library(ggplot2)

help(package='ggplot2')

# Batch Commands in terminal windows
#R CMD BATCH options infile outfile

# Output and Input ---------------

lm(mpg ~ wt, data = mtcars)

lmfit = lm(mpg ~ wt, data = mtcars)
plot(lmfit) 
summary(lmfit)

cook = cooks.distance(lmfit)
cook
plot(cook)

head(mtcars)
range(mtcars$wt)
predict(lmfit, newdata = data.frame(wt=3))

# Memory
# 2GB - 100000 observations


# New Package
install.packages('vcd')
help(package='vcd')
library(vcd)
help(Arthiritis)
Arthritis
example("Arthritis")
