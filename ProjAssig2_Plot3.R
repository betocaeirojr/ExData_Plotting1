setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot3.png", width=480, height=480)

NEIBaltimore <- subset(NEI, fips == "24510", c(Emissions, year, type))
qplot(year, Emissions, data=NEIBaltimore, 
      facets= . ~ type, geom = c("point", "smooth"), color = type)

# Copying to PNG File
dev.off()