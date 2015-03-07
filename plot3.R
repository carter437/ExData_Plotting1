library("datasets")
library("reshape2")
source("readDataSet.R")

DT <- readDataSet()
DT[,1] <- wday(dmy(DT[,1]),label=T)
DT <- DTM <- melt(DT, id.vars="date", measure.vars=c("sub_metering_1","sub_metering_2","sub_metering_3"))

plot(subset(DT, variable=="sub_metering_1")$value,type="l", ylab="Energy sub metering", xaxt="n", xlab="")
lines(subset(DT, variable=="sub_metering_2")$value, col="red")
lines(subset(DT, variable=="sub_metering_3")$value, col="blue")
legend("topright", col = c("black", "blue", "red"), legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), lwd=c(2.5,2.5,2.5), lty=c(1,1,1))
axis(1, at=c(0, 1500, 2880), labels=c("Thur","Fri","Sat"))



