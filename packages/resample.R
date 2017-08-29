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


# Package NA for R Version
# NOT RUN {
# 100 Bernoulli trials -- no need for replace=TRUE
resample(0:1, 100)
tally(resample(0:1, 100))
if (require(mosaicData)) {
  Small <- sample(KidsFeet, 10)
  resample(Small)
  tally(~ sex, data=resample(Small))
  tally(~ sex, data=resample(Small))
  # fixed marginals for sex
  tally(~ sex, data=Small)
  tally(~ sex, data=resample(Small, groups=sex)) 
  # shuffled can be used to reshuffle some variables within groups
  # orig.id shows where the values were in original data frame.
  Small <- mutate(Small, 
                  id1 = paste(sex,1:10, sep=":"),  
                  id2 = paste(sex,1:10, sep=":"))
  resample(Small, groups=sex, shuffled=c("id1","id2"))
}
deal(Cards, 13)    # A Bridge hand
shuffle(Cards)
# }
