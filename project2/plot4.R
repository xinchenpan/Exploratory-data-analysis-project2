NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png("plot4.png",width=480,height=480)
coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
merged <-merge(NEI,coal,by="SCC")
shanxi <- aggregate(merged[,4], list(year = merged$year), sum)

plot(shanxi[,1],shanxi[,2]/1000,main="Total emissions from PM2.5 from coal combustion-related sources",xlab="Year",ylab="PM2.5 in kiloton")
lines(shanxi[,1],shanxi[,2]/1000,)
dev.off()
