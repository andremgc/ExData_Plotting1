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


Sys.setlocale("LC_TIME","English")
par(mar=c(2,4,1,1))
plot(dat$Time,dat$Sub_metering_1, type='l', ylab="Enenrgy sub mettering",
     main = ""  ,xlab="")
lines(dat$Time,dat$Sub_metering_2, col="red")
lines(dat$Time,dat$Sub_metering_3, col="blue")
legend("topright", inset=0.05, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.copy(png,"plot3.png")
dev.off()
