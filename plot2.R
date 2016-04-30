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

#global active power over time
png(filename="plot2.png")
with(data,plot(dateTime,as.numeric(Global_active_power),type="l",
               ylab="Global Active Power (killowatts)",xlab=""))
dev.off()


