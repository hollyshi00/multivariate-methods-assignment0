# multivariate-normal.R
# This script generates and plots a bivariate normal sample.

# 1. Install required packages (if needed)
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

# 2. Load required libraries
library(MASS)
library(ggplot2)

# 3. Set seed for reproducibility
set.seed(42)

# 4. Define mean vector and covariance matrix
mu <- c(0, 0)                          # Mean vector
sigma <- matrix(c(1,   0.8,
                  0.8, 1), 2, 2)       # Covariance matrix (correlation increased to 0.8)

# 5. Generate bivariate normal data
data <- mvrnorm(n = 500, mu = mu, Sigma = sigma)

# 6. Convert to data frame for plotting
df <- data.frame(X = data[, 1], Y = data[, 2])

# 7. Plot the generated distribution with contour lines
ggplot(df, aes(x = X, y = Y)) +
  geom_point(alpha = 0.6) +
  geom_density_2d(color = "steelblue", linewidth = 0.6) +  # Contour lines added
  theme_minimal() +
  ggtitle("Bivariate Normal Sample (correlation = 0.8)")
