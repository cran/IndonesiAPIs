# IndonesiAPIs 0.1.1

## Bug Fixes

* Improved error handling in all API functions to comply with CRAN policies regarding internet resources
* All functions now fail gracefully with informative messages when APIs are unavailable or return errors
* Added timeout handling (10 seconds) to prevent hanging connections during API requests
* Added robust error handling with `tryCatch()` blocks for network errors, HTTP errors, and JSON parsing errors
* Functions now return `NULL` with clear messages instead of throwing errors when API calls fail

## Documentation Improvements

* Updated all function examples to use `\donttest{}` instead of `if (interactive())` to prevent issues during `R CMD check`
* Enhanced documentation to clarify that functions return `NULL` when APIs are unavailable
* Added more detailed error messages to guide users when connection issues occur

## Affected Functions

All API-calling functions have been updated with improved error handling:

* `get_country_info_idn()` - REST Countries API
* `get_indonesia_child_mortality()` - World Bank API
* `get_indonesia_cpi()` - World Bank API
* `get_indonesia_energy_use()` - World Bank API
* `get_indonesia_gdp()` - World Bank API
* `get_indonesia_holidays()` - Nager.Date API
* `get_indonesia_hospital_beds()` - World Bank API
* `get_indonesia_life_expectancy()` - World Bank API
* `get_indonesia_literacy_rate()` - World Bank API
* `get_indonesia_population()` - World Bank API
* `get_indonesia_unemployment()` - World Bank API

## Technical Details

* All HTTP requests now include `httr::timeout(10)` parameter
* Added `http_error()` and `http_status()` checks for robust HTTP error detection
* Replaced `stop()` with `message() + return(NULL)` pattern for graceful failures
* Enhanced `@importFrom` declarations to include new error handling functions

## Additional Information

* DOI for this version: https://doi.org/10.5281/zenodo.17731434


---

# IndonesiAPIs 0.1.0

## Initial Release

* First release of `IndonesiAPIs` package
* Added `view_datasets_IndonesiAPIs()` function to explore available datasets
* Access Indonesian Data via Public APIs and Curated Datasets

## Features

### API Functions

* `get_country_info_idn()` - Retrieve key country information about Indonesia
* `get_indonesia_child_mortality()` - Get under-5 mortality rate data
* `get_indonesia_cpi()` - Get Consumer Price Index data
* `get_indonesia_energy_use()` - Get energy use per capita data
* `get_indonesia_gdp()` - Get GDP in current US dollars
* `get_indonesia_holidays()` - Get official public holidays for any year
* `get_indonesia_hospital_beds()` - Get hospital beds per 1,000 people
* `get_indonesia_life_expectancy()` - Get life expectancy at birth
* `get_indonesia_literacy_rate()` - Get adult literacy rate (15+)
* `get_indonesia_population()` - Get total population data
* `get_indonesia_unemployment()` - Get unemployment rate data

### Data Sources

* REST Countries API for country information
* World Bank Open Data API for economic and social indicators
* Nager.Date API for public holidays

### Utility Functions

* `view_datasets_IndonesiAPIs()` - Interactive function to explore and view available datasets
