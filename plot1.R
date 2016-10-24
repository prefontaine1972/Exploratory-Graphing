file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

Globalactivepower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Globalactivepower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()