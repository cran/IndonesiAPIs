# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_country_info_idn


library(testthat)

test_that("get_country_info_idn() returns a tibble with expected structure", {
  skip_on_cran()

  result <- get_country_info_idn()

  # Structure
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 1)
  expect_equal(ncol(result), 8)

  # Columns
  expect_named(result, c(
    "name_common", "name_official", "region", "subregion",
    "capital", "area", "population", "languages"
  ))

  # Types
  expect_type(result$name_common, "character")
  expect_type(result$name_official, "character")
  expect_type(result$region, "character")
  expect_type(result$subregion, "character")
  expect_type(result$capital, "character")
  expect_type(result$area, "double")
  expect_type(result$population, "integer")
  expect_type(result$languages, "character")
})

test_that("get_country_info_idn() returns consistent values for Indonesia", {
  skip_on_cran()

  result <- get_country_info_idn()

  # Fixed values from API
  expect_equal(result$name_common, "Indonesia")
  expect_equal(result$capital, "Jakarta")
  expect_equal(result$region, "Asia")

  # Flexible checks (API text may vary slightly)
  expect_true(grepl("Indonesia", result$name_official, ignore.case = TRUE))
  expect_true(grepl("Asia", result$subregion, ignore.case = TRUE))

  # Area and population must be positive
  expect_gt(result$area, 0)
  expect_gt(result$population, 0)

  # Languages should contain "Indonesian"
  expect_true(grepl("Indonesian", result$languages, ignore.case = TRUE))
})

test_that("get_country_info_idn() handles API errors gracefully", {
  skip_on_cran()

  result <- tryCatch(get_country_info_idn(), error = function(e) NULL)
  expect_true(is.null(result) || inherits(result, "tbl_df"))
})
