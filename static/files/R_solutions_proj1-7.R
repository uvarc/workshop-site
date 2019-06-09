#----------------------------------
#  Project 1
#----------------------------------

# Using a loop
N <- 99
filenames <- rep("Data_00.csv", N)
for ( i in 1:N){

   if ( i < 10){
     filenames[i] <- paste0("Data_0",i, ".csv")
   } else {
     filenames[i] <- paste0("Data_", i, ".csv")
   }
}

print(filenames)


# Using vectorization
N <- 99
m <- 9
single_digit <- paste0("Data_0", 1:m, ".csv")
double_digit <- paste0("Data_", (m+1):N, ".csv")

filenames <- c(single_digit, double_digit)
print(filenames)

#----------------------------------
#  Project 2
#----------------------------------
normalize <- function(x){
  new_x <- (x - mean(x))/sd(x)
  return(new_x)
}


myList <- c(1, 2, 3, 4, 5 )
print(normalize(myList))

bodyfat_data <- read.csv("bodyfat.csv")

print(normalize(bodyfat_data$percent.body.fat))



#----------------------------------
#  Project 3
#----------------------------------
erf <- function(x){
  return(2*pnorm(x*sqrt(2))-1)
}

print(erf(1))


x_val <- seq(-3,3,0.1)
plot(x_val, erf(x_val))



#----------------------------------
#  Project 4
#----------------------------------

Celsius <- seq(-40, 100, 5)
Fahrenheit <- Celsius*9/5 + 32

# ndx_c <- which(Celsius < 0)
# ndx_f <- which(Fahrenheit > 0)
# ndx <- intersect(ndx_c, ndx_f)
# 
# df <- data.frame(Celsius=Celsius[ndx], Fahrenheit=Fahrenheit[ndx])
# 
# print(df)

find_temps <- function(cel, fah){
  ndx_c <- which(cel < 0)
  ndx_f <- which(fah > 0)
  ndx <- intersect(ndx_c, ndx_f)
  df <- data.frame(Celsius=cel[ndx], Fahrenheit=fah[ndx])
  return(df)
}

tmps <- find_temps(Celsius, Fahrenheit)
print(tmps)


#----------------------------------
#  Project 5
#----------------------------------
find_outliers <- function(x){
  n <- length(x)
  chauvenet <- n*(1-erf(abs(x - mean(x))/sd(x)))
  ndx <- which(chauvenet < 0.5)
  return(ndx)
}

clean_data <- function(col_name, df){
  for (col in col_name){
    col_data <- df[col][[1]]  #The [[1]] pulls the numeric values
    ndx <- find_outliers(col_data) 
    
    if (length(ndx) > 0){
      df <- bodyfat_data[-ndx,]  #The minus removes (in this case) a row
    }
  }
  return(df)
}

bodyfat_data <- read.csv("bodyfat.csv")
hist(bodyfat_data$percent.body.fat)

columns <- c('weight.lbs.',  'height.inches.')
for (col in columns){
  bodyfat_data <- clean_data(col, bodyfat_data)
}


hist(bodyfat_data$percent.body.fat)
plot(bodyfat_data$age, bodyfat_data$percent.body.fat)


#----------------------------------
#  Project 6
#----------------------------------
N <- 5


for (val in 1:N){
  x <- val
  stopping_time <- 0
  while (x > 1){
    stopping_time <- stopping_time + 1

    if(x %% 2 == 0){
      x <- x/2
    } else {
      x <- 3*x + 1
    }
  }
  cat("\t", val, "\t", stopping_time, "\n")
}

#----------------------------------
#  Project 7
#----------------------------------
# By reading the description carefully, we see that there are 5 cases 
#    to consider:
#    1. 81 or higher is too hot;
#    2. 66 or lower is too cold;
#    3. At 70 degrees, the humidity must between 12 and 72
#    4. If over 70 degrees, the humidity must decrease by 
#       1.25 units for every degree over 70
#    5. If under 70 degrees, the humidity must increase by 
#       4 units for every degree under 70


get_comfort_level <- function(Temp, humid){
  optimal_temp <- 70
  optimal_humid <- 42
  high_temp <- 81
  low_temp <- 66
  dec_factor <- 1.25
  inc_factor <- 4.0
  
  hot_message <- "Too Hot"
  cold_message <- "Too Cold"
  comfort_message <- "Comfortable"
  
  if (Temp >= high_temp){
    comfort_level <- hot_message
    
  } else if (Temp <= low_temp){
    comfort_level <- cold_message
    
  } else if (Temp == optimal_temp){
    if (humid < 12){
      comfort_level <- cold_message
    } else if (humid > 72){
      comfort_level <- hot_message
    } else {
      comfort_level <- comfort_message
    }
  }else if (Temp > optimal_temp){
    degrees_over <- Temp - optimal_temp
    max_humid <- optimal_humid - dec_factor*degrees_over
    
    if (humid <= max_humid){
      comfort_level <- comfort_message
    }else{
      comfort_level <- hot_message
    }
    
  } else {
    degrees_under <- optimal_temp - Temp
    min_humid <- optimal_humid + inc_factor*degrees_under
    if (humid >= min_humid){
      comfort_level <- "comfortable"
    }else{
      comfort_level <- "Too Cold"
    }
  }

  
  return(comfort_level)
  
}

Temp <- 70
humid <- 50

comfort_level <- get_comfort_level(Temp, humid)

cat( "\nAt temperature = ", Temp, 
     "\n  and humidity = ", humid, 
     "\n comfort level = ", comfort_level, "\n")

#----------------------------------
#  Project 7 Alternate Approach
#----------------------------------
# Another way to handle the multiple conditions is to 
# look for all of the cases that would be too hot or too cold
# Too hot:
#    1. 81 or higher is too hot;
#    2. 70 degress and humidity greater than 72
#    3. Between 70 and 81 degrees and humidity is greater than 42 - 1.25*(temp-70)
# Too Cold
#    1. 66 or lower is too cold;
#    2. 70 degrees and humidity lower than 12
#    3. Between 70 and 66 degrees and humidity is less than 42 + 4.0*(70-temp)
#
#    Everything else would be comfortable


get_comfort_level <- function(Temp, humid){
  
  optimal_temp <- 70
  high_temp <- 81
  low_temp <- 66
  
  optimal_humid <- 42
  high_humid <- 72
  low_humid <- 12
  
  dec_factor <- 1.25
  inc_factor <- 4.0
  
  hot_message <- "Too Hot"
  cold_message <- "Too Cold"
  comfort_message <- "Comfortable"
  
  hot_condition <- (Temp >= high_temp) || 
                   (Temp == optimal_temp && humid > high_humid) ||
                   (Temp > optimal_temp && Temp < high_temp && 
                   humid > optimal_humid - dec_factor*(Temp-optimal_temp))
  
  cold_condition <- (Temp <= low_temp) || 
                    (Temp == optimal_temp && humid < low_humid) ||
                    (Temp > optimal_temp && Temp < high_temp && 
                    humid < optimal_humid + inc_factor*(optimal_temp - Temp))
  
  if (hot_condition){
    comfort_level <- hot_message
  } else if (cold_condition){
    comfort_level <- cold_message
  } else {
    comfot_level <- comfort_message
  }

  
  return(comfort_level)
  
}

Temp <- 75
humid <- 28

comfort_level <- get_comfort_level(Temp, humid)

cat( "\nAt temperature = ", Temp, 
     "\n  and humidity = ", humid, 
     "\n comfort level = ", comfort_level, "\n")
