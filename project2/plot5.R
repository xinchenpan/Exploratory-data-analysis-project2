library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png("plot5.png",width=480,height=480)

Baltimore<-subset(NEI,fips == "24510" &type=="ON-ROAD")

PM_Baltimore <- aggregate(Baltimore[,4],by=list(Baltimore$year),sum)

ggplot(PM_Baltimore, aes(PM_Baltimore[,1], PM_Baltimore[,2] )) + geom_line(color='red') + geom_point()+xlab("year") + ylab("emissions from motor vehicle")+
  ggtitle("Emissions from motor vehicle sources in Baltimore")

dev.off()
