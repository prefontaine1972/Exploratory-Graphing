file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Globalactivepower <- as.numeric(subSetData$Global_active_power)
Globalreactivepower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, Globalactivepower, xlab="", ylab="Global Active Power", type="l", cex=0.2)
plot(datetime, voltage, xlab="datetime", ylab="Voltage", type="l",)
plot(datetime, subMetering1,ylab="Energy sub metering", xlab="", type="l")

lines(datetime, subMetering2, col="red", type="l")
lines(datetime, subMetering3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

plot(datetime, Globalreactivepower, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()