# Dplyr2
# http://genomicsclass.github.io/book/pages/dplyr_tutorial.html
# 
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "./data/msleep_ggplot2.csv"
if (!file.exists(filename)) download(url,filename)
msleep <- read.csv("./data/msleep_ggplot2.csv")
head(msleep)

# Columns in order -----
# column name	Description
# name	common name
# genus	taxonomic rank
# vore	carnivore, omnivore or herbivore?
# order	taxonomic rank
# conservation	the conservation status of the mammal
# sleep_total	total amount of sleep, in hours
# sleep_rem	rem sleep, in hours
# sleep_cycle	length of sleep cycle, in hours
# awake	amount of time spent awake, in hours
# brainwt	brain weight in kilograms
# bodywt	body weight in kilograms

#select
sleepData <- select(msleep, name, sleep_total)
head(sleepData)
head(select(msleep, -name)) # specific
head(select(msleep, name:order))  # range of coln
head(select(msleep, starts_with("sl")))

#filter
filter(msleep, sleep_total >= 16)
filter(msleep, sleep_total >= 16, bodywt >= 1)
filter(msleep, order %in% c("Perissodactyla", "Primates"))

head(select(msleep, name, sleep_total))
msleep %>%  select(name, sleep_total) %>%   head

msleep %>% arrange(order) %>% head
dim(msleep)
msleep %>%   select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%   head

msleep %>% select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>% filter(sleep_total >= 16)

msleep %>% select(name, order, sleep_total) %>%
  arrange(order, desc(sleep_total)) %>% filter(sleep_total >= 16)

msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head
