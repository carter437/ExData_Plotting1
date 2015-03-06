library("lubridate")
library("dplyr")
library("datasets")
setwd(".")
DT <- read.csv("./dataset/household_power_consumption.txt", sep=";", head=F, skip=66637, nrows=2979, na.strings=c("?"), strip.white=T)
DT<- rename(DT,date=V1, time=V2, global_active_power=V3,global_reactive_power=V4,voltage=V5,global_intensity=V6,sub_metering_1=V7,sub_metering_2=V8,sub_metering_3=V9)
DT[,1] <- dmy(DT[,1])
hist