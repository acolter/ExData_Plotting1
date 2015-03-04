plot4 <- function() {
  
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
  
  # Plot 4
  png(filename = "plot4.png", width=480, height=480, units = "px")
  par(mfcol=c(2,2))
  
  ## First plot uses the code from Plot 2
  x <- hpc$Global_active_power
  plot(x, type="l", xlab="", ylab="Global Active Power", xaxt="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  
  ## Second plot
  x1 <- hpc$Sub_metering_1; x2 <- hpc$Sub_metering_2; x3 <- hpc$Sub_metering_3
  plot(x1, xlab="", ylab="Energy sub metering", xaxt="n", type="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  points(x1, type="l")
  points(x2, type="l", col="red")
  points(x3, type="l", col="blue")
  legend("topright", lty="solid", bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Third plot
  x <- hpc$Voltage
  plot(x, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  
  ## Fourth plot
  x <- hpc$Global_reactive_power
  plot(x, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  dev.off() #closes the graphics device

}
