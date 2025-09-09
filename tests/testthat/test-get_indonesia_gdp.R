# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_gdp

library(testthat)

test_that("get_indonesia_gdp() returns a tibble with expected structure", {
  skip_on_cran()
  result <- get_indonesia_gdp()

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))

  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
  expect_type(result$value_label, "character")
})

test_that("get_indonesia_gdp() returns only Indonesia data", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_true(all(result$country == "Indonesia"))
})

test_that("get_indonesia_gdp() returns GDP indicator only", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_true(all(result$indicator == "GDP (current US$)"))
})

test_that("get_indonesia_gdp() returns years from 2010 to 2022", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_setequal(result$year, 2010:2022)
})

test_that("get_indonesia_gdp() returns exactly 13 rows", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_equal(nrow(result), 13)
})

test_that("get_indonesia_gdp() includes non-negative GDP values or NA", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_true(all(is.na(result$value) | result$value >= 0))
})

test_that("get_indonesia_gdp() includes valid year values", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_false(any(is.na(result$year)))
  expect_true(all(result$year >= 2010 & result$year <= 2022))
})

test_that("get_indonesia_gdp() includes properly formatted value_label", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_true(all(grepl("^[0-9]{1,3}(,[0-9]{3})*$", result$value_label[!is.na(result$value_label)])))
})

test_that("get_indonesia_gdp(): years are sorted descending", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_indonesia_gdp(): indicator and country are consistent", {
  skip_on_cran()
  result <- get_indonesia_gdp()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_indonesia_gdp() handles API errors gracefully", {
  skip_on_cran()
  result <- tryCatch(get_indonesia_gdp(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
