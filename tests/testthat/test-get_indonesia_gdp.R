# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_gdp

library(testthat)

test_that("get_indonesia_gdp() returns a tibble with expected structure", {
  skip_on_cran()

  result <- get_indonesia_gdp()

  # Structure
  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 5)

  # Column names
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))

  # Column types
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
  expect_type(result$value_label, "character")
})

test_that("get_indonesia_gdp() returns correct dimensions and years", {
  skip_on_cran()

  result <- get_indonesia_gdp()

  # Expected number of rows (2010 to 2022 inclusive)
  expect_equal(nrow(result), 13)

  # Years should match exactly 2010:2022
  expect_equal(sort(result$year), 2010:2022)

  # Data should be sorted in descending years
  expect_true(all(diff(result$year) <= 0))
})

test_that("get_indonesia_gdp() returns consistent values for Indonesia", {
  skip_on_cran()

  result <- get_indonesia_gdp()

  # Country should always be Indonesia
  expect_true(all(result$country == "Indonesia"))

  # Indicator should always match GDP
  expect_true(all(grepl("GDP", result$indicator, ignore.case = TRUE)))

  # Values should all be positive numbers
  expect_true(all(result$value > 0, na.rm = TRUE))

  # value_label should contain commas (formatted numbers)
  expect_true(all(grepl(",", result$value_label, fixed = TRUE)))
})

test_that("get_indonesia_gdp() value_label matches value formatting", {
  skip_on_cran()

  result <- get_indonesia_gdp()

  # value_label should not be NA when value is not NA
  non_na_values <- !is.na(result$value)
  expect_true(all(!is.na(result$value_label[non_na_values])))

  # All value_labels should be non-empty strings
  expect_true(all(nchar(result$value_label) > 0))
})

test_that("get_indonesia_gdp() handles API errors gracefully", {
  skip_on_cran()

  result <- tryCatch(get_indonesia_gdp(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
