library("datasets")
library("reshape2")
source("readDataSet.R")

plot2 <- function(){
  DT <- readDataSet()
  plot(DT$global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)", frame.plot=T,axes=F)
  axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))
  axis(2, at=c(0,2,4,6))
}

plot3 <- function(){
  DT <- readDataSet()
  DT <- melt(DT, id.vars="date", measure.vars=c("sub_metering_1","sub_metering_2","sub_metering_3"))
  
  plot(subset(DT, variable=="sub_metering_1")$value,type="l", ylab="Energy sub metering", xaxt="n", xlab="")
  lines(subset(DT, variable=="sub_metering_2")$value, col="red")
  lines(subset(DT, variable=="sub_metering_3")$value, col="blue")
  legend("topright", col = c("black", "blue", "red"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lwd=c(2.5,2.5,2.5), lty=c(1,1,1))
  axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))  
}



voltagePlot <- function(){
  DT <- readDataSet()
  plot(DT$voltage,type="l",xlab="        datetime",ylab="Voltage", frame.plot=T, xaxt="n")
  axis(1, at=c(0, 1500, 2880), main="datetime", labels=c("Thur","Fri","Sat"))
  axis(2, at=c(0,2,4,6))
}

voltagePlot()

#plot4 <- function(){
#  
#}

#plot4()