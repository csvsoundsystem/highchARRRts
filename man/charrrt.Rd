\name{charrrt}
\alias{charrrt}
\title{generate a set of interactive high charts}
\usage{
  charrrt(dcasted_df, type = "line", main = "", xlab = "",
    ylab = "", output = "charrrt", pal = NULL, alph = 0.3,
    xcol = NULL, ycol = NULL, date_col = NULL,
    val_col = NULL, date_format = "YYYY-MM-DD",
    verbose = TRUE)
}
\arguments{
  \item{df}{your dcasted dataframe}

  \item{type}{either line, bar, area, column}

  \item{main}{the title of the chart}

  \item{xlab}{the chart's x label}

  \item{ylab}{the chart's y label}

  \item{output}{the directory to create for the plots}

  \item{pal}{A palette from R Color Brewer}

  \item{alpha}{the alpha level to apply to the palette.}

  \item{xcol}{the name of the x-column in your dataframe
  (only for scatterplots)}

  \item{ycol}{the name of the y-column in your dataframe
  (only for scatterplots)}

  \item{date_col}{the name of the date-column in your
  dataframe (only for time series plots)}

  \item{val_col}{the name of the value-column in your
  dataframe (only for time series plots)}

  \item{date_format}{the format of the date-column,
  defaults to "YYYY-MM-DD" (only for time series plots)}

  \item{verbose}{logical; do you want highchARRRts to tell
  you how to view your interactive charrrt?}
}
\value{
  a folder with the name determined from output with an
  interactive bar chart of your data in it
}
\description{
  generate a set of interactive high charts
}
\examples{
#not run
}

