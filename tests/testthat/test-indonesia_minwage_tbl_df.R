# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.1
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# indonesia_minwage_tbl_df

library(testthat)

# Test 1: Confirm the object exists
test_that("indonesia_minwage_tbl_df exists", {
  expect_true(exists("indonesia_minwage_tbl_df"))
})

# Test 2: Confirm the object is a spec_tbl_df tibble
test_that("indonesia_minwage_tbl_df is a spec_tbl_df tibble", {
  expect_s3_class(indonesia_minwage_tbl_df, "spec_tbl_df")
  expect_s3_class(indonesia_minwage_tbl_df, "tbl_df")
  expect_s3_class(indonesia_minwage_tbl_df, "tbl")
  expect_s3_class(indonesia_minwage_tbl_df, "data.frame")
})

# Test 3: Confirm it has exactly 3 columns
test_that("indonesia_minwage_tbl_df has 3 columns", {
  expect_equal(length(indonesia_minwage_tbl_df), 3)
})

# Test 4: Confirm it has exactly 983 rows
test_that("indonesia_minwage_tbl_df has 983 rows", {
  expect_equal(nrow(indonesia_minwage_tbl_df), 983)
})

# Test 5: Confirm column names are correct and in order
test_that("indonesia_minwage_tbl_df has correct column names", {
  expect_named(indonesia_minwage_tbl_df, c("REGION", "SALARY", "YEAR"))
})

# Test 6: Confirm column types are correct
test_that("indonesia_minwage_tbl_df columns have correct types", {
  expect_type(indonesia_minwage_tbl_df$REGION, "character")
  expect_type(indonesia_minwage_tbl_df$SALARY, "double")
  expect_type(indonesia_minwage_tbl_df$YEAR, "double")
})
