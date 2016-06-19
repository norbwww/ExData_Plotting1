data_temp <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_main <- data_temp[data_temp$Date %in% c("1/2/2007","2/2/2007"), ]
data_main$datetime <- strptime(paste(data_main$Date, data_main$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
rm(data_temp)
png("plot1.png", width=480, height=480)
hist(as.numeric(data_main$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()