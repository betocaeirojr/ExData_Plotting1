setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot2.png", width=480, height=480)

#Second plot
NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year))
#with(NEIBaltimore, plot(year, log10(Emissions), ylab = "log 10 Emissions PM2.5"))
with(NEIBaltimore, plot(year, Emissions, ylab = "Emissions PM2.5"))


# Copying to PNG File
dev.off()