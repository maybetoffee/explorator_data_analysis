getwd()
setwd("D:/coursera_R")
#loading the data
data<-read.table("./household_power_consumption.txt",header=T,sep=";",na.string="?")
#convert the data variable to data format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,subset = (Date>="2007-02-01" & Date<="2007-02-02"))
#convert date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#plot2
data$datetime <- as.POSIXct(data$datetime)
#POSIXct以符号整数形式存储
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#save the image and close the device
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
