plot2 <- function() {
  
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
  
  # Plot 2
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  x <- hpc$Global_active_power
  plot(x, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n")
  axis(side = 1, at = c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  dev.off() #closes the graphics device

}