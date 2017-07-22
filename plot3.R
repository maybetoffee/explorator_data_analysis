getwd()
setwd("D:/coursera_R")
#loading the data
data<-read.table("./household_power_consumption.txt",header=T,sep=";",na.string="?")
#convert the data variable to data format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data<-subset(data,subset = (Date>="2007-02-01" & Date<="2007-02-02"))
#convert date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#plot3
head(data)
plot(Sub_metering_1 ~ datetime,type="l",ylab="Energy Sub Metering")
lines(Sub_metering_2 ~ datetime,col=2)
lines(Sub_metering_3 ~ datetime,col=4)
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Submetering_2","Sub_metering_3"))
#save the image and close the device
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

