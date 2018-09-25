pkgs <- read.csv("packages.csv")

source("https://bioconductor.org/biocLite.R")

for (pkg in pkgs$package) {
  
  if(pkg %in% row.names(installed.packages())) next
  
  biocLite(pkg)
  
}