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

#global active power histogram
with(data,hist(as.numeric(Global_active_power),col="red",
     xlab="Global Active Power (killowatts)",main="Global Active Power"))

png(filename="plot1.png")
with(data,hist(as.numeric(Global_active_power),col="red",
               xlab="Global Active Power (killowatts)",main="Global Active Power"))
dev.off()


