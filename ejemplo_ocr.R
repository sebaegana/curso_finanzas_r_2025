#install.packages("pdftools")
#install.packages("tesseract")

## LLamar librerías

library(tidyverse)
library(pdftools)
library(tesseract)

## Caso 1

border_patrol <- pdf_text("usbp_stats_fy2017_sector_profile.pdf")

head(border_patrol)

length(border_patrol)

border_patrol[1]

strsplit("criminology", split = "n")

sector_profile <- border_patrol[1]
sector_profile <- strsplit(sector_profile, "\n")
sector_profile <- sector_profile[[1]]

sector_profile[1]
sector_profile[2]
sector_profile[5]

sector_profile <- trimws(sector_profile)

grep("Miami", sector_profile)
grep("Nationwide Total", sector_profile)

sector_profile <- sector_profile[grep("Miami", sector_profile):
                                   grep("Nationwide Total", sector_profile)]


sector_profile <- str_split_fixed(sector_profile, " {2,}", 10)

sector_profile <- data.frame(sector_profile)
names(sector_profile) <- c("sector",
                           "agent_staffing",
                           "apprehensions",
                           "other_than_mexican_apprehensions",
                           "marijuana_pounds",
                           "cocaine_pounds",
                           "accepted_prosecutions",
                           "assaults",
                           "rescues",
                           "deaths")

## Usando Tesseract

eng <- tesseract("eng")

text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)

cat(text)

pngfile <- pdftools::pdf_convert('https://jeroen.github.io/images/ocrscan.pdf', dpi = 600)

text <- tesseract::ocr(pngfile)

cat(text)

