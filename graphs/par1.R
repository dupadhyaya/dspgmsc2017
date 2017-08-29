# Graphical Parameters

opar = par(no.readonly = TRUE) 
# readonly parameters - No : this is true ; which can be changed
# readonly False can be changed; while readonly cannot be
# so lets copy no.readonly=TRUE
opar

# parameters - fonts, colros, axes, labels
# values affect the whole session
?par
par(..., no.readonly = FALSE)
x = rnorm(100,50,10)
plot(x)
par(lty=2, pch=17)
plot(x)

plot(x, pch=20)
plot(x)

par(opar)  # reset
plot(x) # default
# these can be set in Rprofile, Renviron

