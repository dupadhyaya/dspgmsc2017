#Outliers

(data= df[11:14])  # numeric values
cat(names(data))

(sds <- apply(data, 2, sd, na.rm = TRUE))


findOutlier <- function(data, cutoff = 2) {
  ## Calculate the sd
  sds <- apply(data, 2, sd, na.rm = TRUE)
  ## Identify the cells with value greater than cutoff * sd (column wise)
  result <- mapply(function(d, s) {
    which(d > cutoff * s)
  }, data, sds)
  result
}

outliers <- findOutlier(data)
outliers
