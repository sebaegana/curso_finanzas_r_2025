library(readxl)

datos_actividad_01 <- read_excel("actividad_01.xlsx", 
                                 sheet = "data")
var_actividad_01 <- read_excel("actividad_01.xlsx", 
                                 sheet = "variables")

View(datos_actividad_01)

## Buscar textos dentro de columnas

filtro <- filter(datos_actividad_01, str_detect(Rapid_rating, "NULL"))

arrange_01 = datos_actividad_01 %>% 
  group_by(Blitz_rating) %>% 
  summarise(Conteo = n()) %>% 
  arrange(Conteo)

## Reemplazar strings en variables numericas

datos_actividad_01 = datos_actividad_01 %>% 
  mutate(Rapid_rating = str_replace(Rapid_rating, "NULL", ""))

datos_actividad_01 = datos_actividad_01 %>% 
  mutate(Year_of_birth = str_replace(Year_of_birth, "NO RESPONDE", ""))

##  Convertir a números

datos_actividad_01 = datos_actividad_01 %>%
  mutate(Blitz_rating = as.numeric(Blitz_rating), 
         Year_of_birth = as.numeric(Year_of_birth))

datos_actividad_01 %>%  summary()

filtro_rating = datos_actividad_01 %>%  filter(Standard_Rating > 4000)

datos_actividad_01 %>% group_by(Gender) %>% summarise(n())
