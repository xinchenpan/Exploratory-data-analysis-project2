NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png",width=480,height=480)
PM_USA <- aggregate(NEI[,4],by=list(NEI$year),sum)

barplot(PM_USA[,2]/1000 ,names.arg=PM_USA[,1],main="Total emissions from PM2.5 in US from 1999 to 2008",xlab="Year",ylab="total emissions from PM2.5 in kilotons")
dev.off()
