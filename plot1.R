#load all data, subset to relevant dates, and then drop the entire dataset from memory
all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
DF <- subset(all_data, Date=="1/2/2007" | Date=="2/2/2007")
rm(all_data)

#open graphics device, make plot, close graphics device
png("plot1.png")
with(DF, hist(Global_active_power, col="Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()