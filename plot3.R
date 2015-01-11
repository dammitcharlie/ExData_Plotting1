#load all data, subset to relevant dates, and then drop the entire dataset from memory
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
DF <- subset(all_data, Date=="1/2/2007" | Date=="2/2/2007")
rm(all_data)

#Convert Date and Time to POSIXlt class
DF$DateTime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

#open graphics device, make plot, close graphics device
png("plot3.png")
plot(DF$DateTime, DF$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(DF$DateTime, DF$Sub_metering_2, col="red")
lines(DF$DateTime, DF$Sub_metering_3, col="blue")
legend("topright", lty=1,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), cex=.97)
dev.off()