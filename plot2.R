data <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
data$Date <- as.Date(data$Date,"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
var <- data$Date >= start & data$Date <= end
data <- data[var,]
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

par(mar=c(2,4,2,1))
plot(data$Time,data$Global_active_power,type = "l",ylab="Global Active Power (killowats)")
dev.copy(png, file = "plot2.png")
dev.off()