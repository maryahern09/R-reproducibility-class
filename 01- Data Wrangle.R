# Read in CSV ----
library(dplyr)

gapminder <- read.csv("gapminder_data.csv")
head(gapminder)
 
#Filter data ----
gap_1980s <- filter(gapminder , year >= 1980, year < 1990)
