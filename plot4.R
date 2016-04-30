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

data$dateTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#sub_metering plot
png("plot4.png")
par(mfcol=c(2,2))
with(data,plot(dateTime,as.numeric(Global_active_power),type="l",
               ylab="Global Active Power (killowatts)",xlab=""))
with(data,plot(dateTime,as.numeric(Sub_metering_1),type="l",col="black",
                 ylab="Energy sub metering",xlab=""))
with(data,points(dateTime,as.numeric(Sub_metering_2),type="l",col="red"))
with(data,points(dateTime,as.numeric(Sub_metering_3),type="l",col="blue"))

leg.txt <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
leg.col <- c("black","red","blue")
legend("topright",legend=leg.txt,col=leg.col,lty=1,bty="n")
with(data,plot(dateTime,as.numeric(Voltage),type="l",ylab="Voltage"))
with(data,plot(dateTime,as.numeric(Global_reactive_power),type="l",ylab="Global_reactive_power"))
dev.off()


