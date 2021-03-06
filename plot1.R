# Dataset: Electric power consumption 
# Measurements of electric power consumption in one household with a one-minute sampling 
# rate over a period of almost 4 years. 

# loading the data (entire dataset)
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

# selecting the data from the desirable dates: 1 Feb 2007 and 2 Feb 2007 
selectedPower <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# removing the dataset in order to free memory 
remove(power)

# convert the date variable to Date class 
selectedPower[,1] <- as.Date(selectedPower[,1],"%d/%m/%Y")

# open png for plotting
png("plot1.png")

# plotting first graph in a PNG format - size 480x480 is default value of width and height
# frequency histogram of Global_active_power variable, color = red
with(selectedPower, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red"))

# close device (and save plot to png file)
dev.off()
