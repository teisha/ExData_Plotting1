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


run_plots <- function() {
  getdata()
  source("run_plot1.R")
  run_plot1()
  source("run_plot2.R")
  run_plot2()
  source("run_plot3.R")
  run_plot3()
  source("run_plot4.R")
  run_plot4()
}