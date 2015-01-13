library(ggplot2)
library(dplyr)
library(grid)
library(gridExtra)
png("plot3.png",height=635,width=1231)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore <- subset(NEI,fips == "24510")
PM_Baltimore <- aggregate(Baltimore[,4],by=list(Baltimore$type,Baltimore$year),sum)
PM_Baltimore1 <- arrange(PM_Baltimore,Group.1)
NONROAD <- subset(PM_Baltimore1,PM_Baltimore1[,1]=="NON-ROAD")

ONROAD <- subset(PM_Baltimore1,PM_Baltimore1[,1]=="ON-ROAD")

POINT <- subset(PM_Baltimore1,PM_Baltimore1[,1]=="POINT")

NONPOINT <-subset(PM_Baltimore1,PM_Baltimore1[,1]=="NONPOINT")


emission_nonroad<-NONROAD[,3]
emission_onroad<-ONROAD[,3]
emission_nonpoint<-NONPOINT[,3]
emission_point<-POINT[,3]

year <- NONROAD[,2]

barplot1<- qplot(x=year,y=emission_nonroad,fill=year,data=NONROAD, geom="bar", stat="identity",position="dodge")+ggtitle("Emissions from NON-ROAD")

barplot2<- qplot(x=year,y=emission_onroad,fill=year,data=ONROAD, geom="bar", stat="identity",position="dodge")+ggtitle("Emissions from ON-ROAD")

barplot3<- qplot(x=year,y=emission_point,fill=year,data=POINT, geom="bar", stat="identity",position="dodge")+ggtitle("Emissions from POINT")

barplot4<- qplot(x=year,y=emission_nonpoint,fill=year,data=NONPOINT, geom="bar", stat="identity",position="dodge")+ggtitle("Emissions from NONPOINT")


grid.arrange(barplot1, barplot2,barplot3, barplot4,ncol=2)
dev.off()
