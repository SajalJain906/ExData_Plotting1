data <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
data$Date <- as.Date(data$Date,"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
var <- data$Date >= start & data$Date <= end
data <- data[var,]
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

png(file="plot3.png")

par(mar=c(2,4,2,1))

with(data,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering"))
with(data,points(Time,Sub_metering_2,type="l",col="red"))
with(data,points(Time,Sub_metering_3,type="l",col="blue"))
legend("topright", lwd=1 , col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()