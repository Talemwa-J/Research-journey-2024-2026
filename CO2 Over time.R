# Load libraries
library(ggplot2)

# Reconstructed data (approximate from figure)
year <- rep(1996:2021, each = 6)

emissions <- c(
  -2e5, -1e5, -5e4, 0, 2e4, 1e4,
  -2e5, -1e5, -5e4, 0, 2e4, 1e4,
  -2e5, -1e5, -5e4, 0, 2e4, 1e4,
  -2e5, -1e5, -5e4, 0, 2e4, 1e4,
  -2e5, -1e5, -5e4, 0, 2e4, 1e4,
  -2.2e5, -1.2e5, -6e4, 0, 1e4, 2e4,
  -2.3e5, -1.3e5, -7e4, 0, 1e4, 2e4,
  -2.4e5, -1.4e5, -8e4, 0, 1e4, 2e4,
  -2.5e5, -1.5e5, -9e4, 0, 1e4, 2e4,
  -2.6e5, -1.6e5, -1e5, 0, 1e4, 2e4,
  -2.4e5, -1.4e5, -8e4, 0, 1e4, 2e4,
  -2.5e5, -1.5e5, -9e4, 0, 1e4, 2e4,
  -2.6e5, -1.6e5, -1e5, 0, 1e4, 2e4,
  -2.7e5, -1.7e5, -1.1e5, 0, 1e4, 2e4,
  -2.8e5, -1.8e5, -1.2e5, 0, 1e4, 2e4,
  -2.9e5, -1.9e5, -1.3e5, 0, 1e4, 2e4,
  -3.0e5, -2.0e5, -1.4e5, 0, 1e4, 2e4,
  -3.0e5, -2.0e5, -1.4e5, 0, 1e4, 2e4,
  -3.1e5, -2.1e5, -1.5e5, 0, 1e4, 2e4,
  -3.1e5, -2.1e5, -1.5e5, 0, 1e4, 2e4,
  -3.2e5, -2.2e5, -1.6e5, 0, 1e4, 2e4,
  -3.2e5, -2.2e5, -1.6e5, 0, 1e4, 2e4,
  -3.3e5, -2.3e5, -1.7e5, 0, 1e4, 2e4,
  -3.3e5, -2.3e5, -1.7e5, 0, 1e4, 2e4,
  -3.3e5, -2.3e5, -1.7e5, 0, 1e4, 2e4,
  -3.3e5, -2.3e5, -1.7e5, 0, 1e4, 2e4
)

data <- data.frame(year, emissions)

# Create plot
ggplot(data, aes(x = year, y = emissions)) +
  geom_line(color = "darkgreen", size = 1.2) +
  geom_point(color = "black", size = 3) +
  labs(
    title = "CO2 Emissions Over Time",
    x = "Year",
    y = "Emissions (tons)"
  ) +
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )