plot1 <- function() {
  
  # read header and first line
  first_line <- read.table("household_power_consumption.txt", 
                     nrow=1, 
                     header=TRUE,
                     stringsAsFactors=FALSE,
                     sep = ";")
  
  # create a vector of column names
  col_names <- names(first_line)

  # read in the lines for Feb 1-2, 2007 while also reading the column names
  hpc <- read.table("household_power_consumption.txt", 
                    skip=66637, 
                    nrow=2880, 
                    header=FALSE, 
                    stringsAsFactors=FALSE, 
                    sep = ";",
                    col.names = col_names)
  
  # Plot 1
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  x <- hpc$Global_active_power
  hist(x, col="red", xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  dev.off() #closes the graphics device

}
