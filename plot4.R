# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Merge dataset
NEISCC <- merge(NEI, SCC, by="SCC")

# Aggregating data
coalData  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCC <- NEISCC[coalData, ]

data <- aggregate(Emissions ~ year, NEISCC, sum)

png("plot4.png")
barplot(data$Emissions, names.arg=data$year,col=c("blue","red"), xlab="Year", ylab="Coal Combustion PM2.5 Emissions(tons)", main="Coal Combustion Emissions in the U.S.(1999–2008)")
dev.off()