plot4 <- function() {
  
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

  # Plot 4
  png(filename = "plot4.png", width=480, height=480, units = "px")
  par(mfcol=c(2,2))
  
  ## First plot uses the code from Plot 2
  x <- hpc$Date_Time
  y <- hpc$Global_active_power
  plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  ## Second plot uses the code from Plot 3
  y1 <- hpc$Sub_metering_1
  y2 <- hpc$Sub_metering_2
  y3 <- hpc$Sub_metering_3
  plot(x, y1, xlab="", ylab="Energy sub metering", type="n")
  points(x, y1, type="l")
  points(x, y2, type="l", col="red")
  points(x, y3, type="l", col="blue")
  legend("topright", lty="solid", bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Third plot
  y4 <- hpc$Voltage
  plot(x, y4, type="l", ylab="Voltage", xlab="datetime")
  
  ## Fourth plot
  y5 <- hpc$Global_reactive_power
  plot(x, y5, type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.off() #closes the graphics device

}
