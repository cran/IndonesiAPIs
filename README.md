# IndonesiAPIs

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

The `IndonesiAPIs` package provides a unified interface to access open data from the **World Bank API**, **Nager.Date API**, and the **REST Countries API**, with a focus on **Indonesia**. It allows users to retrieve up-to-date or historical information on topics such as economic indicators, population statistics, national holidays, and basic geopolitical details.

In addition to API-access functions, the package includes a curated collection of open datasets related to **Indonesia**. These datasets cover a wide range of topics including consumer prices, poverty probability, food prices by region, tourism destinations, and minimum wage statistics.


## Installation

You can install the `IndonesiAPIs` package from CRAN with the following R function:

```R

install.packages("IndonesiAPIs")

```


## Usage

After installation, load the package and start exploring and using its functions and datasets.

```R

library(IndonesiAPIs)

```

### IndonesiAPIs Functions

Below is a list of the main functions included in the package:

- `get_indonesia_child_mortality()`: Get Under-5 Mortality Rate in Indonesia from World Bank

- `get_indonesia_cpi()`: Get Indonesia's Consumer Price Index from World Bank

- `get_indonesia_energy_use()`: Get Indonesia's Energy Use (kg of oil equivalent per capita) from World Bank

- `get_indonesia_gdp()`: Get Indonesia's GDP (Current US$) from World Bank

- `get_indonesia_holidays()`: Get official public holidays in Indonesia for a given year, e.g. get_indonesia_holidays(2025)

- `get_indonesia_hospital_beds()`: Get Hospital Beds per 1,000 People in Indonesia from World Bank

- `get_indonesia_life_expectancy()`: Get Indonesia's Life Expectancy at Birth from World Bank

- `get_indonesia_literacy_rate()`: Get Indonesia's Literacy Rate (Age 15+) from World Bank

- `get_indonesia_population()`: Get Indonesia's Total Population from World Bank

- `get_indonesia_unemployment()`: Get Indonesia's Unemployment Rate from World Bank

- `get_country_info_idn()`: Get Key Country Information About Indonesia from the REST Countries API

- `view_datasets_IndonesiAPIs()`: View Available Datasets in IndonesiAPIs

## Dataset Suffixes

Each dataset in `IndonesiAPIs` is labeled with a *suffix* to indicate its structure and type:

- `_df`: A standard data frame.

- `_tbl_df`: A tibble data frame object.


## Datasets Included in IndonesiAPIs

In addition to API access functions, `IndonesiAPIs` offers a curated collection of open datasets focused on **Indonesia**. These preloaded datasets cover a wide range of topics including consumer prices, poverty probability, food prices by region, tourism destinations, and minimum wage statistics. Below are some featured examples:

- `Bali_tbl_df`: A tibble containing food price data in Bali, Indonesia.

- `indonesia_minwage_tbl_df`: A tibble containing monthly minimum wage or Upah Minimum Regional (UMR) data in Indonesian Rupiah (IDR) across various regions of Indonesia from 1997 to 2025.

- `DKIJakarta_tbl_df`: A tibble containing food price data in DKI Jakarta, Indonesia.


## Example Code:

```R

# Load the package

library(IndonesiAPIs)

# Retrieves essential information about Indonesia

get_country_info_idn()

# Get Indonesia's Population (Total) from World Bank

get_indonesia_population()

# Load a dataset

data(DKIJakarta_tbl_df)

# Shows six rows of the dataset

head(DKIJakarta_tbl_df)

# Display the structure of the dataset

str(DKIJakarta_tbl_df)

# Shows the whole dataset

View(DKIJakarta_tbl_df)


```
