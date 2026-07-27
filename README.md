# Differential Expression Analysis Report

This repository contains the code and environment required to reproduce the differential expression analysis of the nucleus accumbens between cigarette smokers and non-smokers in `James_Final.Rmd`. 
The environment is containerized using Docker and package versions are locked with `renv`.

## Prerequisites
- [Docker Desktop](https://docker.com) installed and running.

## Reproducing the Analysis

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ryan1931James/James_Final
   cd James_Final
   ```

2. **Build the Docker image:**
   ```bash
   docker build -t james-bioinformatics-report .
   ```

3. **Run the script and generate HTML report:**
   * **Windows (Command Prompt):**
     ```bash
     docker run --rm -v "%cd%:/project" -e RENV_PATHS_LIBRARY=/etc/R/renv/library james-bioinformatics-report
     ```
   * **Mac / Linux / Git Bash:**
     ```bash
     docker run --rm -v "$(pwd):/project" -e RENV_PATHS_LIBRARY=/etc/R/renv/library james-bioinformatics-report
     ```

Once completed, the rendered `James_Final.html` file will appear inside your local directory.
