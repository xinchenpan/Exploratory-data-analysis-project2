library(ggplot2)
png("plot6.png",height=480,width=480)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Lostimore<- subset(NEI,(fips == "24510"|fips=="06037" )& type=="ON-ROAD")

PM_Lostimore <- aggregate(Lostimore[,4],by=list(Lostimore$year,Lostimore$fips),sum)

PM_Lostimore[,2]<-ifelse(PM_Lostimore[,2]=='24510','Baltimore','Los Angeles')
City <- PM_Lostimore[,2]
ggplot(PM_Lostimore,aes(x=PM_Lostimore[,1], y=PM_Lostimore[,3],group=City,color= City))+ geom_point()+geom_line()+
  xlab("year") + ylab("Emissions from motor vehicle")+ ggtitle("Emissions from motor vehicle in Baltimore and Los Angeles") 
dev.off()
