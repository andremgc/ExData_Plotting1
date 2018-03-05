#setwd("./ExData_Plotting1")
library(tidyr)
dat<- read.table("household_power_consumption.txt", 
                  sep=";",na.strings=c("NA", "-", "?"), header=T)

dat<-unite(dat,"Time",c("Date","Time"), sep= " ")

dat$Time<-as.POSIXct(as.character(dat$Time),format="%d/%m/%Y %H:%M:%OS", tz="GMT")

dat<-dat[dat$Time>=
             as.POSIXct(as.character("2007-02-01"),format="%Y-%m-%d", tz="GMT"),]

dat<-dat[dat$Time<
             as.POSIXct(as.character("2007-02-03"),format="%Y-%m-%d", tz="GMT"),]


hist(dat$Global_active_power, col="red", xlab="Global Active Power (killowatts)",
     main = "Global Active Power" )
dev.copy(png,"plot1.png")
dev.off()





