setwd("/Users/acaeiro/Developer/Data Science Specialization/ExplData")

## Reading the data from the file
colNames <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1)
data <- read.table(file="household_power_consumption.txt", col.names=names(colNames), sep=";", na.strings="?", 
                   skip=66637, nrows=2880, stringsAsFactors=FALSE)
# Converting Date and Time
data$DateTime <- paste(data$Date, data$Time, sep="|")
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y|%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Copying to PNG File
png("./plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
#1,1
plot(data$DateTime, data$Global_active_power,  ylab="Global Active Power (kilowatts)", xlab= "", type="l")
#1,2
plot(data$DateTime, data$Voltage, ylab="Voltage (volts)", xlab="Date-Time", xlab= "", type="l")
#2,1
plot(data$DateTime, data$Sub_metering_1, ylab="Energy Sub Metering", type="n")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", pch=c(45,45,45), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#2,2
plot(data$DateTime, data$Global_reactive_power, ylab="Global Reactive Power (kilowatts)" , xlab="Date-Time", type="l")

#Closing File
dev.off()
