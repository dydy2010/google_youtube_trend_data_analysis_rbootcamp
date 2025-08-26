# install.packages("gtrendsR")
library(gtrendsR)
library(tidyverse)

search_terms <- c("Donald Trump", "Kendrick Lamar")

gtrends(keyword = search_terms,
        geo = "US",
        time = "today 12-m") -> output_results_US

output_results_US %>%
  glimpse()

output_results_US$interest_over_time %>% 
  head(100)

gtrends(keyword = search_terms,
        geo = "DE",
        time = "today 12-m") -> output_results_DE

output_results_DE$interest_over_time %>% 
  head(100)


output_results_US_DE <- output_results_US$interest_over_time %>% 
  bind_rows(output_results_DE$interest_over_time)

output_results_US_DE %>%
  glimpse()

output_results_US_DE %>%
  ggplot(aes(x = date, y = hits)) +
  geom_line(colour = "darkblue", linewidth = 1) +
  facet_wrap(~ keyword + geo) +
  theme_minimal()


