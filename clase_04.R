# Load necessary library
library(ggplot2)

# Sample data
actual_returns <- c(0.08, 0.06, 0.05, 0.07, 0.09)

# Actual returns of the investment
benchmark_returns <- c(0.07, 0.05, 0.04, 0.06, 0.08)

# Returns of the benchmark
dates <- 1:5

# Assuming 5 time periods

# Create a data frame
data <- data.frame(dates, actual_returns, benchmark_returns)

ggplot(data, aes(x = dates)) +
  geom_line(aes(y = actual_returns, color = "Actual Returns")) +
  geom_line(aes(y = benchmark_returns, color = "Benchmark")) +
  labs(x = "Time Period", y = "Returns", title = "Actual Returns vs. Benchmark") +
  scale_color_manual(values = c("Actual Returns" = "blue", "Benchmark" = "red")) +
  theme_minimal()

## Ex-post alpha

# Calculating ex-post alpha
ex_post_alpha <- mean(actual_returns - benchmark_returns)
print(ex_post_alpha)

## Ratio de Treynor

# Sample data
excess_returns <- actual_returns - 0.03
# Assuming risk-free rate of 3%
beta <- 1.2
# Example beta
# Calculating Treynor ratio
treynor_ratio <- mean(excess_returns) / beta
print(treynor_ratio)

## Sharpe ratio

# Sample data
risk_free_rate <- 0.03
# Calculating excess returns
excess_returns <- actual_returns - risk_free_rate
# Calculating Sharpe ratio
sharpe_ratio <- mean(excess_returns) / sd(actual_returns)
print(sharpe_ratio)

