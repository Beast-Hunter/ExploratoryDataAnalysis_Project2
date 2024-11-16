# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Aggregating data
data = aggregate(Emissions~year, data = NEI, sum)

# Plot data
png("plot1.png")
barplot(data$Emissions, names.arg = data$year, col="red", xlab = "Year", ylab = "Total PM2.5 Emissions(tons)", main = "Total PM2.5 Emissions in the U.S.(1999–2008)", beside = TRUE)
dev.off()
