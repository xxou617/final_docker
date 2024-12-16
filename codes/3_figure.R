# library packages
# pacman::p_load(dplyr,ggplot2, here)
library(dplyr)
library(ggplot2)
# path
here::i_am("codes/3_figure.R")
# load data
load(here::here("data", "heart_dt.RData"))

cholesterol_plot <- heart_dt %>%
  group_by(cholesterol) %>%
  summarise(CVD_Incidence = mean(cardio == "Yes"))


ggplot(cholesterol_plot, aes(x = cholesterol, y = CVD_Incidence)) +
  geom_bar(stat = 'identity', fill = 'steelblue') +
  labs(title = 'Proportion of CVD by Cholesterol Level', x = 'Cholesterol Level', y = 'Proportion of CVD') +
  theme_minimal() ->plot_CVD_cholesterol

saveRDS(plot_CVD_cholesterol, 
        file = here::here("output/", "plot_CVD_cholesterol.rds"))
