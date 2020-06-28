# Read and clean data
setwd("~/Coursera Courses/04 Exploratory Data Analysis/Assignments")
powerdata <- read.table("household_power_consumption.txt",
                        sep = ";", header = TRUE, na.strings = "?")
data <- powerdata[(powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007"),]
# Alternative: data <- subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))

# Convert the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Plot plot2.png
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
