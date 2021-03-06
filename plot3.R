data_temp <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_main <- data_temp[data_temp$Date %in% c("1/2/2007","2/2/2007"), ]
data_main$datetime <- strptime(paste(data_main$Date, data_main$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
rm(data_temp)
png("plot3.png", width=480, height=480)
plot(data_main$datetime, data_main$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (kilowatts)")
lines(data_main$datetime, data_main$Sub_metering_2, col="red")
lines(data_main$datetime, data_main$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()