library("datasets")
source("readDataSet.R")

plot1 <- function(){
  DT <- readDataSet()
  hist(DT$global_active_power,col="red",xlab="Global Active Power",main="Global Active Power")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()  
}

plot1()

