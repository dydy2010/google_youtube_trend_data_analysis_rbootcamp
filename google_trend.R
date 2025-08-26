# install.packages("gtrendsR")
library(gtrendsR)
library(tidyverse)


# defining the search terms, i.e. keywords

search_terms <- c("Donald Trump", "Kendrick Lamar")
search_terms_JP <- c("ドナルド・トランプ", "ケンドリック・ラマー")

# extract US data

gtrends(keyword = search_terms,
        geo = "US",
        time = "2017-11-14 2018-06-14") -> output_results_US

output_results_US %>%
  glimpse()

output_results_US$interest_over_time %>% 
  head(100)

# extract DE data

gtrends(keyword = search_terms,
        geo = "DE",
        time = "2017-11-14 2018-06-14") -> output_results_DE

output_results_DE$interest_over_time %>% 
  head(100)

# extract FR data

gtrends(keyword = search_terms,
        geo = "FR",
        time = "2017-11-14 2018-06-14") -> output_results_FR

output_results_FR$interest_over_time %>% 
  head(100)

# extract MX data

gtrends(keyword = search_terms,
        geo = "MX",
        time = "2017-11-14 2018-06-14") -> output_results_MX

output_results_MX$interest_over_time %>% 
  head(100)

# extract JP data: With Japanese Search term and translating it back

gtrends(keyword = search_terms_JP,
        geo = "JP",
        time = "2017-11-14 2018-06-14") -> output_results_JP

output_results_JP$interest_over_time %>% 
  head(100)

output_results_JP$interest_over_time <- output_results_JP$interest_over_time %>%
  mutate(keyword = str_replace_all(keyword, "ドナルド・トランプ", "Donald Trump"),
         keyword = str_replace_all(keyword, "ケンドリック・ラマー", "Kendrick Lamar"))

output_results_JP$interest_over_time %>% 
  head(100)

# Joining the 5 tables row-wise.

output_results_ALL <- bind_rows(output_results_US$interest_over_time,
                                  output_results_DE$interest_over_time,
                                  output_results_FR$interest_over_time,
                                  output_results_MX$interest_over_time,
                                  output_results_JP$interest_over_time)

output_results_ALL %>%
  glimpse()

# Facet line chart for all combinations of country & keyword.

output_results_ALL %>%
  ggplot(aes(x = date, y = hits)) +
  geom_line(colour = "darkblue", linewidth = 1) +
  facet_wrap(~ keyword + geo, nrow = 2, ncol = 5) +
  theme_minimal()

# Scatterplot Keyword 1 vs. Keyword 2 for Germany

scatter_data <- output_results_DE$interest_over_time %>%
  select(date, keyword, hits) %>%
  pivot_wider(
    names_from = keyword, 
    values_from = hits,
    values_fill = list(hits = 0)
  )

ggplot(scatter_data, aes(x = `Donald Trump`, y = `Kendrick Lamar`)) +
  geom_point(alpha = 0.6, size = 2, color = "darkblue") +
  labs(
    title = "Korrelation zwischen Suchanfragen",
    x = "Donald Trump",
    y = "Kendrick Lamar",
    caption = "Source: Google Trends"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    panel.grid.minor = element_blank()
  )

# Scatterplot Keyword 1 US vs. Keyword 1 DE

