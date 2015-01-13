NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png("plot2.png",width=480,height=480)
Baltimore<-subset(NEI,fips == "24510")
PM_Baltimore <- aggregate(Baltimore[,4],by=list(Baltimore$year),sum)
head(PM_Baltimore)

barplot(PM_Baltimore[,2], names.arg=PM_Baltimore[,1],main="Total emissions from PM2.5 in Baltimore from 1999 to 2008",xlab="Year",ylab="PM2.5 in ton")
dev.off()