setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot5.png", width=800, height=600)

#Fifth Plot
mobileVehicles <- subset(SCC, EI.Sector == grep("Vehicles$", EI.Sector, value=TRUE), SCC)
NEI24510 <- subset(NEI, fips == "24510")
NEI24510Vehicles <- subset(NEI24510, SCC %in% mobileVehicles$SCC, c(Emissions, year))
qplot(year, Emissions, data=NEI24510Vehicles)


# Copying to PNG File
dev.off()