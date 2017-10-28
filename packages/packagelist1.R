library(plyr)
library(XML)
https://www.r-bloggers.com/the-50-most-used-r-packages/
  
# build a vector of URL pages we'll want to use
urls <- paste("http://crantastic.org/popcon?page=", 1:10, sep = "")

# scrape all the data from the URLs into one big data.frame
packages.df <- ldply(urls, function(url)readHTMLTable(url)[[1]])

# turn the "Users" column from factor to numeric
packages.df$Users <- as.numeric(as.character(packages.df$Users))

# sort by decreasing "Users"
packages.df <- arrange(packages.df, desc(Users))

# print the 50 most used packages
head(packages.df$`Package Name`, 50)