
#' Switch projects, possibly in a new session
#'
#' @param projectname Name of project withing project_home
#' @param new if TRUE, open the project in a new session (and window) of Rstudio
#' @param project_home projectname must be within this directory,
#'  defaults to PROJECT_HOME environment variable.
#'
#' @export
work_on <- function(projectname, new = FALSE, project_home = Sys.getenv("PROJECT_HOME")) {
  # Ensure the rstudioapi package is available
  if (!requireNamespace("rstudioapi", quietly = TRUE)) {
    stop("The 'rstudioapi' package is required but not installed. Please install it.")
  }

  # Get the list of currently open files
  open_files <- rstudioapi::getSourceEditorContext()$path

  orig_project <- rstudioapi::getActiveProject()

  # Save all currently open files
  rstudioapi::documentSaveAll()

  # Save the list of open files to a temporary file
  temp_file <- tempfile(fileext = ".rds")
  saveRDS(open_files, temp_file)

  # Open the specified RStudio project
  rstudioapi::openProject(file.path(project_home, projectname), newSession=new)
}
