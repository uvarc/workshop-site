#!/bin/sh

set -e

# Clone repo and hop into it
git clone --depth=50 https://github.com/uvasomrc/workshop-site.git
cd workshop-site

# Load R packages from packages.csv
# Iterate on the CSV to install packages and versions.



# Run R process(es) to generate HTML from Rmd.

Rscript -e "blogdown::build_site()"

# Prepare for Hugo publish
# mkdir public
# hugo -v --ignoreCache

# Push into S3 bucket
aws s3 sync public s3://$BUCKET_NAME --region=us-east-1 --cache-control public --delete;

# Invalidate CF cache
aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*";
