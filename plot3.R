# Load ggplot2
library(ggplot2)

# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Aggregating data
baltimoreData = subset(NEI,fips == "24510")
data = aggregate(Emissions~year + type, data = baltimoreData, sum)

# Plot data
png("plot3.png")
ggplot(data, aes(year, Emissions, color = type)) + geom_line() + xlab("year") + ylab(expression('Total PM Emissions')) + ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
dev.off()