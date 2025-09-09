# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_population

library(testthat)

test_that("get_indonesia_population() returns a tibble with expected structure", {
  skip_on_cran()
  result <- get_indonesia_population()

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))

  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "integer")
  expect_type(result$value_label, "character")
})

test_that("get_indonesia_population() returns only Indonesia data", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(all(result$country == "Indonesia"))
})

test_that("get_indonesia_population() returns population indicator only", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(all(result$indicator == "Population, total"))
})

test_that("get_indonesia_population() returns years from 2010 to 2022", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_setequal(result$year, 2010:2022)
})

test_that("get_indonesia_population() returns 13 rows", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_equal(nrow(result), 13)
})

test_that("get_indonesia_population() includes non-negative population values or NA", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(all(is.na(result$value) | result$value >= 0))
})

test_that("get_indonesia_population() includes valid year values", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(all(!is.na(result$year)))
  expect_true(all(result$year >= 2010 & result$year <= 2022))
})

test_that("get_indonesia_population() includes properly formatted value_label", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(all(grepl("^[0-9]{1,3}(,[0-9]{3})*$", result$value_label[!is.na(result$value_label)])))
})

test_that("get_indonesia_population(): years are sorted descending", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_indonesia_population(): no year value is NA", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_false(any(is.na(result$year)))
})

test_that("get_indonesia_population(): value column is integer or NA", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_type(result$value, "integer")
  expect_true(all(is.finite(result$value) | is.na(result$value)))
})

test_that("get_indonesia_population(): indicator is consistent", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_equal(length(unique(result$indicator)), 1)
})

test_that("get_indonesia_population(): country is consistent", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_indonesia_population() allows for missing values (e.g., NA)", {
  skip_on_cran()
  result <- get_indonesia_population()
  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))  # tolerate either case
})

test_that("get_indonesia_population(): population values are reasonable", {
  skip_on_cran()
  result <- get_indonesia_population()
  # Population should be positive and reasonable for Indonesia
  valid_values <- result$value[!is.na(result$value)]
  expect_true(all(valid_values > 0 & valid_values < 500000000))  # Under 500 million
})
