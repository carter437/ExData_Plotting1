library("datasets")

readDataSet <- function() {
  DT <- read.csv("./dataset/household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, na.strings=c("?"), strip.white=T)
  DT[,1] <- wday(dmy(DT[,1]),label=T)
  DT<- rename(DT,date=V1, time=V2, global_active_power=V3,global_reactive_power=V4,voltage=V5,global_intensity=V6,sub_metering_1=V7,sub_metering_2=V8,sub_metering_3=V9)  
}

plot2 <- function(){
  par(mfrow=c(1,1))
  DT <- readDataSet()
  plot(DT$global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)", frame.plot=T,axes=F)
  axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))
  axis(2, at=c(0,2,4,6))
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off()  
}

plot2()

