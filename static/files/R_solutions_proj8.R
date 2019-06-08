
if (! ("R.utils" %in% rownames(installed.packages())) ) {
  install.packages("R.utils")
}
library(R.utils)



#------------------------------------------------
#  Download the files
#------------------------------------------------

downloadFiles <- function(url_paths){

}  
file_paths <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/el_nino-mld/tao-all2.dat.gz",
               "https://archive.ics.uci.edu/ml/machine-learning-databases/el_nino-mld/tao-all2.col",
               "https://www.esrl.noaa.gov/psd/data/correlation/oni.data",
               "https://workshops.somrc.virginia.edu/data/patterns.csv")

for (location in file_paths){
  filename <- basename(location)
  if (!file.exists(filename)) {
    download.file(location, filename)
  }

}


#------------------------------------------------
#  Read & prepare tao-all2 files
#------------------------------------------------

filename <- "tao-all2.dat.gz"
if (!file.exists("tao-all2.dat")){
  gunzip(filename)
}

tao_data <- read.csv('tao-all2.dat', header=FALSE, sep=" ", stringsAsFactors = FALSE)
head(tao_data)

filename <- "tao-all2.col"
column_headers <- read.csv(filename, header=FALSE, stringsAsFactors = FALSE)[[1]]
column_headers 
column_headers <- unlist(lapply(column_headers, function(x) gsub(" ", "_", x)))

names(tao_data) <- column_headers
summary(tao_data)



# By looking at the first few rows and the summary, we notice two things:
#   1.  There are dots in the column called 'humidity'
#   2.  Several of the columns are labeled as having character values
#       instead of numeric values (like air temp).  
# After investigating the description of the data set at the given URL, we 
# find that dots are used to indicate missing data.  Because the dots are
# characters, all of the data in the columns with dots are treated as 
# characters.  
# Let's fix this.

replace_dots <- function(x){
  is_dot <- x == '.'
  x[is_dot] <- NA
  return(as.numeric(x))
}


for( i in 1:ncol(tao_data)){
  
  if ("." %in% tao_data[[i]]) {
    tao_data[[i]] <- replace_dots(tao_data[[i]])
  }

  
}
summary(tao_data)


#------------------------------------------------
#  Read the ONI data
#------------------------------------------------
# The first line of the ONI file has the range of years for the rows and it
# has several footer lines.  We need to read the first line to figure out
# how many line of data there are before reaching the footer lines

library(stringr)  # Needed for str_squish which elimates extra spaces

filename <- "oni.data"
header <- readLines(filename, n=1)


header <- str_squish(header)  # Get rid of excess spaces

start_stop <- as.numeric(unlist(strsplit(header, " ", fixed=TRUE)))
num_lines <- start_stop[2] - start_stop[1] + 1


oni_data <- read.csv(filename, header=FALSE, sep='', skip=1, nrows=num_lines)
col_names <- c("Year", month.name)
names(oni_data) <- col_names
head(oni_data)



#------------------------------------------------
#  Read the patterns data
#------------------------------------------------
filename <- 'patterns.csv'
patterns <- read.csv(filename)
head(patterns)



#------------------------------------------------
#  Get ONI measures for tao data
#------------------------------------------------
get_ONI <- function(i, Yr, Mon, df){
  row_num <- which(df$Year == Yr[i])
  col_num <- which(names(df) == Mon[i])
  return(df[row_num, col_num])
}

the_year <- tao_data$year + 1900
the_month <- month.name[tao_data$month]

N <- length(the_year)

ONI <- unlist(lapply(1:N, get_ONI, the_year, the_month, oni_data))



tao_data['ONI'] <- ONI



#------------------------------------------------
#  Get patterns  for tao data
#------------------------------------------------

# With the patterns data, notice that each row goes from July to June
# We need to make sure that we are looking in the correct row for a given
# year and month

get_pattern <- function(i, Yr, Mon, df){
  start_year <- as.numeric(unlist(strsplit(as.character(df$Year[1]), '-'))[1])
  
  the_month <- substr(Mon[i], 1, 3)
  col_num <- which(names(df) == the_month)
  

  row_ndx <-grep(Yr[i], df$Year)
  month_num <- which(the_month == month.abb)
  if (month_num < 7){
    row_num <- row_ndx[1]
  } else {
    row_num <- row_ndx[2]
  }

  
  return(as.character(df[row_num, col_num]))
}

pattern <- unlist(lapply(1:N, get_pattern, the_year, the_month, patterns))


tao_data['Pattern'] <- pattern

#------------------------------------------------
#  Get pattern  for tao data
#------------------------------------------------

tao_data <- as.data.frame(tao_data)

#------------------------------------------------
#  Explore the data
#------------------------------------------------
library(ggplot2)
summary(tao_data)

ggplot(tao_data, aes(x = zon.winds, y = air_temp.)) + 
  geom_point(aes(color=Pattern)) + 
  scale_color_manual("", values=c("Neither"="black", "El Nino"="blue", "La Nina"="red"))

# That is all over the place! Can we detect a pattern between time and air temperature?

ggplot(tao_data, aes(x = year, y = air_temp.)) + 
  geom_point(aes(color=Pattern)) + 
  scale_color_manual("", values=c("Neither"="black", "El Nino"="blue", "La Nina"="red"))

ggplot(tao_data, aes(x = month, y = air_temp.)) + 
  geom_point(aes(color=Pattern)) + 
  scale_color_manual("", values=c("Neither"="black", "El Nino"="blue", "La Nina"="red"))

#It's hard to see a pattern when looking at just years or just months.
# Let's create a value that represents a combination of year and month

tao_data$month_year = tao_data$year + (tao_data$month - 1)/12

ggplot(tao_data, aes(x = month_year, y = air_temp.)) + 
  geom_point(aes(color=Pattern)) + 
  scale_color_manual("", values=c("Neither"="black", "El Nino"="blue", "La Nina"="red"))

# Wow, there could be a pattern emerging, but we would need a lot more data to figure it out.
# Let's look at another parameter

ggplot(tao_data, aes(x = month_year, y = ONI)) + 
  geom_point(aes(color=Pattern)) + 
  scale_color_manual("", values=c("Neither"="black", "El Nino"="blue", "La Nina"="red"))

# It appears that we are oscillating between El Ninos and La Ninas, 
# and we are passing through a Neither category as we cycle. 
# It also appears that the blue peaks are coming sooner with each cycle.
# Very interestin!


