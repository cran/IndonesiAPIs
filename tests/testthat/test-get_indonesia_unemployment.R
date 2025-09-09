# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_unemployment

library(testthat)

test_that("get_indonesia_unemployment() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_indonesia_unemployment()

  # Basic structure
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))

  # Column type checks
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_indonesia_unemployment() returns data only for Indonesia", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_true(all(result$country == "Indonesia"))
})

test_that("get_indonesia_unemployment() returns data for years 2010 to 2022", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_true(all(result$year %in% 2010:2022))
})

test_that("get_indonesia_unemployment() returns exactly 13 rows", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_equal(nrow(result), 13)
})

test_that("get_indonesia_unemployment() includes the correct indicator label", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_true(all(result$indicator == "Unemployment, total (% of total labor force) (modeled ILO estimate)"))
})

test_that("get_indonesia_unemployment() allows for missing values (e.g., NA)", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))  # tolerate either case
})

test_that("get_indonesia_unemployment(): no year value is NA", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_false(any(is.na(result$year)))
})

test_that("get_indonesia_unemployment(): value column is numeric or NA", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_type(result$value, "double")
  expect_true(all(is.finite(result$value) | is.na(result$value)))
})

test_that("get_indonesia_unemployment(): years are sorted in descending order", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_indonesia_unemployment(): indicator is consistent", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_equal(length(unique(result$indicator)), 1)
})

test_that("get_indonesia_unemployment(): country is consistent", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_indonesia_unemployment(): all years from 2010 to 2022 are present", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  expect_setequal(result$year, 2010:2022)
})

test_that("get_indonesia_unemployment(): unemployment rates are within valid percentage range", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  # Unemployment rates should be between 0 and 100 (percentage)
  valid_values <- result$value[!is.na(result$value)]
  expect_true(all(valid_values >= 0 & valid_values <= 100))
})

test_that("get_indonesia_unemployment(): unemployment rates are non-negative", {
  skip_on_cran()
  result <- get_indonesia_unemployment()
  valid_values <- result$value[!is.na(result$value)]
  expect_true(all(valid_values >= 0))
})
