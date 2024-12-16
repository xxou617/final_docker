FROM rocker/r-ubuntu

RUN apt-get update
RUN apt-get install -y pandoc
	
	
RUN mkdir /project
WORKDIR /project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN mkdir codes data report output 
COPY codes codes
COPY data data
COPY Makefile Report.Rmd .


RUN R -e "renv::restore(prompt=FALSE, clean=T)"

CMD make && mv Report.html report

