# Moscaic2

# Titanic Data Set

data(Titanic) # Load Data Set
Titanic   # Display Data
str(Titanic)  # Show Structure of Data Set
?mosaicplot
mosaicplot(Titanic,
             main = "Survival on the Titanic",
             col = hcl(c(240, 120)),
             off = c(5, 5, 5, 5))
(x = apply(Titanic, 2:1, sum))
str(x)
mosaicplot(x, main = "Survival on the Titanic",
           col = hcl(c(200, 150, 100,50)),
           off = c(5, 5, 5, 5),
           border=2)
