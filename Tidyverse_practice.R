#Tidyverse Practice

install.packages("tidyr")
install.packages("dplyr")
install.packages("palmerpenguins")

library(tidyr)
library(dplyr)
library(palmerpenguins)

penguins_data <- penguins

head(penguins_data)

class(penguins_data)

str(penguins_data)

levels(penguins_data$island)

is.ordered(penguins$island)

mean(penguins_data$body_mass_g, na.rm = TRUE)
#add the na.rm = true means essentially to run it even if we have some na
#as a platform, R is conservative with na

paste("Year: ", penguins_data$year)
#but this change won't change the underlying data, that is something to 
#either save in a new object with <- or in dplyr

island_year <- select(penguins_data, island, year)
#way to filter columns

t_penguins <- filter(penguins_data, island == "Torgersen")
#way to filter rows

str(t_penguins)

adelie_penguins <- filter(penguins_data, species == "Adelie")

filtered_species_sex <- filter(penguins_data, island == "Torgersen") %>%
    select(sex, species)

penguins_data <- penguins_data %>%
    mutate(rounded_bill_length = round(bill_length_mm))

#the first argument in mutate will either create or new variable or 
#one that already exists

penguins_data_summary <- penguins_data %>%
    group_by(species, sex) %>%
    summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

penguins_data_summary

penguin_count <- penguins_data %>%
    group_by(species, sex, island) %>%
    summarize(n = dplyr::n())

penguin_count

penguins_wide <- penguin_count %>%
    pivot_wider(names_from = island, values_from = n)
#pivot wider is going to turn information that is in a column (like species)
#and make it into columns

penguins_wide
