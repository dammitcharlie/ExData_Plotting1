#load all data, subset to relevant dates, and then drop the entire dataset from memory
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
DF <- subset(all_data, Date=="1/2/2007" | Date=="2/2/2007")
rm(all_data)

#Convert Date and Time to POSIXlt class
DF$DateTime <- strptime(paste(DF$Date, DF$Time), format = "%d/%m/%Y %H:%M:%S")

#open graphics device, make plot, close graphics device
png("plot2.png")
plot(DF$DateTime, DF$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()