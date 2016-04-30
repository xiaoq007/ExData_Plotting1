setwd("ExData_Plotting1")

## download zip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"household_power_consumption.zip",method="curl")

## load data and subset data then clean up R objects
hpc <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=F)
head(hpc);dim(hpc)
data <- subset(hpc,(Date=="1/2/2007")|(Date=="2/2/2007"))
head(data);dim(data)
rm(list=(ls()[ls()!="data"]))

data$dateTime <- paste(data$Date,data$Time); head(data)
data$weekday <- weekdays(strptime(data$dateTime,"%d/%m/%Y %H:%M:%S"))
Thu <- sum(data$weekday=="Thursday"); Fri <- sum(data$weekday=="Friday")
v1 <- c(0,Thu,Thu+Fri); v2 <- c("Thu","Fri","Sat")

#sub_metering
png("plot3.png")
with(data,plot(as.numeric(Sub_metering_1),type="n",
               ylab="Energy sub metering",xlab="",xaxt="n"))

with(data,points(as.numeric(Sub_metering_1),type="l",col="black"))
with(data,points(as.numeric(Sub_metering_2),type="l",col="red"))
with(data,points(as.numeric(Sub_metering_3),type="l",col="blue"))

axis(1, at=v1,labels=v2)

leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
leg.col <- c("black","red","blue")
legend("topright",legend=leg.txt,col=leg.col,lty=1)

dev.off()


