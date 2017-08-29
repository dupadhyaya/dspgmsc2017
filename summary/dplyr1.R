#Package ddply
# Dataframe -> split into some variables -> action on it -> DF
require(plyr)
head(baseball)

baseball$sf[baseball$year < 1974] = 0
any(is.na(baseball$sf))
