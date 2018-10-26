#!/bin/sh

set -e

cd /root/workshop-site

# Load R packages from packages.csv
# Iterate on the CSV to install packages and versions.

# Run R process(es) to generate HTML from Rmd.

Rscript -e "blogdown::build_site()"
Rscript -e "blogdown::serve_site(host='0.0.0.0', port = 4321)"

