# multivariate-normal.R
# This script generates and plots a bivariate normal sample.

# 1. Install required packages (if needed)
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("mvtnorm", quietly = TRUE)) install.packages("mvtnorm")

# 2. Load required libraries
library(MASS)
library(ggplot2)
library(mvtnorm)

# 3. Set seed for reproducibility
set.seed(42)

# 4. Define mean vector and covariance matrix
mu <- c(0, 0)  # Mean vector
sigma <- matrix(c(1, 0.8,
                  0.8, 1), 2, 2)  # Covariance matrix with correlation = 0.8

# 5. Generate bivariate normal data
data <- mvrnorm(n = 500, mu = mu, Sigma = sigma)

# 6. Convert to data frame for plotting
df <- data.frame(X = data[, 1], Y = data[, 2])

# 7. Create a grid for contour lines
x_seq <- seq(min(df$X) - 0.5, max(df$X) + 0.5, length.out = 100)
y_seq <- seq(min(df$Y) - 0.5, max(df$Y) + 0.5, length.out = 100)
grid <- expand.grid(X = x_seq, Y = y_seq)

# 8. Compute density values for contour lines
grid$Z <- apply(grid, 1, function(row) {
  dmvnorm(c(row["X"], row["Y"]), mean = mu, sigma = sigma)
})

# 9. Plot the generated distribution with contour lines
ggplot(df, aes(x = X, y = Y)) +
  geom_point(alpha = 0.6) +
  geom_contour(data = grid, aes(x = X, y = Y, z = Z), color = "blue") +
  theme_minimal() +
  ggtitle("Bivariate Normal Sample with Correlation = 0.8")