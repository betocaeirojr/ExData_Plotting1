library(ggplot2)

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

NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year, type))
qplot(year, Emissions, data=NEIBaltimore, 
      facets= . ~ type, geom = c("point", "smooth"), color = type)

# Fourth Plot
scccode <- subset(SCC, EI.Sector=="Fuel Comb - Electric Generation - Coal", SCC)
NEICoal <- subset(NEI, SCC == scccode$SCC)
qplot(year, log10(Emissions), data=NEICoal, color = type)

#Fifth Plot
mobileVehicles <- subset(SCC, EI.Sector == grep("Vehicles$", EI.Sector, value=TRUE), SCC)
NEI24510 <- subset(NEI, fips == "24510")
NEI24510Vehicles <- subset(NEI24510, SCC %in% mobileVehicles$SCC, c(Emissions, year))
qplot(year, Emissions, data=NEI24510Vehicles, title="Motor Vehicles Related Sources in Baltimore")

#Sixth Plot
NEI06037 <- subset(NEI, fips == "06037")
NEI06037Vehicles <- subset(NEI06037, SCC %in% mobileVehicles$SCC, c(Emissions, year))
qplot(year, Emissions, data=NEI06037Vehicles)

NEI24510Vehicles$State <- "Baltimore"
NEI06037Vehicles$State <- "Los Angeles"
compBalt_LA <- rbind(NEI24510Vehicles, NEI06037Vehicles)
qplot(year, Emissions, data=compBalt_LA, facets = . ~ State , color = State, geom = c("line", "smooth"))

