pacman::p_load(tidyverse)
# path
here::i_am("codes/0_data_prepare.R")
# load data
heart_dt0 <- read.csv(here::here("data", "heart_data.csv"))


heart_dt<- heart_dt0 %>% 
  mutate(gender = factor(gender, levels = c(1, 2), labels = c("Male", "Female")),
         cardio = factor(cardio, levels = c(0, 1), labels = c("No", "Yes")),
         cholesterol = factor(cholesterol, levels = c(1, 2, 3), labels = c("low", "median","high")),
         gluc = factor(gluc, levels = c(1, 2, 3), labels = c("low", "median","high"))
  ) %>% 
  select(-index,-id)

save(heart_dt, 
          file = here::here("data/", "heart_dt.RData"))
