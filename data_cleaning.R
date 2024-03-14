library(tidyverse)
library(googlesheets4)
samples <- read_sheet("https://docs.google.com/spreadsheets/u/2/d/1gVv2PMc5PRMFJR02Cq_Lp0yxSo7LX0O7k0W29qwvXgI/edit?usp=drive_web&ouid=113086405194316088488")
glimpse(samples)


data_out_31_02_2024 <- samples |> 
  filter(date == "31.03.") |> mutate(date = "31_03_2024") 

data_out_04_04_2024 <- samples |> 
  filter(date == "04.04.") |>  mutate (date = "04_04_2024")

data_out <- merge(data_out_04_04_2024, data_out_31_02_2024, all = TRUE)

# there is for sure a way nicer way to do this but I couldn't figure out how :/

glimpse(data_out)

write.csv(data_out, "data/processed/waste-characterisation-processed.csv")
