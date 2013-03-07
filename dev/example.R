rm(list=ls())
library("devtools")
install_github("highChaRRRts", "csvsoundsystem")
library("highChaRRRts")

# generate example data...
group <- paste0("group_", 1:11)
var1 <- rnorm(11, mean=100, sd=30)
var2 <- rnorm(11, mean=100, sd=30)
var3 <- rnorm(11, mean=100, sd=30)
var4 <- rnorm(11, mean=100, sd=30)
var5 <- rnorm(11, mean=100, sd=30)
df <- data.frame(group, var1, var2, var3, var4, var5)

highChaRRRts(df,
             type="column",
             main="Title of the chart",
             xlab="X Label",
             ylab="Y Label",
             output = "output",
             pal="Spectral")
