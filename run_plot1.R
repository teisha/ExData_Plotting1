run_plot1 <- function() {
  source("getdata.R")
  getdata()
  png(filename="plot1.png",
      width = 480,
      height = 480)
  hist(power.consumption$Global_active_power, 
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  dev.off()
}

