# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# bali_tourism_tbl_df

library(testthat)

# Test 1: Confirm the object exists
test_that("bali_tourism_tbl_df exists", {
  expect_true(exists("bali_tourism_tbl_df"))
})

# Test 2: Confirm the object is a spec_tbl_df (tibble with spec)
test_that("bali_tourism_tbl_df is a spec_tbl_df tibble", {
  expect_s3_class(bali_tourism_tbl_df, "spec_tbl_df")
  expect_s3_class(bali_tourism_tbl_df, "tbl_df")
  expect_s3_class(bali_tourism_tbl_df, "tbl")
  expect_s3_class(bali_tourism_tbl_df, "data.frame")
})

# Test 3: Confirm it has exactly 8 columns
test_that("bali_tourism_tbl_df has 8 columns", {
  expect_equal(length(bali_tourism_tbl_df), 8)
})

# Test 4: Confirm it has exactly 34 rows
test_that("bali_tourism_tbl_df has 34 rows", {
  expect_equal(nrow(bali_tourism_tbl_df), 34)
})

# Test 5: Confirm column names are correct and in order
test_that("bali_tourism_tbl_df has correct column names", {
  expect_named(bali_tourism_tbl_df, c(
    "Place", "Location", "Coordinate", "Google Maps Rating",
    "Google Reviews (Count)", "Source", "Description",
    "Tourism/Visitor Fee (approx in USD)"
  ))
})

# Test 6: Confirm column types are correct
test_that("bali_tourism_tbl_df columns have correct types", {
  expect_type(bali_tourism_tbl_df$Place, "character")
  expect_type(bali_tourism_tbl_df$Location, "character")
  expect_type(bali_tourism_tbl_df$Coordinate, "character")
  expect_type(bali_tourism_tbl_df$`Google Maps Rating`, "double")
  expect_type(bali_tourism_tbl_df$`Google Reviews (Count)`, "double")
  expect_type(bali_tourism_tbl_df$Source, "character")
  expect_type(bali_tourism_tbl_df$Description, "character")
  expect_type(bali_tourism_tbl_df$`Tourism/Visitor Fee (approx in USD)`, "character")
})
