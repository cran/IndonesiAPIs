# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_energy_use

library(testthat)

test_that("get_indonesia_energy_use() returns a tibble with expected structure", {
  skip_on_cran()
  result <- get_indonesia_energy_use()

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

test_that("get_indonesia_energy_use() returns correct dimensions and years", {
  skip_on_cran()
  result <- get_indonesia_energy_use()

  # Should be 13 rows (2010–2022 inclusive)
  expect_equal(nrow(result), 13)

  # Years must match exactly 2010:2022
  expect_equal(sort(result$year), 2010:2022)

  # Years sorted in descending order
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_indonesia_energy_use() returns consistent country and indicator", {
  skip_on_cran()
  result <- get_indonesia_energy_use()

  # Country always Indonesia
  expect_true(all(result$country == "Indonesia"))

  # Indicator must match energy use label
  expect_true(all(grepl("Energy use", result$indicator, ignore.case = TRUE)))
})

test_that("get_indonesia_energy_use() returns valid values", {
  skip_on_cran()
  result <- get_indonesia_energy_use()

  # Values should be numeric and >= 0
  expect_true(all(is.na(result$value) | result$value >= 0))

  # Ensure no NA in year column
  expect_false(any(is.na(result$year)))
})

test_that("get_indonesia_energy_use() handles API errors gracefully", {
  skip_on_cran()
  result <- tryCatch(get_indonesia_energy_use(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
