# Author: Leo Heska
# Date: July 10, 2015
# Assignment: https://class.coursera.org/exdata-030/human_grading/view/courses/975125/assessments/3/submissions
# Plot: 1
#
# No code here for selecting only dates of July 1 and July 2.
# Instead, followed suggestion in assignment; shortened data set to contain only those two dates.
# Also, there are no missing data (no question marks), so na.strings = "?" not needed in code.

# deal with the ; separators - could have just changed that in the data file but what the heck
intable1 <- read.table("data/household_power_consumption.txt", sep=";", header = TRUE)

# intable2 <- read.delim("data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", fill = TRUE)
# intable2$Date
# intable2$Time

intable1$Date <- as.Date(intable1$Date, "%d/%m/%Y")
intable1$Time <- as.Date(intable1$Time, "%H:%M:%S")

# windows()

png("plot1.png", width = 480, height = 480)
# hist(intable1$Global_active_power)
hist(intable1$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off()