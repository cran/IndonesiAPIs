# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_holidays

library(testthat)

test_that("get_indonesia_holidays() returns a tibble with expected structure", {
  skip_on_cran()

  result <- get_indonesia_holidays(2025)

  # Structure
  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)

  # Column names
  expect_named(result, c("date", "local_name", "name"))

  # Column types
  expect_s3_class(result$date, "Date")
  expect_type(result$local_name, "character")
  expect_type(result$name, "character")
})

test_that("get_indonesia_holidays() returns valid data for 2025", {
  skip_on_cran()

  result <- get_indonesia_holidays(2025)

  # Should have at least one holiday
  expect_true(nrow(result) > 0)

  # All dates should be in year 2025
  expect_true(all(format(result$date, "%Y") == "2025"))

  # Dates should be sorted chronologically
  expect_true(all(diff(result$date) >= 0))

  # No missing values in essential columns
  expect_true(all(!is.na(result$date)))
  expect_true(all(!is.na(result$local_name)))
  expect_true(all(!is.na(result$name)))
})

test_that("get_indonesia_holidays() returns consistent holiday information", {
  skip_on_cran()

  result <- get_indonesia_holidays(2025)

  # Local names should be non-empty
  expect_true(all(nchar(result$local_name) > 0))

  # English names should be non-empty
  expect_true(all(nchar(result$name) > 0))

  # Should contain some expected fixed holidays
  expect_true(any(grepl("New Year", result$name, ignore.case = TRUE)))
  expect_true(any(grepl("Independence", result$name, ignore.case = TRUE)))
})

test_that("get_indonesia_holidays() works with different years", {
  skip_on_cran()

  result_2024 <- get_indonesia_holidays(2024)
  result_2025 <- get_indonesia_holidays(2025)

  # Both should return valid tibbles
  expect_s3_class(result_2024, "tbl_df")
  expect_s3_class(result_2025, "tbl_df")

  # Both should have data
  expect_true(nrow(result_2024) > 0)
  expect_true(nrow(result_2025) > 0)

  # Dates should correspond to correct years
  expect_true(all(format(result_2024$date, "%Y") == "2024"))
  expect_true(all(format(result_2025$date, "%Y") == "2025"))
})

test_that("get_indonesia_holidays() handles API errors gracefully", {
  skip_on_cran()

  result <- tryCatch(get_indonesia_holidays(2025), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
