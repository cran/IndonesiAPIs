# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# indonesia_latlong_df

library(testthat)

# Test 1: Confirm the object is a data.frame (not a tibble)
test_that("indonesia_latlong_df is a data.frame", {
  expect_s3_class(indonesia_latlong_df, "data.frame")
  expect_false("tbl_df" %in% class(indonesia_latlong_df))
})

# Test 2: Confirm the number of columns is 3
test_that("indonesia_latlong_df has 3 columns", {
  expect_equal(length(indonesia_latlong_df), 3)
})

# Test 3: Confirm the number of rows is 4
test_that("indonesia_latlong_df has 4 rows", {
  expect_equal(nrow(indonesia_latlong_df), 4)
})

# Test 4: Confirm the column names are correct and in order
test_that("indonesia_latlong_df has correct column names", {
  expect_named(indonesia_latlong_df, c("City", "latitude", "longitude"))
})

# Test 5: Confirm the column types are correct
test_that("indonesia_latlong_df columns have correct types", {
  expect_type(indonesia_latlong_df$City, "character")
  expect_type(indonesia_latlong_df$latitude, "double")
  expect_type(indonesia_latlong_df$longitude, "double")
})
