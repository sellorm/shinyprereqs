#' Runs the pre-requisites tests
#'
#' @returns A list containing the test status and a vector of failed tests
prereq_success <- function(){
  config_data <- yaml::read_yaml("shiny_prereqs.yml")


  ## Checks for env vars
  env_var_success <- TRUE
  env_var_failures <- c()


  for (var in config_data$env_vars){
    read_var <- Sys.getenv(var, unset = "SHINY_PREREQS")
    if (read_var == "SHINY_PREREQS"){
      env_var_success <- FALSE
      env_var_failures <- append(env_var_failures, var)
    }
  }


  list(success = env_var_success,
       failures = env_var_failures)
}
