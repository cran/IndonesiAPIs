# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

#' Get Under-5 Mortality Rate in Indonesia from World Bank
#'
#' @description
#' Retrieves Indonesia's under-five mortality rate (per 1,000 live births)
#' for the years 2010 to 2022 using the World Bank Open Data API.
#' The indicator used is \code{SH.DYN.MORT}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name (e.g., "Mortality rate, under-5 (per 1,000 live births)")
#'   \item \code{country}: Country name ("Indonesia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Under-5 mortality rate per 1,000 live births (numeric)
#' }
#' Returns \code{NULL} if the API is unavailable or returns an error.
#'
#' @details
#' This function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/SH.DYN.MORT}
#'
#' @examples
#' \donttest{
#' get_indonesia_child_mortality()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content http_error http_status timeout
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_indonesia_child_mortality <- function() {
  url <- "https://api.worldbank.org/v2/country/IDN/indicator/SH.DYN.MORT?format=json&date=2010:2022&per_page=100"

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
