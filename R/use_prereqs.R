#' writes a skeleton yaml config file for shinyprereqs
#'
#' Creates the necessary configuration file used to specify
#' the pre-requisites. This function creates a skeleton
#' file that you can edit to suit your project.
#'
#' @returns Invisibly returns the path
#' @param path A path to the directory containing your app
#' @export
use_prereqs <- function(path = "."){

  if(file.exists(file.path(path, "shiny_prereqs.yml"))){
    stop("The 'shiny_prereqs.yml' file already exists!\n",
         "    Please check the file and 'path' parameter and try again")
  }

  if(!file.exists(file.path(path, "app.R"))){
    stop("There is no 'app.R' file in this directory.\n",
         "    Please check the 'path' parameter and try again.")
  }

  cat("env_vars:",
      "  - MY_ENV_VAR",
      "  - MY_API_KEY",
      file = file.path(path, "shiny_prereqs.yml"),
      sep = "\n")

  invisible(path)
}
