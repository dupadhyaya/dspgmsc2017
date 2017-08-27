# resample
#https://cran.r-project.org/web/packages/resample/resample.pdf

library(resample)
x= mtcars
colVars(x, na.rm = FALSE)
round(colStdevs(x),2)


Quantile(x[,1], type = 6)



#resample::resample()
