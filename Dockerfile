# Uses the official Bioconductor base image matching lockfile (Bioconductor 3.21)
FROM bioconductor/bioconductor_docker:RELEASE_3_21

# Installs system dependencies required for knitting R Markdown files
RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

# Creates and set the project directory inside the container
WORKDIR /project

# Copy renv configuration files to leverage Docker layer caching
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
ENV RENV_PATHS_LIBRARY=/etc/R/renv/library
RUN R -e "install.packages('R.utils', lib='/etc/R/renv/library', repos='https://cloud.r-project.org/')"

# Restores CRAN and Bioconductor package versions
RUN R -e "renv::restore(prompt = FALSE, clean = TRUE)"

# Copies the rest of the project files
COPY . /project

# Default command to render final project report
CMD ["R", "-e", "rmarkdown::render('James_Final.Rmd', output_format='html_document')"]
