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
charrrt_setup <- function(output_directory) {

    # ensure we're in the right directory
    setwd(getwd())

    #ensure this is a character
    output_directory <- as.character(output_directory)

    # make the output directory
    dir.create(output_directory, showWarnings = FALSE)

    # make the libs and csv folder
    dir.create(paste0(output_directory, "/libs"), showWarnings = FALSE)
    dir.create(paste0(output_directory, "/csv"), showWarnings = FALSE)

    write(high_charts_js, paste0(output_directory, "/libs/highcharts.js"))
    write(jquery_js, paste0(output_directory, "/libs/jquery-1.9.1.min.js"))
    write(miso_js, paste0(output_directory, "/libs/miso.ds.deps.ie.0.4.1.min.js"))
    write(moment_js, paste0(output_directory, "/libs/moment.min.js"))
}