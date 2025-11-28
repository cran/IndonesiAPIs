# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

#' Get Indonesia's Consumer Price Index from World Bank
#'
#' @description
#' Retrieves Indonesia's Consumer Price Index (2010 = 100)
#' for the years 2010 to 2022 using the World Bank Open Data API.
#' The indicator used is \code{FP.CPI.TOTL}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name (e.g., "Consumer price index (2010 = 100)")
#'   \item \code{country}: Country name ("Indonesia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Consumer Price Index value in numeric form
#' }
#' Returns \code{NULL} if the API is unavailable or returns an error.
#'
#' @details
#' The function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code, the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection. The data is retrieved in real time from the World Bank API.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/FP.CPI.TOTL}
#'
#' @examples
#' \donttest{
#' get_indonesia_cpi()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content http_error http_status timeout
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_indonesia_cpi <- function() {
  url <- "https://api.worldbank.org/v2/country/IDN/indicator/FP.CPI.TOTL?format=json&date=2010:2022&per_page=100"

  # Try to make the request with error handling
  res <- tryCatch({
    httr::GET(url, httr::timeout(10))
  }, error = function(e) {
    message("Failed to connect to World Bank API: ", e$message)
    message("Please check your internet connection and try again later.")
    return(NULL)
  })

  # If tryCatch returned NULL, exit early
  if (is.null(res)) {
    return(NULL)
  }

  # Check for HTTP errors
  if (httr::http_error(res)) {
    status <- httr::http_status(res)
    message("World Bank API request failed with status ", res$status_code, ": ", status$message)
    message("The API may be temporarily unavailable. Please try again later.")
    return(NULL)
  }

  # Try to parse the response
  content <- tryCatch({
    jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
  }, error = function(e) {
    message("Failed to parse World Bank API response: ", e$message)
    return(NULL)
  })

  if (is.null(content)) {
    return(NULL)
  }

  if (length(content) < 2 || is.null(content[[2]])) {
    message("No data returned from the World Bank API.")
    return(NULL)
  }

  data <- content[[2]]

  # Build and return the tibble
  df <- dplyr::as_tibble(data.frame(
    indicator = data$indicator$value,
    country = data$country$value,
    year = as.integer(data$date),
    value = data$value
  ))

  return(df)
}
