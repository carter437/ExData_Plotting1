library("datasets")
source("readDataSet.R")

plot2 <- function(){
  DT <- readDataSet()
  plot(DT$global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)", frame.plot=T,axes=F)
  axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))
  axis(2, at=c(0,2,4,6))
}

plot2()

