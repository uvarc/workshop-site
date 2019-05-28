FROM rocker/r-apt:trusty
MAINTAINER nmagee@virginia.edu

# Set working directory and necessary env vars
WORKDIR /root/
ENV AWS_DEFAULT_REGION us-east-1

# Update, install Git and things
RUN apt-get update && apt-get install -y \
    pandoc \
    pandoc-citeproc \
    libssl-dev \
    libxml2-dev \
    libcurl4-gnutls-dev \
    git \
    libxt-dev

# Install Hugo
ADD https://github.com/gohugoio/hugo/releases/download/v0.55.6/hugo_0.55.6_Linux-64bit.tar.gz hugo_0.55.6.tar.gz
RUN tar -xzf hugo_0.55.6.tar.gz
RUN mv hugo /usr/local/bin

# Install AWSCLI
ADD https://s3.amazonaws.com/aws-cli/awscli-bundle.zip awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# get app code
ADD https://github.com/uvasomrc/workshop-site/archive/master.zip workshop-site-master.zip
RUN unzip workshop-site-master

# change into workshop site dir
WORKDIR /root/workshop-site-master/

# install all of the packages needed to build site
# nb this script should skip previously installed pkgs
RUN Rscript install.R

# install blogdown R package
RUN Rscript -e "install.packages(c('tinytex','blogdown'))"
RUN Rscript -e "install.packages('tidyverse')"

RUN chmod +x /root/workshop-site-master/build-site.sh
