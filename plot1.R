
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
png("./plot1.png", width=480, height=480)

#Drawing first plot
hist(data$Global_active_power, col="red", xlab="Global Active Power(kilowatts)", main="Global Active Power")

# Copying to PNG File
dev.off()

