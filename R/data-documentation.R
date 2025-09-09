# IndonesiAPIs - Access Indonesian Data via Public APIs and Curated Datasets
# Version 0.1.0
# Copyright (c) 2025 Renzo Caceres Rossi
# Licensed under the MIT License.
# See the LICENSE file in the root directory for full license text.

#' Coordinate of Several Regions in Indonesia
#'
#' This dataset, indonesia_latlong_df, is a data frame containing the geographical coordinates
#' of several regions in Indonesia, specifically Semarang, Surakarta, Tegal, and Purwokerto.
#' It includes the city names and their respective latitude and longitude values.
#'
#' The dataset name has been kept as 'indonesia_latlong_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' IndonesiAPIs package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame. The original content has not been modified
#' in any way.
#'
#' @name indonesia_latlong_df
#' @format A data frame with 4 observations and 3 variables:
#' \describe{
#'   \item{City}{Name of the region in Indonesia (character)}
#'   \item{latitude}{Latitude coordinate of the region (numeric)}
#'   \item{longitude}{Longitude coordinate of the region (numeric)}
#' }
#' @source Data taken from the gstar package version 0.1.0
#' @usage data(indonesia_latlong_df)
#' @export
load("data/indonesia_latlong_df.rda")
NULL




#' Food Prices in Bali
#'
#' This dataset, Bali_tbl_df, is a tibble containing food price data in Bali, Indonesia.
#' It includes prices for various food items such as rice, chicken, beef, eggs, onions,
#' chilies, cooking oil, and sugar, recorded over multiple observations.
#'
#' The dataset name has been kept as 'Bali_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' IndonesiAPIs package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not been modified
#' in any way.
#'
#' @name Bali_tbl_df
#' @format A tibble with 1,043 observations and 30 variables:
#' \describe{
#'   \item{Tanggal}{Date of the observation (character)}
#'   \item{Beras}{Price of rice (numeric)}
#'   \item{Beras Kualitas Medium I}{Price of medium quality rice I (numeric)}
#'   \item{Beras Kualitas Medium II}{Price of medium quality rice II (numeric)}
#'   \item{Beras Kualitas Super I}{Price of super quality rice I (numeric)}
#'   \item{Beras Kualitas Super II}{Price of super quality rice II (numeric)}
#'   \item{Daging Ayam}{Price of chicken meat (numeric)}
#'   \item{Daging Ayam Ras Segar}{Price of fresh broiler chicken meat (numeric)}
#'   \item{Daging Sapi}{Price of beef (numeric)}
#'   \item{Daging Sapi Kualitas 1}{Price of quality 1 beef (numeric)}
#'   \item{Daging Sapi Kualitas 2}{Price of quality 2 beef (numeric)}
#'   \item{Telur Ayam}{Price of chicken eggs (numeric)}
#'   \item{Telur Ayam Ras Segar}{Price of fresh broiler chicken eggs (numeric)}
#'   \item{Bawang Merah}{Price of red onions (numeric)}
#'   \item{Bawang Merah Ukuran Sedang}{Price of medium-sized red onions (numeric)}
#'   \item{Bawang Putih}{Price of garlic (numeric)}
#'   \item{Bawang Putih Ukuran Sedang}{Price of medium-sized garlic (numeric)}
#'   \item{Cabai Merah}{Price of red chilies (numeric)}
#'   \item{Cabai Merah Besar}{Price of large red chilies (numeric)}
#'   \item{Cabai Merah Keriting}{Price of curly red chilies (numeric)}
#'   \item{Cabai Rawit}{Price of bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Hijau}{Price of green bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Merah}{Price of red bird's eye chilies (numeric)}
#'   \item{Minyak Goreng}{Price of cooking oil (numeric)}
#'   \item{Minyak Goreng Curah}{Price of bulk cooking oil (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 1}{Price of branded packaged cooking oil 1 (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 2}{Price of branded packaged cooking oil 2 (numeric)}
#'   \item{Gula Pasir}{Price of granulated sugar (numeric)}
#'   \item{Gula Pasir Kualitas Premium}{Price of premium granulated sugar (numeric)}
#'   \item{Gula Pasir Lokal}{Price of local granulated sugar (numeric)}
#' }
#' @source Data taken from the ifpd package version 0.1.0
#' @usage data(Bali_tbl_df)
#' @export
load("data/Bali_tbl_df.rda")
NULL



#' Food Prices in Sumatera Utara
#'
#' This dataset, SumateraUtara_tbl_df, is a tibble containing food price data in Sumatera Utara, Indonesia.
#' It includes prices for various food items such as rice, chicken, beef, eggs, onions, chilies, cooking oil,
#' and sugar, recorded over multiple observations.
#'
#' The dataset name has been kept as 'SumateraUtara_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' IndonesiAPIs package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not been modified
#' in any way.
#'
#' @name SumateraUtara_tbl_df
#' @format A tibble with 1,043 observations and 31 variables:
#' \describe{
#'   \item{Tanggal}{Date of the observation (character)}
#'   \item{Beras}{Price of rice (numeric)}
#'   \item{Beras Kualitas Bawah I}{Price of low quality rice I (numeric)}
#'   \item{Beras Kualitas Bawah II}{Price of low quality rice II (numeric)}
#'   \item{Beras Kualitas Medium I}{Price of medium quality rice I (numeric)}
#'   \item{Beras Kualitas Medium II}{Price of medium quality rice II (numeric)}
#'   \item{Beras Kualitas Super I}{Price of super quality rice I (numeric)}
#'   \item{Beras Kualitas Super II}{Price of super quality rice II (numeric)}
#'   \item{Daging Ayam}{Price of chicken meat (numeric)}
#'   \item{Daging Ayam Ras Segar}{Price of fresh broiler chicken meat (numeric)}
#'   \item{Daging Sapi}{Price of beef (numeric)}
#'   \item{Daging Sapi Kualitas 1}{Price of quality 1 beef (numeric)}
#'   \item{Daging Sapi Kualitas 2}{Price of quality 2 beef (numeric)}
#'   \item{Telur Ayam}{Price of chicken eggs (numeric)}
#'   \item{Telur Ayam Ras Segar}{Price of fresh broiler chicken eggs (numeric)}
#'   \item{Bawang Merah}{Price of red onions (numeric)}
#'   \item{Bawang Merah Ukuran Sedang}{Price of medium-sized red onions (numeric)}
#'   \item{Bawang Putih}{Price of garlic (numeric)}
#'   \item{Bawang Putih Ukuran Sedang}{Price of medium-sized garlic (numeric)}
#'   \item{Cabai Merah}{Price of red chilies (numeric)}
#'   \item{Cabai Merah Keriting}{Price of curly red chilies (numeric)}
#'   \item{Cabai Rawit}{Price of bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Hijau}{Price of green bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Merah}{Price of red bird's eye chilies (numeric)}
#'   \item{Minyak Goreng}{Price of cooking oil (numeric)}
#'   \item{Minyak Goreng Curah}{Price of bulk cooking oil (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 1}{Price of branded packaged cooking oil 1 (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 2}{Price of branded packaged cooking oil 2 (numeric)}
#'   \item{Gula Pasir}{Price of granulated sugar (numeric)}
#'   \item{Gula Pasir Kualitas Premium}{Price of premium granulated sugar (numeric)}
#'   \item{Gula Pasir Lokal}{Price of local granulated sugar (numeric)}
#' }
#' @source Data taken from the ifpd package version 0.1.0
#' @usage data(SumateraUtara_tbl_df)
#' @export
load("data/SumateraUtara_tbl_df.rda")
NULL


#' Food Prices in DKI Jakarta
#'
#' This dataset, DKIJakarta_tbl_df, is a tibble containing food price data in DKI Jakarta, Indonesia.
#' It includes prices for various food items such as rice, chicken, beef, eggs, onions, chilies, cooking oil,
#' and sugar, recorded over multiple observations.
#'
#' The dataset name has been kept as 'DKIJakarta_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' IndonesiAPIs package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not been modified
#' in any way.
#'
#' @name DKIJakarta_tbl_df
#' @format A tibble with 1,043 observations and 32 variables:
#' \describe{
#'   \item{Tanggal}{Date of the observation (character)}
#'   \item{Beras}{Price of rice (numeric)}
#'   \item{Beras Kualitas Bawah I}{Price of low quality rice I (numeric)}
#'   \item{Beras Kualitas Bawah II}{Price of low quality rice II (numeric)}
#'   \item{Beras Kualitas Medium I}{Price of medium quality rice I (numeric)}
#'   \item{Beras Kualitas Medium II}{Price of medium quality rice II (numeric)}
#'   \item{Beras Kualitas Super I}{Price of super quality rice I (numeric)}
#'   \item{Beras Kualitas Super II}{Price of super quality rice II (numeric)}
#'   \item{Daging Ayam}{Price of chicken meat (numeric)}
#'   \item{Daging Ayam Ras Segar}{Price of fresh broiler chicken meat (numeric)}
#'   \item{Daging Sapi}{Price of beef (numeric)}
#'   \item{Daging Sapi Kualitas 1}{Price of quality 1 beef (numeric)}
#'   \item{Daging Sapi Kualitas 2}{Price of quality 2 beef (numeric)}
#'   \item{Telur Ayam}{Price of chicken eggs (numeric)}
#'   \item{Telur Ayam Ras Segar}{Price of fresh broiler chicken eggs (numeric)}
#'   \item{Bawang Merah}{Price of red onions (numeric)}
#'   \item{Bawang Merah Ukuran Sedang}{Price of medium-sized red onions (numeric)}
#'   \item{Bawang Putih}{Price of garlic (numeric)}
#'   \item{Bawang Putih Ukuran Sedang}{Price of medium-sized garlic (numeric)}
#'   \item{Cabai Merah}{Price of red chilies (numeric)}
#'   \item{Cabai Merah Besar}{Price of large red chilies (numeric)}
#'   \item{Cabai Merah Keriting}{Price of curly red chilies (numeric)}
#'   \item{Cabai Rawit}{Price of bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Hijau}{Price of green bird's eye chilies (numeric)}
#'   \item{Cabai Rawit Merah}{Price of red bird's eye chilies (numeric)}
#'   \item{Minyak Goreng}{Price of cooking oil (numeric)}
#'   \item{Minyak Goreng Curah}{Price of bulk cooking oil (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 1}{Price of branded packaged cooking oil 1 (numeric)}
#'   \item{Minyak Goreng Kemasan Bermerk 2}{Price of branded packaged cooking oil 2 (numeric)}
#'   \item{Gula Pasir}{Price of granulated sugar (numeric)}
#'   \item{Gula Pasir Kualitas Premium}{Price of premium granulated sugar (numeric)}
#'   \item{Gula Pasir Lokal}{Price of local granulated sugar (numeric)}
#' }
#' @source Data taken from the ifpd package version 0.1.0
#' @usage data(DKIJakarta_tbl_df)
#' @export
load("data/DKIJakarta_tbl_df.rda")
NULL


#' Bali Popular Tourist Destinations (2022)
#'
#' This dataset, bali_tourism_tbl_df, is a tibble containing information on 34 popular tourist destinations in Bali, Indonesia, as of 2022.
#' It includes variables on place names, locations, coordinates, Google Maps ratings, review counts, sources, descriptions, and approximate tourism or visitor fees in USD.
#' The dataset preserves the original structure from its source on Kaggle.
#'
#' The dataset name has been kept as 'bali_tourism_tbl_df' to maintain consistency with the naming conventions
#' in the IndonesiAPIs package. The suffix 'tbl_df' indicates that this is a tibble data frame. The original content
#' has not been modified in any way.
#'
#' @name bali_tourism_tbl_df
#' @format A tibble with 34 observations and 8 variables:
#' \describe{
#'   \item{Place}{Name of the tourist destination (character)}
#'   \item{Location}{General location or area of the destination (character)}
#'   \item{Coordinate}{Geographic coordinates of the destination (character)}
#'   \item{Google Maps Rating}{Average rating from Google Maps (numeric)}
#'   \item{Google Reviews (Count)}{Number of reviews on Google Maps (numeric)}
#'   \item{Source}{Source of the information about the destination (character)}
#'   \item{Description}{Brief description of the tourist destination (character)}
#'   \item{Tourism/Visitor Fee (approx in USD)}{Approximate fee for tourists or visitors, in USD (character)}
#' }
#' @source Data obtained from Kaggle: \url{https://www.kaggle.com/datasets/fuarresvij/bali-popular-destination-for-tourist-2022}
#' @usage data(bali_tourism_tbl_df)
#' @export
load("data/bali_tourism_tbl_df.rda")
NULL


#' Indonesian Minimum Wage by Region (1997-2025)
#'
#' This dataset, indonesia_minwage_tbl_df, is a tibble containing monthly minimum wage or Upah Minimum Regional (UMR) data in Indonesian Rupiah (IDR) across various regions of Indonesia from 1997 to 2025.
#' The dataset preserves the original structure from its source on Kaggle.
#'
#' The dataset name has been kept as 'indonesia_minwage_tbl_df' to maintain consistency with the naming conventions
#' in the IndonesiAPIs package. The suffix 'tbl_df' indicates that this is a tibble data frame. The original content
#' has not been modified in any way.
#'
#' @name indonesia_minwage_tbl_df
#' @format A tibble with 983 observations and 3 variables:
#' \describe{
#'   \item{REGION}{Name of the region in Indonesia (character)}
#'   \item{SALARY}{Monthly minimum wage in Indonesian Rupiah (IDR) (numeric)}
#'   \item{YEAR}{Year of the minimum wage data (numeric)}
#' }
#' @source Data obtained from Kaggle: \url{https://www.kaggle.com/datasets/linkgish/indonesian-salary-by-region-19972022}
#' @usage data(indonesia_minwage_tbl_df)
#' @export
load("data/indonesia_minwage_tbl_df.rda")
NULL





