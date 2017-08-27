# resample
#https://cran.r-project.org/web/packages/resample/resample.pdf

library(resample)
x= mtcars
colVars(x, na.rm = FALSE)
round(colStdevs(x),2)


Quantile(x[,1], type = 6)


# Extras -----------------------


#resample::resample()


resample(..., replace = TRUE)
deal(...)

shuffle(x, replace = FALSE, prob = NULL, groups = NULL,
        orig.ids = FALSE)

sample(x, size, replace = FALSE, ...)

# S3 method for default
sample(x, size, replace = FALSE, prob = NULL,
       groups = NULL, orig.ids = FALSE, ...)

# S3 method for data.frame
sample(x, size, replace = FALSE, prob = NULL,
       groups = NULL, orig.ids = TRUE, fixed = names(x), shuffled = c(),
       invisibly.return = NULL, ...)

# S3 method for matrix
sample(x, size, replace = FALSE, prob = NULL,
       groups = NULL, orig.ids = FALSE, ...)

# S3 method for factor
sample(x, size, replace = FALSE, prob = NULL,
       groups = NULL, orig.ids = FALSE, drop.unused.levels = FALSE, ...)