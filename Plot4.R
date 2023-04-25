# Aim is to
# - read the household_power_consumption.txt file
# - subset for data taken from 2 days: 2007-02-01 and 2007-02-02
# - plot 4th graph

# read data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?")

# check data sample
head(data)

## Create column in table with date and time merged together
FullTimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, FullTimeDate)

# change data in proper class

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

# subset data from 2007-02-01 and 2007-02-02
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot the 4 graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(data, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(data, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$FullTimeDate, data$Sub_metering_2,type="l", col= "red")
lines(data$FullTimeDate, data$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(data, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()