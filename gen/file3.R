# file3.R
#Divert output from console to file
sink("./gen/output.txt")
mtcars # No output to screen
hist(mtcars$mpg) # to screen
sink()
#Restores to the console output
mtcars  # displays to screen