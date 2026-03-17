# Load library
library(ggplot2)

# Reconstructed data from the figure
year <- c(1996, 1998, 2000, 2002, 2004, 2006, 2008, 2010,
          2012, 2014, 2016, 2018, 2020, 2021)

rural <- c(2.5e7, 2.6e7, 2.8e7, 2.9e7, 3.0e7, 3.1e7,
           3.2e7, 3.3e7, 3.4e7, 3.5e7, 3.7e7, 3.9e7,
           4.0e7, 4.1e7)

urban <- c(7.0e6, 7.5e6, 8.0e6, 8.5e6, 9.2e6, 1.0e7,
           1.1e7, 1.2e7, 1.35e7, 1.5e7, 1.7e7, 1.9e7,
           2.1e7, 2.25e7)

data <- data.frame(year, rural, urban)

# Convert to long format
library(tidyr)
data_long <- pivot_longer(data, cols = c(rural, urban),
                          names_to = "type", values_to = "population")

# Plot
ggplot(data_long, aes(x = year, y = population, color = type)) +
  geom_line(size = 1.5) +
  scale_color_manual(
    values = c("rural" = "red", "urban" = "blue"),
    labels = c("rural" = "Rural Population",
               "urban" = "Urban Population")
  ) +
  labs(
    title = "Population Trends Over Time",
    x = "Year",
    y = "Population",
    color = ""
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )