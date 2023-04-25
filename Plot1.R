
# Aim is to
# - read the household_power_consumption.txt file
# - subset for data taken from 2 days: 2007-02-01 and 2007-02-02
# generate a histogram of global active power
  
# read data
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",na.strings = "?")

# check data sample
head(data)

# change data in proper class

data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

# subset data from 2007-02-01 and 2007-02-02
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

