#' Returns an error display app if the prereqs checks fail
#'
#' Tests the defined pre-requisites and either returns the input
#' (on success) or a error report ui object if any of the pre-reqs
#' fail. It effectively replaces the input UI in the event of a
#' pre-req check failure.
#'
#' @returns either the input or an error report ui object
#' @param ui A shiny ui object
#' @export
prereq_ui <- function(ui){
  if (prereq_success()$success){
    ui
  } else {
    shiny::fluidPage(
      shiny::titlePanel("Pre-req check failed!"),
      shiny::h2("Missing environment variables:"),
      lapply(prereq_success()$failures, function(x){shiny::p(x)})
    )
  }
}

#' Returns an empty shiny server variable if the prereqs checks fail
#'
#' Tests the defined pre-requisites and either returns the input
#' (on success) or an empty server object if any of the pre-reqs
#' fail
#'
#' @returns either the input or an empty server object
#' @param server A shiny server object
#' @export
prereq_server <- function(server){
  if (prereq_success()$success){
    server
  } else {
    function(input, output) {}
  }
}
