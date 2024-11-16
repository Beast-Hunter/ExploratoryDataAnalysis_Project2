# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Aggregating data
vehicleSCC = SCC[grep("Vehicle",SCC$EI.Sector),"SCC"]
vehicleBaltimore = NEI[NEI$SCC %in% vehicleSCC & NEI$fips=="24510", ]

data = aggregate(Emissions~year, data=vehicleBaltimore, sum)


# Plot data
png("plot5.png")
barplot(data$Emissions, names.arg=data$year,col="green", xlab="Year", ylab="Motor Vehicle PM2.5 Emissions(tons)",main="Motor Vehicle Emissions in Baltimore City (1999–2008)")
dev.off()
