# dplyr2

library(dplyr)
x = rnorm(100,50,30)
glimpse(x) # nice summary,
tbl_df(x)# compact viewing,

sample_n(mtcars,5) #select random sample of rows
filter(mtcars, cyl==8) #Select rows with 
?filter
arrange(mtcars, cyl, disp) # Arrange rows 
arrange(mtcars, desc(disp))
select(iris, starts_with("Petal")) # Select columns with 
#temp adding colns
mutate(mtcars, displ_1 = disp/61) #Add columns with 
transmute(mtcars, displ_2 = disp/61) #Add columns with 

#http://www-huber.embl.de/users/klaus/Teaching/DataHandling.pdfhttp://www-huber.embl.de/users/klaus/Teaching/DataHandling.pdf