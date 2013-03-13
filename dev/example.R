setwd("~/Dropbox/code/highchARRRts")
library("devtools")
load_all(".")
setwd("/Users/brian/Desktop/NYT/red_carpet/")
d <- read.csv("data/data_no_nyt_clean_user_aggregations", as.is=TRUE)

# outlier removal fx
remove_outliers <- function(df, x, low, high, na.rm = TRUE, ...) {

    qnt <- quantile(x, probs=c(low, high), na.rm = na.rm, ...)
    H <- 1.5 * IQR(x, na.rm = na.rm)
    y <- x
    y[x < (qnt[1] - H)] <- NA
    y[x > (qnt[2] + H)] <- NA
    df[!is.na(y),]
}

d <- remove_outliers(d, d$total_time, low=0.005, high=0.995)
err <- which(d$total_time<1 & d$n_events>10)
d <- d[-err, ]

plot_df <- subset(d, select=c('only_slides', 'n_events', 'total_time'))

# scatter example

charrrt(plot_df,
        type="scatter",
        main="Title",
        xlab="X-Label",
        ylab="Y-Label",
        output = "chart_output",
        pal="Blues",
        alph=0.2,
        xcol="total_time",
        ycol="n_events")

# date example

df_date <- read.csv("example_templates/csv/datetime_long.csv",
                     stringsAsFactors=FALSE)

charrrt(df_date,
        type="line",
        main="Title",
        xlab="X-Label",
        ylab="Y-Label",
        output = "chart_output",
        pal="Spectral",
        date_col="date",
        val_col="value")

df_categorical <- read.csv("example_templates/csv/datetime_long.csv",
                             stringsAsFactors=FALSE)

# grouped example

charrrt(df_categorical,
        type="column",
        main="Title",
        xlab="X-Label",
        ylab="Y-Label",
        output = "chart_output",
        pal="Set3")