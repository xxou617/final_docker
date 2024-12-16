Final project: the risk factors for cardiovascular disease
================
Xiaxian Ou
2024-12-16

Please set your working directory.

# Docker

**Build image locally**

1.  Make sure you have renv R package is installed
2.  Run `make build` in terminal to build docker image
    `xiaxianou/finaldockeru:finaloxxtag` locally.
3.  Run `make run_report_mac` or `make run_report_win` in terminal and
    then get the Report.html in `report` folder

**Using Pull**

[Docker Hub Image:
xiaxianou/finaldockeru:finaloxxtag](https://hub.docker.com/layers/xiaxianou/finaldockeru/finaloxxtag/images/sha256:087f6e4281b3258d2cfa03c226f062ea8b1206b30a0839e9ca67d201ed4a9c6d?uuid=d0fc485a-272a-4572-a51e-bf32ad9da047)

Note !!! : this image is built under arm64

1.  Run `make pull` in terminal to access the
    `xiaxianou/finaldockeru:finaloxxtag` image in Docker hub
2.  Run `make run_report_mac` or `make run_report_win` in terminal and
    then get the Report.html in `report` folder

# Project description

`codes/1_table.R`

- label variables and use gtsummary to generate descriptive table
- saves `table_summary.rds` objects in `output/` folder

`codes/2_model.R`

- logistic regression for factors for CVD and use sjPlot to display the
  table
- saves `table_model.rds` objects in `output/` folder

`codes/3_figure.R`

- bar plot for the rate of CVD
- saves `plot_CVD_cholesterol.rds` objects in `output/` folder

`codes/4_render.R`

- renders `Report.Rmd`

`Report.Rmd`

- data description
- display the table_summary, table_model and plot_CVD_cholesterol
- the interpretation of the results

`Makefile`

- `make` or `make Report.html` to get final report
- `make clean` to remove results and report

# synchronize the package

This project uses the `renv` package to manage its R package
dependencies. To synchronize the package environment:

1.  Install the `renv` package if it is not already installed:
    `install.packages("renv")` .

2.  use `setwd()` to set working directory. Active the environment
    `source("renv/activate")` in R console

3.  Restore the package environment `make install` in terminal
