setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot6.png", width=480, height=480)

#Sixth Plot
NEI06037 <- subset(NEI, fips == "06037")
NEI06037Vehicles <- subset(NEI06037, SCC %in% mobileVehicles$SCC, c(Emissions, year))
qplot(year, Emissions, data=NEI06037Vehicles)

NEI24510Vehicles$State <- "Baltimore"
NEI06037Vehicles$State <- "Los Angeles"
compBalt_LA <- rbind(NEI24510Vehicles, NEI06037Vehicles)
qplot(year, Emissions, data=compBalt_LA, facets = . ~ State , color = State, geom = c("line", "smooth"))

# Copying to PNG File
dev.off()