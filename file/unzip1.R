# Unzip in R

#library(utils) #base package
?unzip
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = ".", unzip = "internal",
      setTimes = FALSE)


fileName <- "http://www.newcl.org/data/zipfiles/a1.zip"
con1 <- unz(fileName, filename="a1.dat", open = "r")
temp <- tempfile()
download.file("http://www.newcl.org/data/zipfiles/a1.zip",temp)
data <- read.table(unz(temp, "a1.dat"))
unlink(temp)


unzip(zipfile="<directory and filename>",
      exdir="<directory where the content will be extracted>")
Example:
  
  unzip(zipfile="./data/Data.zip",exdir="./data")


library(data.table)
temp <- tempfile()
download.file("https://www.bls.gov/tus/special.requests/atusact_0315.zip", temp)
timeUse <- fread(unzip(temp, files = "atusact_0315.dat"))
rm(temp)


url <-"https://www1.toronto.ca/City_Of_Toronto/Information_Technology/Open_Data/Data_Sets/Assets/Files/fire_stns.zip"

temp <- tempfile()
temp2 <- tempfile()

download.file(url, temp)
unzip(zipfile = temp, exdir = temp2)
data <- read_xls(file.path(temp2, "fire station x_y.xls"))

unlink(c(temp, temp2))