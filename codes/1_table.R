# library packages
# pacman::p_load(dplyr, gtsummary, labelled, here)
library(dplyr)
library(gtsummary)
library(labelled)

# path
here::i_am("codes/1_table.R")
# load data
load(here::here("data", "heart_dt.RData"))


# 1. label data ---------------------------
var_label(heart_dt) <- list(
  age = "Age",
  gender = "Gender",
  height = "Height(cm)",
  weight = "Weight(kg)",
  ap_hi = "Systolic blood pressure",
  ap_lo = "Diastolic blood pressure",
  cholesterol = "Cholesterol level",
  gluc = "Glucose level",
  smoke = "Smoking",
  alco = "Alcohol consumption",
  active = "Physical activity",
  cardio = "Cardiovascular disease"
)



# 2. table  ---------------------------
heart_dt %>% 
  tbl_summary(by = cardio, 
              digits = list(all_continuous() ~ c(1, 1),
                            all_categorical() ~ c(0, 1)),
              statistic = list(all_continuous() ~ "{mean} ± {sd}")
  ) %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Cardiovascular Disease**") %>% 
  add_overall() %>% 
 # add_p(pvalue_fun =purrr::partial(style_pvalue, digits =3))%>%
  modify_caption("**Table 1: Summary Statistics for Cardiovascular Disease**") -> table_summary


saveRDS(table_summary, 
        file = here::here("output/", "table_summary.rds"))
