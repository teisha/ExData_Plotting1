run_plot4 <- function() {
  png(filename="plot4.png",
      width = 480,
      height = 480)
  #Arrange 4 plots in a single window
  par(mfrow=c(2,2))
  
  #Upper Left-Hand Corner plot
  plot(power.consumption$Date,
       power.consumption$Global_active_power,
       type="l", 
       ylab="Global Active Power",
       xlab="",
       col="black")
  #Upper Right-Hand Corner plot
  plot(power.consumption$Date,
       power.consumption$Voltage,
       type="l", 
       ylab="Voltage",
       xlab="datetime",
       col="black")
  #Lower Left-Hand Corner plot
  plot(power.consumption$Date,
       power.consumption$Sub_metering_1,
       type="l", 
       ylab="Energy sub metering",
       xlab="",
       col="black")
  lines(power.consumption$Date,
        power.consumption$Sub_metering_2, 
        lty=1, 
        col="red")
  lines(power.consumption$Date,
        power.consumption$Sub_metering_3, 
        lty=1, 
        col="blue")
  legend("topright", lty=1,
         col = c("black","red","blue"), 
         bty="n",
         legend = colnames(power.consumption)[6:8])
  #Lower Right-Hand Corner Plot
  plot(power.consumption$Date,
       power.consumption$Global_reactive_power,
       type="l", 
       ylab="Global_reactive_power",
       xlab="datetime",
       col="black")
  
  dev.off()
}