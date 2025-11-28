# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

#' Get Key Country Information About Indonesia from the REST Countries API
#'
#' @description
#' Retrieves selected, essential information about Indonesia using the REST Countries API.
#' The function returns a tibble with core details such as population, area, capital, region,
#' and official language(s).
#'
#' See the API documentation at \url{https://restcountries.com/}.
#' Example API usage: \url{https://restcountries.com/v3.1/name/indonesia?fullText=true}.
#'
#' @return A tibble with the following 8 columns:
#' \itemize{
#'   \item \code{name_common}: Common name of the country.
#'   \item \code{name_official}: Official name of the country.
#'   \item \code{region}: Geographical region.
#'   \item \code{subregion}: Subregion within the continent.
#'   \item \code{capital}: Capital city.
#'   \item \code{area}: Area in square kilometers.
#'   \item \code{population}: Population of the country.
#'   \item \code{languages}: Languages spoken in the country, as a comma-separated string.
#' }
#' Returns \code{NULL} if the API is unavailable or returns an error.
#'
#' @details
#' The function sends a GET request to the REST Countries API. If the API returns data for Indonesia,
#' the function extracts and returns selected fields as a tibble. If the request fails or
#' Indonesia is not found, it returns \code{NULL} and prints a message.
#'
#' @note Requires internet connection. The data is retrieved in real time from the REST Countries API.
#'
#' @source REST Countries API: \url{https://restcountries.com/}
#'
#' @examples
#' \donttest{
#' get_country_info_idn()
#' }
#'
#' @importFrom httr GET content http_error http_status
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#' @export
get_country_info_idn <- function() {
  url <- "https://restcountries.com/v3.1/name/indonesia?fullText=true"

  # Try to make the request with error handling
  response <- tryCatch({
    httr::GET(url, httr::timeout(10))
  }, error = function(e) {
    message("Failed to connect to REST Countries API: ", e$message)
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
    message("REST Countries API request failed with status ", status$category, ": ", status$message)
    message("The API may be temporarily unavailable. Please try again later.")
    return(NULL)
  }

  # Try to parse the response
  data_raw <- tryCatch({
    httr::content(response, as = "text", encoding = "UTF-8")
  }, error = function(e) {
    message("Failed to read API response: ", e$message)
    return(NULL)
  })

  if (is.null(data_raw)) {
    return(NULL)
  }

  # Try to parse JSON
  data_list <- tryCatch({
    jsonlite::fromJSON(data_raw)
  }, error = function(e) {
    message("Failed to parse API response: ", e$message)
    return(NULL)
  })

  if (is.null(data_list) || length(data_list) == 0) {
    message("No data found for Indonesia.")
    return(NULL)
  }

  data <- data_list[1, ]  # Only one country should be returned

  # Build and return the tibble
  tibble::tibble(
    name_common   = data$name$common,
    name_official = data$name$official,
    region        = data$region,
    subregion     = data$subregion,
    capital       = paste(data$capital, collapse = ", "),
    area          = data$area,
    population    = data$population,
    languages     = paste(unlist(data$languages), collapse = ", ")
  )
}
