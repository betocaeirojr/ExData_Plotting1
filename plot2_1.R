## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)

with(NEI, plot(year, log10(Emissions), ylab="log 10 PM2.5"))
