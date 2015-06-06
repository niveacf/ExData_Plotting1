# Dataset: Electric power consumption 
# Measurements of electric power consumption in one household with a one-minute sampling 
# rate over a period of almost 4 years. 

# loading the data (entire dataset)
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# selecting the data from the desirable dates: 1 Feb 2007 and 2 Feb 2007 
selectedPower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# removing the dataset in order to free memory 
remove(power)

# convert the date variable to Date class, create a new date+time variable of Time class  
selectedPower[,1] <- as.Date(selectedPower[,1],"%d/%m/%Y")
selectedPower$New_Date <- with(selectedPower, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# open png for plotting
png("plot4.png")

# plotting fourth graph in a PNG format - size 480x480 is default value of width and height
# Four plots (2x2 grid): 1. Date/Time x Global_active_power; 2. Date/Time x Voltage; 
#   3. Date/Time x each of the 3 sub metering; 4. Date/Time x Global_reactive_power
par(mfrow = c(2, 2), mar=c(4,4,2,2), oma=c(1.5,2,1,1))
with(selectedPower, {
  # plot 1
  plot(New_Date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
  # plot 2
  plot(New_Date, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  # plot 3 
  plot(New_Date, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  lines(New_Date, Sub_metering_2, type="l", col="red")
  lines(New_Date, Sub_metering_3, type="l", col="blue")
  legend("topright", col = c("black", "blue", "red"), lty = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # plot 4 
  plot(New_Date, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")
})

# close device (and save plot to png file)
dev.off()