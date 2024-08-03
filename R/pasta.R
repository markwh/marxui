# Paste-dump functions

#' Create a new file to dump text into
#' 
#' @param filename name of the file to save, including extension
#' @param dir Directory to save to, defaults to PASTA_DIR value
#' @param edit passed to `rmarkdown::draft()`
#' 
#' @export
pasta <- function(filename, dir = Sys.getenv("PASTA_DIR"), edit = TRUE) {
  root_dir = dir
  if (!dir.exists(root_dir)) {
    stop("PASTA_DIR environment variable must be set to an existing directory.")
  }
  rmarkdown::draft(filename, template = "pasta-default", package = "marxui", edit = edit)
}