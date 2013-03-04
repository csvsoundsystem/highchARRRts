rm(list=ls())
library("devtools")
install_github("highChaRRRts", "csvsoundsystem")
library("highChaRRRts")

d <- read.csv("/Users/brian/Desktop/wide_est.csv", as.is=FALSE)

highChaRRRts(d,
             type="bar",
             main="I love Joanna",
             xlab="X Label",
             ylab="Y Label",
             output = "output_1",
             pal=NULL)
