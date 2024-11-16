# Reading data
NEI = readRDS("./summarySCC_PM25.rds")
SCC = readRDS("./Source_Classification_Code.rds")

# Aggregating data
vehicleSCC = SCC[grep("Vehicle",SCC$EI.Sector),"SCC"]
vehicleBaltimore=NEI[NEI$SCC %in% vehicleSCC & NEI$fips %in% c("24510","06037"), ]
vehicleBaltimore$city = ifelse(vehicleBaltimore$fips=="24510", "Baltimore", "Los Angeles")

data = aggregate(Emissions~year+city,data=vehicleBaltimore,sum)

# Plot data
png("plot6.png")
ggplot(data,aes(x=factor(year),y=Emissions,fill=city))+geom_bar(stat="identity",position="dodge")+labs(title="Motor Vehicle PM2.5 Emissions: Baltimore vs. Los Angeles",x="Year",y="PM2.5 Emissions(tons)")+theme_minimal()+scale_fill_manual(values=c("green", "blue"))
dev.off()
