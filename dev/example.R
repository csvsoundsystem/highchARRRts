rm(list=ls())
library("devtools")
install_github("highChaRRRts", "csvsoundsystem")
library("highChaRRRts")

d <- read.csv("/Users/brian/Desktop/wide_est.csv", as.is=FALSE)

highChaRRRts(d,
             type="bar",
             main="Title of the chart",
             xlab="X Label",
             ylab="Y Label",
             output = "chart_output34")
