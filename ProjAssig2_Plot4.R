setwd("/Users/acaeiro/Developer/Data Science Specialization/ExData_Plotting1")

library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("../exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("../exdata-data-NEI_data/Source_Classification_Code.rds")

# Copying to PNG File
png("./ProjAssig2_Plot4.png", width=800, height=600)

#Fourth Plot
scccode <- subset(SCC, EI.Sector=="Fuel Comb - Electric Generation - Coal", SCC)
NEICoal <- subset(NEI, SCC == scccode$SCC)
qplot(year, log10(Emissions), data=NEICoal)
# Copying to PNG File
dev.off()