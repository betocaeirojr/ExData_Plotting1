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
png("./plot3.png", width=480, height=480)


plot(data$DateTime, data$Sub_metering_1, ylab="Energy Sub Metering", type="n")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", pch=c(45,45,45), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Copying to PNG File
dev.off()
