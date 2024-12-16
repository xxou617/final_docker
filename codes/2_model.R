# library packages
# pacman::p_load(sjPlot, here)
library(sjPlot)
# path
here::i_am("codes/2_model.R")
# load data
load(here::here("data", "heart_dt.RData"))


# logistic regression
model <- glm(formula = cardio ~ . , data = heart_dt, family = binomial())
table_model <- tab_model(model,
          title = "Table 2: Logistic Regression Model for Cardiovascular Disease Prediction")

saveRDS(table_model, 
        file = here::here("output/", "table_model.rds"))
