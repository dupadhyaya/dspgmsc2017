# ggplot2


#http://stackoverflow.com/questions/6644997/showing-data-values-on-stacked-bar-chart-in-ggplot2

Year      <- c(rep(c("2006-07", "2007-08", "2008-09", "2009-10"), each = 4))
Category  <- c(rep(c("A", "B", "C", "D"), times = 4))
Frequency <- c(168, 259, 226, 340, 216, 431, 319, 368, 423, 645, 234, 685, 166, 467, 274, 251)
Data      <- data.frame(Year, Category, Frequency)
Data
library(ggplot2)

ggplot(Data, aes(x = Year, y = Frequency, fill = Category, label = Frequency)) +
  geom_bar(stat = "identity") +
  geom_text(size = 3, position = position_stack(vjust = 0.5))

library(ggplot2)
library(plyr)

# calculate midpoints of bars (simplified using comment by @DWin)
Frequency
cumsum(Frequency)
cumsum(Frequency) - (0.5 * Frequency)
barplot(y=Frequency, x=Year)
?barplot

Data <- ddply(Data, .(Year), 
              transform, pos = cumsum(Frequency) - (0.5 * Frequency))

# library(dplyr) ## If using dplyr... 
# Data <- group_by(Data,Year) %>%
#    mutate(pos = cumsum(Frequency) - (0.5 * Frequency))

# plot bars and add text
p <- ggplot(Data, aes(x = Year, y = Frequency)) +
  geom_bar(aes(fill = Category), stat="identity") +
  geom_text(aes(label = Frequency, y = pos), size = 3)
p
