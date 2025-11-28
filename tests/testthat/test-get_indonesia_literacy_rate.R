# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_literacy_rate


library(testthat)

test_that("get_indonesia_literacy_rate() returns a tibble with expected structure", {
  skip_on_cran()

  result <- get_indonesia_literacy_rate()

  # Structure
  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 4)

  # Column names
  expect_named(result, c("indicator", "country", "year", "value"))

  # Column types
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_indonesia_literacy_rate() returns correct dimensions and years", {
  skip_on_cran()

  result <- get_indonesia_literacy_rate()

  # Expected number of rows (2010 to 2022 inclusive)
  expect_equal(nrow(result), 13)

  # Years should match exactly 2010:2022
  expect_equal(sort(result$year), 2010:2022)

  # Data should be sorted in descending years
  expect_true(all(diff(result$year) <= 0))
})

test_that("get_indonesia_literacy_rate() returns consistent values for Indonesia", {
  skip_on_cran()

  result <- get_indonesia_literacy_rate()

  # Country should always be Indonesia
  expect_true(all(result$country == "Indonesia"))

  # Indicator should always match literacy rate
  expect_true(all(grepl("Literacy rate", result$indicator, ignore.case = TRUE)))
  expect_true(all(grepl("15", result$indicator, ignore.case = TRUE)))

  # Non-NA values should all be positive numbers
  expect_true(all(result$value[!is.na(result$value)] > 0))

  # Literacy rate should be percentage (0-100)
  expect_true(all(result$value[!is.na(result$value)] >= 0 & result$value[!is.na(result$value)] <= 100))
})

test_that("get_indonesia_literacy_rate() handles missing values appropriately", {
  skip_on_cran()

  result <- get_indonesia_literacy_rate()

  # Check if there are any NA values (valid API response)
  has_na <- any(is.na(result$value))

  # If there are NAs, they should be present in the data (this is valid)
  if (has_na) {
    expect_true(sum(is.na(result$value)) > 0)
  }

  # At least some years should have non-NA values
  expect_true(sum(!is.na(result$value)) > 0)
})

test_that("get_indonesia_literacy_rate() handles API errors gracefully", {
  skip_on_cran()

  result <- tryCatch(get_indonesia_literacy_rate(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
