# tidyr
# 
library(reshape2)
library(tidyr)
library(dplyr)

# example data : `mini_iris`
(mini_iris <- iris[c(1, 51, 101), ])

# melt
(melted1 <- mini_iris %>% 
    reshape2::melt(id.vars= "Species"))        
# on reshape2
(melted2 <- mini_iris %>% tidyr::gather(variable, 
      value, -Species)) # on tidyr

# cast
melted1 %>% dcast(Species ~ variable, value.var = "value") # on reshape2
melted2 %>% spread(variable, value)  