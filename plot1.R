data <- read.table("household_power_consumption.txt",header=TRUE,sep=';')
data$Date <- as.Date(data$Date,"%d/%m/%Y")
start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
var <- data$Date >= start & data$Date <= end
data <- data[var,]
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")

hist(as.numeric(data$Global_active_power),xlab="Global Active Power (Killowats)",col = "red",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()