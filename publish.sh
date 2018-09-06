#!/bin/bash

set -e
clear

ls -al

cd public/
rm -Rf *
cd ../

echo "--- Content cleared"
hugo -v --ignoreCache    # try without cache
echo "--- Hugo content generated"

aws s3 sync --delete public/ s3://somrc-courses/
echo "--- Public dir published to AWS"

aws cloudfront create-invalidation --distribution-id "E9K683QE4HATG" --paths "/*"
echo "--- CloudFront cache cleared"
