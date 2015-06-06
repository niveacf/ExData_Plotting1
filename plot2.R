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
png("plot2.png")

# plotting second graph in a PNG format - size 480x480 is default value of width and height
# line plot of Date/Time x Global_active_power
with(selectedPower, plot(New_Date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# close device (and save plot in png file)
dev.off()