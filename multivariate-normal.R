# multivariate - normal . R
# This script generates and plots a bivariate normal sample .
# 1. Install required packages ( if needed )
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
# 2. Load required libraries
library(MASS)
library(ggplot2)
# 3. Set seed for r e p r o d u c i b i l i t y
set.seed(42)
# 4. Define mean vector and co va ri anc e matrix
mu <- c(0, 0) # Mean vector
sigma <- matrix(c(1, 0.5,
                  0.5, 1), 2, 2) # Co va ri an ce matrix
# 5. Generate bivariate normal data
data <- mvrnorm(n = 500, mu = mu, Sigma = sigma)
# 6. Convert to data frame for plotting
df <- data.frame(X = data[, 1], Y = data[, 2])
# 7. Plot the generated d i s t r i b u t i o n
ggplot(df, aes(x = X, y = Y)) +
  geom_point(alpha = 0.6) +
  theme_minimal() +
  ggtitle("Bivariate␣Normal␣Sample")