setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot1.png", width=480, height=480)

#First Plot
#with(NEI, plot(year, log10(Emissions), ylab="Emissions PM2.5"))
with(NEI, plot(year, Emissions, ylab="Emissions PM2.5"))

# Copying to PNG File
dev.off()