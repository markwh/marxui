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
  
  rmarkdown::draft(
    file = file.path(root_dir, filename), 
    template = "pasta-default", 
    package = "marxui", 
    edit = edit
  )
}

#' Call the addin--just a wrapper for `pasta()` with a timestamped filename
#' 
#' @export
call_pasta_addin <- function() {
  
  filename <- paste0("pasta", format(Sys.time(), "%Y%m%d_%H%M%S"))
  
  pasta(filename)
}