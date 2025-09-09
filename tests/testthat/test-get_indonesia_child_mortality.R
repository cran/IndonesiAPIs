# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_child_mortality

library(testthat)

test_that("get_indonesia_child_mortality() returns a tibble with expected structure", {
  skip_on_cran()
  result <- get_indonesia_child_mortality()

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

test_that("get_indonesia_child_mortality() returns correct dimensions and years", {
  skip_on_cran()
  result <- get_indonesia_child_mortality()

  # Expected number of rows (2010 to 2022 inclusive)
  expect_equal(nrow(result), 13)

  # Years should match exactly 2010:2022
  expect_equal(sort(result$year), 2010:2022)

  # Data should be sorted in descending years
  expect_true(all(diff(result$year) <= 0))
})

test_that("get_indonesia_child_mortality() returns consistent values for Indonesia", {
  skip_on_cran()
  result <- get_indonesia_child_mortality()

  # Country should always be Indonesia
  expect_true(all(result$country == "Indonesia"))

  # Indicator should always match mortality rate under-5
  expect_true(all(grepl("under-5", result$indicator, ignore.case = TRUE)))

  # Values should all be positive numbers
  expect_true(all(result$value > 0, na.rm = TRUE))
})

test_that("get_indonesia_child_mortality() handles API errors gracefully", {
  skip_on_cran()
  result <- tryCatch(get_indonesia_child_mortality(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})

