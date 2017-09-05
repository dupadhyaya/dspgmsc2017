# Moscaic2

# Titanic Data Set

data(Titanic) # Load Data Set
Titanic   # Display Data
str(Titanic)  # Show Structure of Data Set
?mosaicplot
mosaicplot(Titanic,
             main = "Survival on the Titanic",
            # col = hcl(c(240, 120)),
             col = c('green', 'blue'),
             off = c(5,5,5,5))
(x = apply(Titanic, 2:1, sum))
(x = apply(Titanic, c(1,2), sum))  # opposite of above
(x = apply(Titanic, c(2,1), sum))

x
str(x)
mosaicplot(x, main = "Survival on the Titanic",
           col = hcl(c(200, 150, 100,50)),
           off = c(30, 12),
           border=2)

