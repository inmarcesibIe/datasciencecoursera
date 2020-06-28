# Read and clean data
setwd("~/Coursera Courses/04 Exploratory Data Analysis/Assignments")
powerdata <- read.table("household_power_consumption.txt",
                        sep = ";", header = TRUE, na.strings = "?")
data <- powerdata[(powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007"),]
# Alternative: data <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Plot plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# Plot 1: Top left plot
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2: Top right plot
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3 - Bottom left plot
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=1, bty = "n", cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 - Bottom right plot
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()