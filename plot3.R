library("datasets")
library("reshape2")

readDataSet <- function() {
  DT <- read.csv("./dataset/household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2880, na.strings=c("?"), strip.white=T)
  DT[,1] <- wday(dmy(DT[,1]),label=T)
  DT<- rename(DT,date=V1, time=V2, global_active_power=V3,global_reactive_power=V4,voltage=V5,global_intensity=V6,sub_metering_1=V7,sub_metering_2=V8,sub_metering_3=V9)  
}

plot3 <- function(){
  par(mfrow=c(1,1))
  DT <- readDataSet()
  DT <- melt(DT, id.vars="date", measure.vars=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  plot(subset(DT, variable=="sub_metering_1")$value,type="l", ylab="Energy sub metering", xaxt="n", xlab="")
  lines(subset(DT, variable=="sub_metering_2")$value, col="red")
  lines(subset(DT, variable=="sub_metering_3")$value, col="blue")
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lwd=c(2.5,2.5,2.5), lty=c(1,1,1))
  axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))  
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()  
}

plot3()


