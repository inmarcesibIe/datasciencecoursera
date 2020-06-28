# Read and clean data
setwd("~/Coursera Courses/04 Exploratory Data Analysis/Assignments")
powerdata <- read.table("household_power_consumption.txt",
                        sep = ";", header = TRUE, na.strings = "?")
data <- powerdata[(powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007"),]
# Alternative: data <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Plot plot3.png
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()