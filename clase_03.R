library(tidyverse)

dfr1 <- data.frame( ID=1:4,
                    FirstName=c("Jesper","Jonas","Pernille","Helle"),
                    Female=c(F,F,T,T),
                    Age=c(22,33,44,55) )

dfr1$Female

col_dfr1 = select(dfr1, Female)

## Aplicar el pipe

dfr1 %>% select(Age)

col_dfr1_age = dfr1 %>% 
  select(Age)

dfr1_sin_age = dfr1 %>% 
  select(-Age)

##

dfr1[1,]

dfr1[,1]

dfr1[1:2,3:4]

dfr1[c(1,3),]

dfr1[dfr1$Age>30,2]

##

dfr2 = as_tibble(dfr1)

class(dfr1)
class(dfr2)


