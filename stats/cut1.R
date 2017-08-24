## generate data for clinical trial example
clinical.trial <-
    data.frame(patient = 1:100,              
               age = rnorm(100, mean = 60, sd = 8),
               year.enroll = sample(paste("19", 85:99, sep = ""),
                                    100, replace = TRUE))
summary(clinical.trial)
## basic usage of cut with a numeric variable
c1 <- cut(clinical.trial$age, breaks = 4)
table(c1)

c1

## year.enroll is a factor, so must convert to numeric first!
c2 <- cut(as.numeric(as.character(clinical.trial$year.enroll)),
              breaks = 3)
table(c2)
c2
