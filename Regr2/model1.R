### Initialize libraries------------------------------------

#Load the packages
library(e1071)  # for skewness
library(PerformanceAnalytics)  # for correlogram (chart.Correlation)
library(Hmisc)  # for missing value treatement (impute)
library(corrplot)  # for correlogram (corrplot)
library(party)  # selecting best variables (cforest)
library(Boruta)  # deciding if a variable is important (Boruta)
library(caret)  # for boxcox transformation (BoxCoxTrans)
library(car)  # for vif
library(DMwR)  # for knnImputation
library(mlbench)  # for Ozone Data
library(DAAG)  # for cross validation
library(relaimpo)  # for finding relative importance of predictors in lm mod

### Create Input Datasets ----------------------------------

data (Ozone, package="mlbench")  # initialize the data
inputData <- Ozone  # data from mlbench
# assign names
names(inputData) <- c("Month", "Day_of_month", "Day_of_week", "ozone_reading", "pressure_height", "Wind_speed", "Humidity", "Temperature_Sandburg", "Temperature_ElMonte", "Inversion_base_height", "Pressure_gradient", "Inversion_temperature", "Visibility")
# Segregate all continuous and categorical variables
# Place all continuous vars in inputData_cont
inputData_cont <- inputData[, c("pressure_height", "Wind_speed", "Humidity", "Temperature_Sandburg", "Temperature_ElMonte", "Inversion_base_height", "Pressure_gradient", "Inversion_temperature", "Visibility")]
# Place all categorical variables in inputData_cat
inputData_cat <- inputData[, c("Month", "Day_of_month", "Day_of_week")]
# create the response data frame
inputData_response <- data.frame(ozone_reading=inputData[, "ozone_reading"])
response_name <- "ozone_reading"  # name of response variable
response <- inputData[, response_name]  # response variable as a vector


### Exploratory analysis -----------------------------------------------

# Generate plots: Density, Scatter, Box plots

# Set up your working directory here, to a location where you want to store plots.

for (k in names(inputData_cont)){
  png(file=paste(k,"_dens_scatter_box" ,".png", sep=""), width=900, height=550)
  x <- as.numeric (inputData_cont[, k])
  Skewness <- round(skewness(x), 2)  # calc skewness
  dens <- density(x, na.rm=T)  # density func
  par(mfrow=c(1, 3))  # setup plot-area in 3 columns
   # Density plot
  plot(dens, type="l", col="red", ylab="Frequency", xlab = k, main = paste(k, ": Density Plot"), sub=paste("Skewness: ", Skewness))
   polygon(dens, col="red")
   # scatterplot
   plot(x, response, col="blue", ylab="Response", xlab = k, main = paste(k, ": Scatterplot"), pch=20)
   abline(response ~ x)
   # boxplot
   boxplot(x, main=paste(k, ": Box Plot"), sub=paste("Outliers: ", paste(boxplot.stats(x)$out, collapse=" ")))
  
  dev.off()
  
}

#x <- x[!x %in% boxplot.stats(x)$out]  # NOT run!
#replace_outlier_with_missing <- function(x, na.rm = TRUE, ...) {

qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)  # get %iles

H <- 1.5 * IQR(x, na.rm = na.rm)  # outlier limit threshold

y <- x

y[x < (qnt[1] - H)] <- NA  # replace values below lower bounds

y[x > (qnt[2] + H)] <- NA  # replace values above higher bound

y  # returns treated variable

}

inputData_cont <- as.data.frame (sapply(inputData_cont, replace_outlier_with_missing))  # this will make outliers as NA
inputData <- cbind(inputData_response, inputData_cont, inputData_cat)  # column bind the response, continuous and categorical predictors
