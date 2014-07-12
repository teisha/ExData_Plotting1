run_plot2 <- function() {
  png(filename="plot2.png",
      width = 480,
      height = 480)
  plot(power.consumption$Date,
       power.consumption$Global_active_power,
       type="l", 
       ylab="Global Active Power (kilowatts)",
       xlab="",
       col="black")
  dev.off()
}
