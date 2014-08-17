setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)

#First Plot
with(NEI, plot(year, log10(Emissions), ylab="Emissions PM2.5"))
with(NEI, plot(year, Emissions, ylab="Emissions PM2.5"))


#Second plot
NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year))
with(NEIBaltimore, plot(year, log10(Emissions), ylab = "log 10 Emissions PM2.5"))
with(NEIBaltimore, plot(year, Emissions, ylab = "Emissions PM2.5"))

# Third Plot
library(ggplot2)
NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year, type))
qplot(year, Emissions, data=NEIBaltimore, 
      facets= . ~ type, geom = c("point", "smooth"), color = type)

# Fourth Plot
scccode <- subset(SCC, EI.Sector=="Fuel Comb - Electric Generation - Coal", SCC)
NEICoal <- subset(NEI, SCC == scccode$SCC)
qplot(year, Emissions, data=NEICoal, color = type)

