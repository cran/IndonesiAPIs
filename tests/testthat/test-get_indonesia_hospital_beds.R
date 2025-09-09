# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

# get_indonesia_hospital_beds

library(testthat)

test_that("get_indonesia_hospital_beds() returns a tibble/data frame with correct structure", {
  result <- get_indonesia_hospital_beds()

  # Debe ser un data frame o tibble
  expect_s3_class(result, "data.frame")

  # Debe tener las columnas correctas
  expected_cols <- c("indicator", "country", "year", "value")
  expect_true(all(expected_cols %in% colnames(result)))

  # Validar tipos de columnas
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
})

test_that("get_indonesia_hospital_beds() returns expected metadata", {
  result <- get_indonesia_hospital_beds()

  # El indicador debe ser siempre "Hospital beds (per 1,000 people)"
  expect_true(all(result$indicator == "Hospital beds (per 1,000 people)", na.rm = TRUE))

  # El país debe ser siempre "Indonesia"
  expect_true(all(result$country == "Indonesia", na.rm = TRUE))
})

test_that("get_indonesia_hospital_beds() returns correct year range", {
  result <- get_indonesia_hospital_beds()

  # Rango de años esperado: 2010 a 2022
  expect_true(min(result$year, na.rm = TRUE) >= 2010)
  expect_true(max(result$year, na.rm = TRUE) <= 2022)
})

test_that("get_indonesia_hospital_beds() handles missing values gracefully", {
  result <- get_indonesia_hospital_beds()

  # La columna 'value' puede contener NA (ejemplo: año 2022)
  expect_true(any(is.na(result$value)))
})
