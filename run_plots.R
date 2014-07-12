getdata <- function () {
  #reads the file, pulling only the data
  #where the record starts with the 1st or 2nd of February 2007
  file.data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                          header=F, 
                          sep=';',
                          na.strings ="?",
                          colClasses=c("character","character",rep("numeric",7)))  
  #Pull the first record of the file in for column names
  colnames(file.data) = read.table("household_power_consumption.txt", 
                                   sep=";",
                                   nrows=1,
                                   colClasses=c(rep("character",9))
  )
  
  #Convert the first two character fields with date and time
  #into a POSIX date
  power.consumption = cbind (
    strptime(
        paste(file.data$Date, file.data$Time, sep=" "),
        "%d/%m/%Y %H:%M:%S"),
    file.data[,3:9] )
  colnames(power.consumption)[1] = "Date"
  
  power.consumption
}


run_plot1 <- function() {
  png(filename="global_active_power.png",
      width = 480,
      height = 480)
  hist(power.consumption$Global_active_power, 
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  dev.off()
}


run_plot2 <- function() {
  png(filename="global_active_power_2.png",
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

run_plot3 <- function() {
  png(filename="energy_sub_meter.png",
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

run_plot4 <- function() {
  png(filename="four_plots.png",
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




run_plots <- function() {
  getdata()
  run_plot1()
  run_plot2()
  run_plot3()
  run_plot4()
}