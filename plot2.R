library(data.table)
cc <- c("character", "character", "numeric", rep("NULL",6))
b <- fread("household_power_consumption.txt", na.strings="?", header=T, sep=";", colClasses = cc)
b1 <- subset(b, Date == "1/2/2007" | Date == "2/2/2007")
b1$DateTime <- as.POSIXct(strptime(paste(b1$Date, b1$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S"))

plot(b1$DateTime, b1$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()