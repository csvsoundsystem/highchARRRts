#' generate a set of interactive high Charts
#'
#' @param df your dcasted dataframe
#' @param type either line, bar, area, column
#' @param main the title of the chart
#' @param xlab the chart's x label
#' @param ylab the chart's y label
#' @param output the directory to create for the plots
#' @param pal a palette of colors for the plots (from RColorBrewer)
#'
#' @return
#' a folder with the name determined from output with an interactive bar chart of your data in it
#'
#' @export
#'
#' @examples
#' #not run
highChaRRRts <- function(dcasted_df,
                         type = "line",
                         main = "",
                         xlab = "",
                         ylab = "",
                         output = "chart_output",
                         pal = NULL) {

  require("highChaRRRts")
  require("RColorBrewer")

  # setup the folder structure
  highChaRRRts_setup(output_directory=output)

  # write data to file
  write.csv(dcasted_df, paste0(output, "/csv/data_wide.csv"), row.names=FALSE)

  # input custom parameters
  highChaRRRts_template <- gsub("this_is_the_type_of_the_chart", type, highChaRRRts_template)
  highChaRRRts_template <- gsub("this_is_the_title_of_the_chart", main, highChaRRRts_template)
  highChaRRRts_template <- gsub("this_is_the_x_label_of_the_chart", xlab, highChaRRRts_template)
  highChaRRRts_template <- gsub("this_is_the_y_label_of_the_chart", ylab, highChaRRRts_template)

  # if pal is not null, pass in custom ColorBrewer Palettes
  if(!is.null(pal)) {
      # generate a javascript array of colors dynamically
      n <- length(unique(dcasted_df[,1]))
      raw_palette <- brewer.pal(n, pal)

      for (i in 1:n) {
        raw_palette[i] <- paste0("'", raw_palette[i], "'")
      }
      raw_palette <- paste(raw_palette, collapse=",")
      custom_palette <- paste0('[', raw_palette, ']')
      color_pattern <- "\\[\\'#1f77b4\\', \\'#ff7f0e\\', \\'#2ca02c\\', \\'#d62728\\', \\'#9467bd\\', \\'#8c564b\\', \\'#e377c2\\', \\'#7f7f7f\\', \\'#bcbd22\\', \\'#17becf\\', \\'#aec7e8\\', \\'#ffbb78\\', \\'#98df8a\\',\\'#ff9896\\', \\'#c5b0d5\\',\\'#c49c94\\', \\'#f7b6d2\\', \\'#c7c7c7\\', \\'#dbdb8d\\', \\'#9edae5\\'\\]"
      highChaRRRts_template <- gsub(color_pattern, custom_palette, highChaRRRts_template)
  }
  write(highChaRRRts_template, paste0(output, "/index.html"))
}




