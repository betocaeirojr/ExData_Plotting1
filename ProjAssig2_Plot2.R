setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot2.png", width=800, height=600)

#Second plot
par(mfrow=c(1,2))
NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year))
with(NEIBaltimore, plot(year, log10(Emissions), ylab = "log 10 Emissions PM2.5 - Baltimore City"))
with(NEIBaltimore, plot(year, Emissions, ylab = "Emissions PM2.5 - Baltimore City"))

# Copying to PNG File
dev.off()