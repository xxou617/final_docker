Report.html: Report.Rmd codes/4_render.R table_summary table_model figure
	Rscript codes/4_render.R


table_summary: codes/1_table.R
	Rscript codes/1_table.R

table_model: codes/2_model.R
	Rscript codes/2_model.R

figure: codes/3_figure.R
	Rscript codes/3_figure.R

.PHONY: install
install:
	Rscript -e "renv::restore()"
    
.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Report.html && rm -f report/Report.html 
	
# build local
PROJECTFILES = Report.Rmd codes/1_table.R codes/2_model.R codes/3_figure.R codes/4_render.R Makefile data/heart_dt.RData
RENVFILES = renv.lock renv/activate.R renv/settings.json

build: $(PROJECTFILES) $(RENVFILES)
	docker build -t xiaxianou/finaldockeru:finaloxxtag .
	touch $@ 

# pull from dockerhub
pull: 
	docker pull xiaxianou/finaldockeru:finaloxxtag

# get report	
run_report_mac: 
	docker run -v "$$(pwd)/report":/project/report xiaxianou/finaldockeru:finaloxxtag
	
run_report_win: 
	docker run -v /"$$(pwd)/report":/project/report xiaxianou/finaldockeru:finaloxxtag