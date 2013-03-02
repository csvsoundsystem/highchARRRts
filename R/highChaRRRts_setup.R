#' setup the output folder/file structure for any given chart
#'
#' @param base a base note for the chord
#'
#' @return
#' a folder ready for an interactive chart and data file to be plopped in
#'
#' @export
#'
#' @examples
#' #not run
highChaRRRts_setup <- function(chart_type) {

    # require the library
    require("highChaRRRts")

    # ensure we're in the right directory
    setwd(getwd())

    #ensure this is a character
    chart_type <- as.character(chart_type)

    # make the output directory
    dir.create(chart_type)

    # make the libs and csv folder
    dir.create(paste0(chart_type, "/libs"))
    dir.create(paste0(chart_type, "/csv"))

    write(high_charts_js, paste0(chart_type, "/libs/highcharts.js"))
    write(jquery_js, paste0(chart_type, "/libs/jquery-1.9.1.min.js"))
    write(miso_js, paste0(chart_type, "/libs/miso.ds.deps.ie.0.4.1.js"))
}