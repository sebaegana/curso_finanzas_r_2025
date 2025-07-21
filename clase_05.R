library(readxl)
library(tidyverse)

data <- read_excel("data_visualization.xlsx", 
                                 sheet = "data")

p <- ggplot(data)
p

p <- ggplot(data) + 
  aes(x = sexo, y = fibe)

p

p <- ggplot(data) + aes(x = sexo) + geom_bar()

p

p <- ggplot(data) + 
  aes(y = sexo) + 
  geom_bar(aes(fill = afectacion))
p

# Define your manual order
afectacion_order <- c("No afectada", 
                      "Poco afectada", 
                      "Medianamente afectada",
                      "Muy afectada")  # example order

## Ordernar y en 100%

# Apply the order
data$afectacion <- factor(data$afectacion, 
                          levels = rev(afectacion_order))

p <- ggplot(data, aes(x = sexo, fill = afectacion)) + 
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  labs(y = "Porcentaje", x = "Sexo", fill = "Afectación")

p


p <- ggplot(data) + aes(y = sexo, fill = afectacion) +
  geom_bar(position=position_dodge())
p

##

# geom_bar is designed to make it easy to create bar charts that show
# counts (or sums of weights)
?mpg

g <- ggplot(mpg, aes(class))

# Number of cars in each class:
g + geom_bar()

# Total engine displacement of each class
g + geom_bar(aes(weight = displ))

# Map class to y instead to flip the orientation
ggplot(mpg) + geom_bar(aes(y = class))


# Bar charts are automatically stacked when multiple bars are placed
# at the same location. The order of the fill is designed to match
# the legend
g + geom_bar(aes(fill = drv))


# If you need to flip the order (because you've flipped the orientation)
# call position_stack() explicitly:
ggplot(mpg, aes(y = class)) +
  geom_bar(aes(fill = drv), position = position_stack(reverse = TRUE)) +
  theme(legend.position = "top")


# To show (e.g.) means, you need geom_col()
df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))
ggplot(df, aes(trt, outcome)) +
  geom_col()

# But geom_point() displays exactly the same information and doesn't
# require the y-axis to touch zero.
ggplot(df, aes(trt, outcome)) +
  geom_point()


# You can also use geom_bar() with continuous data, in which case
# it will show counts at unique locations
df <- data.frame(x = rep(c(2.9, 3.1, 4.5), c(5, 10, 4)))
ggplot(df, aes(x)) + geom_bar()

# cf. a histogram of the same data
ggplot(df, aes(x)) + geom_histogram(binwidth = 0.5)


# Use `just` to control how columns are aligned with axis breaks:
df <- data.frame(x = as.Date(c("2020-01-01", "2020-02-01")), y = 1:2)
# Columns centered on the first day of the month
ggplot(df, aes(x, y)) + geom_col(just = 0.5)

# Columns begin on the first day of the month
ggplot(df, aes(x, y)) + geom_col(just = 1)


