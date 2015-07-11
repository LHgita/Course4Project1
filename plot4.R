# Author: Leo Heska
# Date: July 10, 2015
# Assignment: https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
# Plot: 4
#
# No code here for selecting only dates of July 1 and July 2.
# Instead, followed suggestion in assignment; shortened data set to contain only those two dates.
# Also, there are no missing data (no question marks), so na.strings = "?" not needed in code.

# deal with the ; separators - could have just changed that in the data file but what the heck
it1 <- read.table("data/household_power_consumption.txt", sep=";", header = TRUE)

it1$Date <- as.Date(it1$Date, "%d/%m/%Y")
# it1$Time <- as.Date(it1$Time, "%H:%M:%S")
it1$Time <- paste(it1$Date, it1$Time, sep=" ")
it1$Time <- strptime(it1$Time, "%Y-%m-%d %H:%M:%S")


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) # Setting up 2 x 2 matrix here
with(it1, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")                           # plot 1

  plot(Time, Voltage, xlab = "datetime", type = "l", ylab = "Voltage")                                           # plot 2

  ylimits = range(c(it1$Sub_metering_1, it1$Sub_metering_2, it1$Sub_metering_3))
  plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black") # plot 3.1
  par(new = TRUE)
  plot(Time, Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")        # plot 3.2
  par(new = TRUE)
  plot(Time, Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")       # plot 3.3
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         bg = "transparent",
         bty = "n",
         lty = c(1,1,1),
         col = c("black", "red", "blue")
         )

  plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")               # plot 4

})
dev.off()

