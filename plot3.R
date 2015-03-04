plot3 <- function() {
  
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
  
  # Plot 3
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  x1 <- hpc$Sub_metering_1; x2 <- hpc$Sub_metering_2; x3 <- hpc$Sub_metering_3
  plot(x1, xlab="", ylab="Energy sub metering", xaxt="n", type="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  points(x1, type="l")
  points(x2, type="l", col="red")
  points(x3, type="l", col="blue")
  legend("topright", lty="solid", col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off() #closes the graphics device

}
