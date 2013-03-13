#' generate a set of interactive high charts
#'
#' @param df your dcasted dataframe
#' @param type either line, bar, area, column
#' @param main the title of the chart
#' @param xlab the chart's x label
#' @param ylab the chart's y label
#' @param output the directory to create for the plots
#' @param pal A palette from R Color Brewer
#' @param alpha the alpha level to apply to the palette.
#' @param xcol the name of the x-column in your dataframe (only for scatterplots)
#' @param ycol the name of the y-column in your dataframe (only for scatterplots)
#' @param date_col the name of the date-column in your dataframe (only for time series plots)
#' @param val_col the name of the value-column in your dataframe (only for time series plots)
#' @param date_format the format of the date-column, defaults to "YYYY-MM-DD" (only for time series plots)
#' @param verbose logical; do you want highchARRRts to tell you how to view your interactive charrrt?
#' @param overwrite_data logical; do you want highchARRRts to overwrite the original data file if it already exists?
#'
#'
#' @return
#' a folder with the name determined from output with an interactive bar chart of your data in it
#'
#' @export
#'
#' @examples
#' #not run

charrrt <- function(dcasted_df,
                    type = "line",
                    main = "",
                    xlab = "",
                    ylab = "",
                    output = "charrrt",
                    pal = NULL,
                    alpha = 0.3,
                    xcol = NULL,
                    ycol = NULL,
                    date_col = NULL,
                    val_col = NULL,
                    date_format = "YYYY-MM-DD",
                    verbose = TRUE,
                    overwrite_data = FALSE) {

  # pick the template
  if(!is.null(date_col) && !is.null(val_col)) {
      template <- date_template
  } else if (!is.null(xcol) && !is.null(ycol)) {
      template <- scatter_template
  } else {
     template <- categorical_template
  }

  # setup the folder structure
  charrrt_setup(output_directory=output)

  # write data to file
  csv_folder <- list.files("csv/")
  if(len(grep("data.csv", csv_folder))==1) {
    if(overwrite_data) {
      write.csv(dcasted_df, paste0(output, "/csv/data.csv"), row.names=FALSE)
    }
  } else {
    write.csv(dcasted_df, paste0(output, "/csv/data.csv"), row.names=FALSE)
  }

  # input custom parameters
  template <- gsub("this_is_the_type_of_the_chart", type, template)
  template <- gsub("this_is_the_title_of_the_chart", main, template)
  template <- gsub("this_is_the_x_label_of_the_chart", xlab, template)
  template <- gsub("this_is_the_y_label_of_the_chart", ylab, template)
  template <- gsub("this_is_the_date_format_of_the_chart", date_format, template)

  # optional parameter
  if(!is.null(xcol)) {
      template <- gsub("this_is_the_x_col_of_the_chart", xcol, template)
  }
  if(!is.null(ycol)) {
      template <- gsub("this_is_the_y_col_of_the_chart", ycol, template)
  }
  if(!is.null(date_col)) {
      template <- gsub("this_is_the_date_col_of_the_chart", date_col, template)
  }
  if(!is.null(val_col)) {
      template <- gsub("this_is_the_val_col_of_the_chart", val_col, template)
  }

  # if pal is not null, pass in custom ColorBrewer Palettes
  if(!is.null(pal)) {
      # generate a javascript array of colors dynamically
      n <- length(unique(dcasted_df[,1]))
      if (n < 3) {
        raw_palette <- brewer.pal(3, pal)
        if (n==2) {
          raw_palette <- raw_palette[c(1,3)]
        } else if (n==1) {
          raw_palette <- raw_palette[2]
        }
      } else {
        raw_palette <- brewer.pal(n, pal)
      }
      # apply alpha levels

      hex_to_high_chart_rgba <- function(color) {
        rgba <- col2rgb(color, alpha=TRUE)
        paste0('rgba(', rgba[1], ',', rgba[2], ',', rgba[3], ',', alpha, ')')
      }

      rgba_palette <- laply(raw_palette, hex_to_high_chart_rgba)
      for (i in 1:n) {
        rgba_palette[i] <- paste0("'", rgba_palette[i], "'")
      }
      rgba_palette <- paste(rgba_palette, collapse=",")
      custom_palette <- paste0('[', rgba_palette, ']')
      color_pattern <- "\\[\\'#1f77b4\\', \\'#ff7f0e\\', \\'#2ca02c\\', \\'#d62728\\', \\'#9467bd\\', \\'#8c564b\\', \\'#e377c2\\', \\'#7f7f7f\\', \\'#bcbd22\\', \\'#17becf\\', \\'#aec7e8\\', \\'#ffbb78\\', \\'#98df8a\\',\\'#ff9896\\', \\'#c5b0d5\\',\\'#c49c94\\', \\'#f7b6d2\\', \\'#c7c7c7\\', \\'#dbdb8d\\', \\'#9edae5\\'\\]"
      template <- gsub(color_pattern, custom_palette, template)
  }
  write(template, paste0(output, "/index.html"))

  if(verbose==TRUE) {
    output_dir <- paste0(getwd(), "/", output)
    cat("\n")
    cat("To view your charrrt:", "\n")
    cat("cd", output_dir, "\n")
    cat("python -m SimpleHTTPServer", "\n")
    cat("\n")
    cat("open a browser to 0.0.0.0:8000", "\n")
    cat("\n")
  }
}




