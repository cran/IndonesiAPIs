# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

#' Get Official Public Holidays in Indonesia for a Given Year
#'
#' @description
#' Retrieves the list of official public holidays in Indonesia for a specific year
#' using the Nager.Date public holidays API.
#' This function returns a tibble containing the date of the holiday, the name
#' in the local language (Indonesian), and the English name.
#' It is useful for academic, planning, and data analysis purposes.
#' The information is retrieved directly from the Nager.Date API and reflects
#' the current status of holidays for the requested year.
#' The field names returned are consistent with the API structure.
#'
#' @param year An integer indicating the year (e.g., 2024 or 2025).
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{date}: Date of the holiday (class \code{Date})
#'   \item \code{local_name}: Holiday name in the local language (Indonesian)
#'   \item \code{name}: Holiday name in English
#' }
#' Returns \code{NULL} if the API is unavailable or returns an error.
#'
#' @source Data obtained from the Nager.Date API: \url{https://date.nager.at/}
#'
#' @examples
#' \donttest{
#' get_indonesia_holidays(2024)
#' get_indonesia_holidays(2025)
#' }
#'
#' @importFrom httr GET status_code content http_error http_status timeout
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_indonesia_holidays <- function(year) {
  url <- sprintf("https://date.nager.at/api/v3/PublicHolidays/%s/ID", year)

  # Try to make the request with error handling
  response <- tryCatch({
    httr::GET(url, httr::timeout(10))
  }, error = function(e) {
    message("Failed to connect to Nager.Date API: ", e$message)
    message("Please check your internet connection and try again later.")
    return(NULL)
  })

  # If tryCatch returned NULL, exit early
  if (is.null(response)) {
    return(NULL)
  }

  # Check for HTTP errors
  if (httr::http_error(response)) {
    status <- httr::http_status(response)
    message("Nager.Date API request failed with status ", httr::status_code(response), ": ", status$message)
    message("The API may be temporarily unavailable or the year may be invalid. Please try again later.")
    return(NULL)
  }

  # Try to parse the response
  data <- tryCatch({
    jsonlite::fromJSON(httr::content(response, as = "text", encoding = "UTF-8"))
  }, error = function(e) {
    message("Failed to parse Nager.Date API response: ", e$message)
    return(NULL)
  })

  if (is.null(data) || length(data) == 0) {
    message("No holiday data returned from the Nager.Date API for year ", year, ".")
    return(NULL)
  }

  # Build and return the tibble
  tibble::tibble(
    date = as.Date(data$date),
    local_name = data$localName,
    name = data$name
  )
}
