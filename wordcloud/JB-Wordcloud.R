## Packages installieren:


#  Wordcloud2.

# install.packages("devtools")  # Only 1st time on computer
# library(devtools)
# install_github("lchiffon/wordcloud2")  # Only 1st time on computer


# Windows Fonts nutzbar machen.

# install.packages('ragg')
# library(ragg)
# install.packages('systemfonts')
# library(systemfonts)
# install.packages('textshaping')
# library(textshaping)

# For RStudio >= 1.4, go to Tools > Global Options > General > Graphics and set the Backend to AGG.

View(systemfonts::system_fonts())

# Test Fonts. Use family name!
# library(ggplot2)
# ggplot(NULL, aes(0, 0)) +
#   geom_text(
#     aes(label = "Leelawadee UI"),
#     size = 18, family = "Leelawadee UI"
# )


# PDF-Tools installieren.

# install.packages("webshot")
# install.packages("htmlwidgets")

# install Ghostscript on Windows 10  # Only 1st time on computer


# Weitere 'klassische' Paketet laden.

# install.packages("tidyverse")  # Only 1st time on computer
# install.packages("openxlsx")  # Only 1st time on computer
# install.packages("RColorBrewer")  # Only 1st time on computer


## Libraries laden:

library(RColorBrewer)
library(wordcloud2)
# library(extrafont)
library(tidyverse)
library(openxlsx)


# Ev. Arbeits-Verzeichnis anpassen.

getwd()
# setwd("H:/R/Wordcloud")


# Excel-Daten lesen (ohne sep.names = ' ' werden die Leerzeichen durch '.' ersetzt.)
df <- read.xlsx("JB-Wordcloud-Test.xlsx", cols = c(1, 2), sep.names = ' ')
str(df)
head(df)


df2 <- df %>%
  mutate(Word = toupper(Word))
head(df2)

# ?ColorBrewer
# palDark2 <- brewer.pal(8,"Dark2") 
# palDark2 <- palDark2[-c(8)] # Nicht erwünschte Farben rauswerfen

# https://html-color-codes.info/webfarben_hexcodes/
# palKH1 <- c("#004e62", "#92d050", "#00b481", "#a6a6a6", "#ff9900", "#ffcf87", "#E6AB02")

palJB80 <- c("#3343A1", "#C0BB98", "#434B77", "#8D9697", "#3399B5", "#8B5581", "#339E91", "#AC4959",  "#D6A133")

# ?wordcloud2

wordcloud2(df2, size = 0.4, minSize = 1, rotateRatio = 0,
           minRotation = -pi/2, maxRotation = -pi/2,
           fontFamily = 'Verlag Office',
           fontWeight = 800,
           gridSize = 4,
           shuffle = TRUE,
           shape = 'circle', ellipticity = 0.4,
           # color = palKH2[factor(df2$Word)])
           color = palJB80)

