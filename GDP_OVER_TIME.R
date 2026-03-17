# Load library
library(ggplot2)

# Reconstructed data from the figure
year <- c(1996, 1998, 2000, 2002, 2004, 2006, 2008, 2010,
          2012, 2014, 2016, 2018, 2019, 2020, 2021)

gdp <- c(3.0e10, 3.4e10, 3.9e10, 4.5e10, 5.5e10, 6.5e10,
         7.8e10, 9.0e10, 1.05e11, 1.2e11, 1.4e11, 1.6e11,
         7.5e10, 7.5e10, 7.5e10)

data <- data.frame(year, gdp)

# Create the plot
ggplot(data, aes(x = year, y = gdp)) +
  geom_line(color = "#8A2BE2", size = 1.5) +  # purple line
  labs(
    title = "GDP Trend Over Time",
    x = "Year",
    y = "GDP"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )