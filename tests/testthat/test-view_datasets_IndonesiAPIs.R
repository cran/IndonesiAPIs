# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# view_datasets_IndonesiAPIs


library(testthat)
library(IndonesiAPIs)

test_that("view_datasets_IndonesiAPIs works when package is loaded", {
  result <- view_datasets_IndonesiAPIs()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets_IndonesiAPIs prints correct message", {
  output <- capture_messages(view_datasets_IndonesiAPIs())
  expect_match(
    output[1],
    "Datasets available in the 'IndonesiAPIs' package:",
    fixed = TRUE
  )
})

test_that("view_datasets_IndonesiAPIs returns expected datasets", {
  datasets <- view_datasets_IndonesiAPIs()
  expected_datasets <- c(
    "Bali_tbl_df",
    "bali_tourism_tbl_df",
    "DKIJakarta_tbl_df",
    "indonesia_latlong_df",
    "indonesia_minwage_tbl_df",
    "SumateraUtara_tbl_df"

  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})

