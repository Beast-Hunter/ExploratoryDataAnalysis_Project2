# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Aggregating data
baltimoreData = subset(NEI,fips == "24510")
data = aggregate(Emissions~year, data = baltimore, sum)

# Plot data
png("plot2.png")
barplot(data$Emissions, names.arg = data$year, col="blue", xlab = "Year", ylab = "Total PM2.5 Emissions(tons)", main = "Total PM2.5 Emissions in Baltimore City, Maryland", beside = TRUE)
dev.off()
