# Author: Leo Heska
# Date: July 10, 2015
# Assignment: https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
# Plot: 2
#
# No code here for selecting only dates of July 1 and July 2.
# Instead, followed suggestion in assignment; shortened data set to contain only those two dates.
# Also, there are no missing data (no question marks), so na.strings = "?" not needed in code.

# deal with the ; separators - could have just changed that in the data file but what the heck
intable1 <- read.table("data/household_power_consumption.txt", sep=";", header = TRUE)

intable1$Date <- as.Date(intable1$Date, "%d/%m/%Y")
# intable1$Time <- as.Date(intable1$Time, "%H:%M:%S")
intable1$Time <- paste(intable1$Date, intable1$Time, sep=" ")
intable1$Time <- strptime(intable1$Time, "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(intable1$Time, intable1$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

