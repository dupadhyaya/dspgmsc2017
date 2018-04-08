#Anova
set.seed(5250)

studentid = rep(seq(from = 1, to = 50, by = 1), 20)
studentid
 = sample(x = 1:100,
                size = 1000,
                replace = TRUE),

myData = data.frame(studentdid = rep(seq(from = 1,
                                   to = 50, by = 1), 20),
                     stress = sample(x = 1:100,
                                     size = 1000,
                                     replace = TRUE),
                     image = sample(c("Happy", "Angry"),
                                    size = 1000,
                                    replace = TRUE),
                     music = sample(c("Disney", "Horror"),
                                    size = 1000,
                                    replace = TRUE)
)

