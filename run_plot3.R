run_plot3 <- function() {
  source("getdata.R")
  getdata()
  png(filename="plot3.png",
      width = 480,
      height = 480)
  #Create plot with first line
  plot(power.consumption$Date,
       power.consumption$Sub_metering_1,
       type="l", 
       ylab="Energy sub metering",
       xlab="",
       col="black")
  #Add second data line
  lines(power.consumption$Date,
        power.consumption$Sub_metering_2, 
        lty=1, 
        col="red")
  #Add third data line
  lines(power.consumption$Date,
        power.consumption$Sub_metering_3, 
        lty=1, 
        col="blue")
  #Add legend to plot
  legend("topright", lty=1,
         col = c("black","red","blue"), 
         legend = colnames(power.consumption)[6:8])
  dev.off()
}

