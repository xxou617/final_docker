# pacman::p_load(here, rmarkdown)

here::i_am(
  "codes/4_render.R"
)

rmarkdown::render(
  here::here("Report.Rmd")
)
