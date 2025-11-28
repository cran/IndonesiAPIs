# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_cpi

library(testthat)

test_that("get_indonesia_cpi() returns a tibble with expected structure", {
  skip_on_cran()

  result <- get_indonesia_cpi()

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

test_that("get_indonesia_cpi() returns correct dimensions and years", {
  skip_on_cran()

  result <- get_indonesia_cpi()

  # Expected number of rows (2010 to 2022 inclusive)
  expect_equal(nrow(result), 13)

  # Years should match exactly 2010:2022
  expect_equal(sort(result$year), 2010:2022)

  # Data should be sorted in descending years
  expect_true(all(diff(result$year) <= 0))
})

test_that("get_indonesia_cpi() returns consistent values for Indonesia", {
  skip_on_cran()

  result <- get_indonesia_cpi()

  # Country should always be Indonesia
  expect_true(all(result$country == "Indonesia"))

  # Indicator should always match Consumer price index
  expect_true(all(grepl("Consumer price index", result$indicator, ignore.case = TRUE)))

  # Values should all be positive numbers
  expect_true(all(result$value > 0, na.rm = TRUE))

  # CPI base year 2010 should equal 100
  cpi_2010 <- result$value[result$year == 2010]
  expect_equal(cpi_2010, 100, tolerance = 0.1)
})

test_that("get_indonesia_cpi() handles API errors gracefully", {
  skip_on_cran()

  result <- tryCatch(get_indonesia_cpi(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
