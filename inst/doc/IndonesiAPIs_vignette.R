## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(IndonesiAPIs)
library(ggplot2)
library(dplyr)

## ----indonesia-gdp,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----


indonesia_gdp <- head(get_indonesia_gdp())

print(indonesia_gdp)


## ----indonesia-life-expectancy,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

indonesia_life_expectancy <- head(get_indonesia_life_expectancy())

print(indonesia_life_expectancy)


## ----indonesia-population,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

indonesia_population <- head(get_indonesia_population())

print(indonesia_population)


## ----indonesia-wage-plot, message=FALSE, warning=FALSE, fig.width=9, fig.height=5----


# Bar chart with better formatted x-axis
indonesia_minwage_tbl_df %>%
  filter(YEAR >= 2015) %>%
  group_by(REGION) %>%
  summarise(avg_salary = mean(SALARY, na.rm = TRUE), .groups = 'drop') %>%
  arrange(desc(avg_salary)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(x = reorder(REGION, avg_salary), y = avg_salary)) +
  geom_col(fill = "steelblue", alpha = 0.8) +
  coord_flip() +
  scale_y_continuous(
    labels = function(x) format(x, big.mark = ",", scientific = FALSE)
  ) +
  labs(
    title = "Top 10 Regions with Highest Average Minimum Wage (2015-2023)",
    subtitle = "Indonesian Minimum Wage by Region",
    x = "Region",
    y = "Average Minimum Wage (IDR)",
    caption = "Source: IndonesiAPIs package"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.text = element_text(size = 10),
    axis.title = element_text(size = 11)
  )


