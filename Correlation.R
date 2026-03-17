# =========================
# Correlation Heatmap Script
# =========================

# 1. Load libraries
library(readxl)
library(ggplot2)
library(reshape2)

# 2. Load data
data <- read_excel("Other land use conversion to forestq.xlsx")

# 3. Select variables
df <- data[, c("Emissions", "Urban_population", "Rural_population", "Total_Population", "GDP")]

# 4. Correlation matrix
cor_matrix <- cor(df, method = "pearson", use = "complete.obs")

# 5. Keep lower triangle only
cor_matrix[upper.tri(cor_matrix)] <- NA

# 6. Convert to long format
cor_long <- melt(cor_matrix, na.rm = TRUE)

# 7. Plot heatmap
ggplot(cor_long, aes(x = Var2, y = Var1, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(value, 2)), size = 5) +
  scale_fill_gradient2(
    low = "steelblue",
    mid = "white",
    high = "red",
    midpoint = 0,
    limits = c(-1, 1)
  ) +
  theme_minimal() +
  labs(x = "", y = "", fill = "") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank()
  )
ggsave("correlation_heatmap.png", width = 6, height = 5)