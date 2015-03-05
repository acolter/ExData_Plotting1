plot1 <- function() {
  
  library(lubridate)
  
  # read header and first line
  first_line <- read.table("household_power_consumption.txt", 
                     nrow=1, 
                     header=TRUE,
                     #stringsAsFactors=FALSE,
                     colClasses=c(rep("character", 2), rep("numeric", 7)),
                     sep = ";")
  
  # create a vector of column names
  col_names <- names(first_line)

  # read in the lines for Feb 1-2, 2007 while also reading the column names
  hpc <- read.table("household_power_consumption.txt", 
                    skip=66637, 
                    nrow=2880, 
                    header=FALSE, 
                    #stringsAsFactors=FALSE,
                    colClasses=c(rep("character", 2), rep("numeric", 7)),
                    sep = ";",
                    col.names = col_names)
  
  # Convert date and time columns from character to date/time, then combine
  hpc$Date <- dmy(hpc$Date)
  hpc$Time <- hms(hpc$Time)
  hpc$Date_Time <- hpc$Date + hpc$Time
  
  # Plot 1
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  x <- hpc$Global_active_power
  hist(x, col="red", xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  dev.off() #closes the graphics device

}
