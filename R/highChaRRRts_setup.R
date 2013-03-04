#' setup the output folder/file structure for any given chart
#'
#' @param output_directory the name of the folder to
#'
#' @return
#' a folder ready for an interactive chart and data file to be plopped in
#'
#' @export
#'
#' @examples
#' #not run
highChaRRRts_setup <- function(output_directory) {

    # require the library
    require("highChaRRRts")

    # ensure we're in the right directory
    setwd(getwd())

    #ensure this is a character
    output_directory <- as.character(output_directory)

    # make the output directory
    dir.create(output_directory, silent=TRUE)

    # make the libs and csv folder
    dir.create(paste0(output_directory, "/libs"), silent=TRUE)
    dir.create(paste0(output_directory, "/csv"), silent=TRUE)

    write(high_charts_js, paste0(output_directory, "/libs/highcharts.js"), silent=TRUE, warn=FALSE)
    write(jquery_js, paste0(output_directory, "/libs/jquery-1.9.1.min.js"), silent=TRUE, warn=FALSE)
    write(miso_js, paste0(output_directory, "/libs/miso.ds.deps.ie.0.4.1.min.js"), silent=TRUE, warn=FALSE)
}