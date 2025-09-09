# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_holidays

library(testthat)

test_that("get_indonesia_holidays() returns a tibble with expected structure", {
  skip_on_cran()
  result <- get_indonesia_holidays(2025)

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("date", "local_name", "name"))

  expect_s3_class(result$date, "Date")
  expect_type(result$local_name, "character")
  expect_type(result$name, "character")
})

test_that("get_indonesia_holidays() returns non-empty results for a valid year", {
  skip_on_cran()
  result <- get_indonesia_holidays(2025)
  expect_gt(nrow(result), 0)
})

test_that("get_indonesia_holidays() has no missing dates", {
  skip_on_cran()
  result <- get_indonesia_holidays(2025)
  expect_false(any(is.na(result$date)))
})

test_that("get_indonesia_holidays() returns valid local and English names", {
  skip_on_cran()
  result <- get_indonesia_holidays(2025)

  expect_false(any(is.na(result$local_name)))
  expect_false(any(is.na(result$name)))

  expect_true(all(nzchar(result$local_name)))
  expect_true(all(nzchar(result$name)))
})

test_that("get_indonesia_holidays() date column is sorted in ascending order", {
  skip_on_cran()
  result <- get_indonesia_holidays(2025)
  expect_equal(result$date, sort(result$date))
})

test_that("get_indonesia_holidays() handles API errors gracefully", {
  skip_on_cran()
  bad_year <- 1800  # outside supported API range
  expect_error(get_indonesia_holidays(bad_year))
})
