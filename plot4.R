#load all data, subset to relevant dates, and then drop the entire dataset from memory
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
DF <- subset(all_data, Date=="1/2/2007" | Date=="2/2/2007")
rm(all_data)

#Convert Date and Time to POSIXlt class
DF$DateTime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

#open graphics device, make plot, close graphics device
png("plot4.png")
par(mfrow = c(2, 2)) #set parameter for how to arrange the four graphs
#first plot
plot(DF$DateTime, DF$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
#second plot
plot(DF$DateTime, DF$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
#third plot
plot(DF$DateTime, DF$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(DF$DateTime, DF$Sub_metering_2, col="red")
lines(DF$DateTime, DF$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), cex=.95)
#fourth plot
plot(DF$DateTime, DF$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()