
install.packages("tidyr")
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
# Read data (adjust skip if needed)
df <- read_excel("LUC and Emissios data in Tanzania1.xlsx", skip = 1)

# Rename first column
colnames(df)[1] <- "Category"

# Remove rows with NA category
df <- df %>% filter(!is.na(Category))

# Convert to long format
df_long <- df %>%
  pivot_longer(
    cols = -Category,
    names_to = "Year",
    values_to = "CO2"
  )

# Convert CO2 to numeric (if needed)
df_long$CO2 <- as.numeric(df_long$CO2)
avg_data <- df_long %>%
  group_by(Category) %>%
  summarise(Avg_CO2 = mean(CO2, na.rm = TRUE)) %>%
  arrange(desc(Avg_CO2))
ggplot(avg_data, aes(x = reorder(Category, Avg_CO2), y = Avg_CO2)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Average CO2 Emissions by Land Use Type",
    x = "Land Use Type",
    y = "Average Emissions"
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_text(size = 8),
    plot.title = element_text(hjust = 0.5)
  )