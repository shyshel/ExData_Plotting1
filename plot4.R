library(data.table)

par(mfrow = c(2,2), cex = .75)
f <- fread("household_power_consumption.txt", na.strings="?", header=T, sep=";")
f1 <- subset(f, Date == "1/2/2007" | Date == "2/2/2007")
f1$DateTime <- as.POSIXct(strptime(paste(f1$Date, f1$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S"))

plot(f1$DateTime, f1$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power")

plot(f1$DateTime, f1$Voltage,type = 'l', xlab = "datetime", ylab = "Voltage")


plot(f1$DateTime, f1$Sub_metering_1,type = 'l', xlab = "", ylab = "Energy sub metering")
lines(f1$DateTime, f1$Sub_metering_2, col = "red")
lines(f1$DateTime, f1$Sub_metering_3, col = "blue")
legend("topright", names(d1)[3:5], lty = 1, col = c("black","red","blue"), bty="n")

plot(f1$DateTime, f1$Global_reactive_power,type = 'l', xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()