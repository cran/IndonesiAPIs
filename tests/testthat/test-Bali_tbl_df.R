# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# Bali_tbl_df


library(testthat)

# Test 1: Confirm the object is a tibble
test_that("Bali_tbl_df is a tibble", {
  expect_s3_class(Bali_tbl_df, "tbl_df")
  expect_s3_class(Bali_tbl_df, "tbl")
  expect_s3_class(Bali_tbl_df, "data.frame")
})

# Test 2: Confirm the number of columns is 30
test_that("Bali_tbl_df has 30 columns", {
  expect_equal(length(Bali_tbl_df), 30)
})

# Test 3: Confirm the number of rows is 1043
test_that("Bali_tbl_df has 1043 rows", {
  expect_equal(nrow(Bali_tbl_df), 1043)
})

# Test 4: Confirm the column names are correct and in order
test_that("Bali_tbl_df has correct column names", {
  expect_named(Bali_tbl_df, c(
    "Tanggal", "Beras", "Beras Kualitas Medium I", "Beras Kualitas Medium II",
    "Beras Kualitas Super I", "Beras Kualitas Super II", "Daging Ayam",
    "Daging Ayam Ras Segar", "Daging Sapi", "Daging Sapi Kualitas 1",
    "Daging Sapi Kualitas 2", "Telur Ayam", "Telur Ayam Ras Segar",
    "Bawang Merah", "Bawang Merah Ukuran Sedang", "Bawang Putih",
    "Bawang Putih Ukuran Sedang", "Cabai Merah", "Cabai Merah Besar",
    "Cabai Merah Keriting", "Cabai Rawit", "Cabai Rawit Hijau",
    "Cabai Rawit Merah", "Minyak Goreng", "Minyak Goreng Curah",
    "Minyak Goreng Kemasan Bermerk 1", "Minyak Goreng Kemasan Bermerk 2",
    "Gula Pasir", "Gula Pasir Kualitas Premium", "Gula Pasir Lokal"
  ))
})

# Test 5: Confirm the column types are correct
test_that("Bali_tbl_df columns have correct types", {
  expect_type(Bali_tbl_df$Tanggal, "character")
  expect_type(Bali_tbl_df$Beras, "double")
  expect_type(Bali_tbl_df$`Beras Kualitas Medium I`, "double")
  expect_type(Bali_tbl_df$`Beras Kualitas Medium II`, "double")
  expect_type(Bali_tbl_df$`Beras Kualitas Super I`, "double")
  expect_type(Bali_tbl_df$`Beras Kualitas Super II`, "double")
  expect_type(Bali_tbl_df$`Daging Ayam`, "double")
  expect_type(Bali_tbl_df$`Daging Ayam Ras Segar`, "double")
  expect_type(Bali_tbl_df$`Daging Sapi`, "double")
  expect_type(Bali_tbl_df$`Daging Sapi Kualitas 1`, "double")
  expect_type(Bali_tbl_df$`Daging Sapi Kualitas 2`, "double")
  expect_type(Bali_tbl_df$`Telur Ayam`, "double")
  expect_type(Bali_tbl_df$`Telur Ayam Ras Segar`, "double")
  expect_type(Bali_tbl_df$`Bawang Merah`, "double")
  expect_type(Bali_tbl_df$`Bawang Merah Ukuran Sedang`, "double")
  expect_type(Bali_tbl_df$`Bawang Putih`, "double")
  expect_type(Bali_tbl_df$`Bawang Putih Ukuran Sedang`, "double")
  expect_type(Bali_tbl_df$`Cabai Merah`, "double")
  expect_type(Bali_tbl_df$`Cabai Merah Besar`, "double")
  expect_type(Bali_tbl_df$`Cabai Merah Keriting`, "double")
  expect_type(Bali_tbl_df$`Cabai Rawit`, "double")
  expect_type(Bali_tbl_df$`Cabai Rawit Hijau`, "double")
  expect_type(Bali_tbl_df$`Cabai Rawit Merah`, "double")
  expect_type(Bali_tbl_df$`Minyak Goreng`, "double")
  expect_type(Bali_tbl_df$`Minyak Goreng Curah`, "double")
  expect_type(Bali_tbl_df$`Minyak Goreng Kemasan Bermerk 1`, "double")
  expect_type(Bali_tbl_df$`Minyak Goreng Kemasan Bermerk 2`, "double")
  expect_type(Bali_tbl_df$`Gula Pasir`, "double")
  expect_type(Bali_tbl_df$`Gula Pasir Kualitas Premium`, "double")
  expect_type(Bali_tbl_df$`Gula Pasir Lokal`, "double")
})
