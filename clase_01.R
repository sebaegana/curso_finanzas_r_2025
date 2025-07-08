#install.packages("tidyverse")
#install.packages("dplyr")
library(tidyverse)
library(dplyr)

#################################################

x = 2
y = 5
xy = 'Hey'

# Podemos correr el código con control + enter

print(paste(x,y,xy))

print(paste(x,y,xy, sep = "+"))

df <- tibble(x_1 = c(1, 2), x_2 = c(3, 4), y = c(4, 5))


#####

iris
datos = iris
select(datos, Species)

#####

dplyr::select(datos, Species)

?select

datos %>% 
  select(Species)

starwars

starwars %>% 
  select(height)

starwars %>% 
  select(homeworld, height, mass)

## Pipe operator

# Example of using the pipe operator in R
library(magrittr)

hola = c(-2, -10, 3, 4, 8)

# Traditional approach without pipe operator
result <- sqrt(mean(log10(abs(c(-2, -10, 3, 4, 8)))))

#nycflights

# Using the pipe operator for the same computation
result_01 <- c(-2, -10, 3, 4, 8) %>% 
  abs() %>% 
  log10() %>% 
  mean() %>% 
  sqrt()


data_autos = mtcars

filtro_01 = mtcars |> 
  filter(mpg > 20)

##
x = 15

print(ifelse(x %% 2 == 0, "Par", "Impar"))

#

z = 1
z == 2 
