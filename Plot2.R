
# Aim is to
# - read the household_power_consumption.txt file
# - subset for data taken from 2 days: 2007-02-01 and 2007-02-02
# - plot globalactivepower vs date&time

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

# plot globalactivepower vs date&time
png("plot2.png", width=480, height=480)
with(data, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()

