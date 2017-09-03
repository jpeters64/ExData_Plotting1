##########################################################################################################

## Peer-graded Assignment: Exploratory Data Analysis Course Project 1
## Jeremy Peters
## 9/2/2017

# plot4.r File Description:

# This script will execute the following tasks on the UC Irvine Machine Learning Repository "Individual household electric power consumption" Data Set  downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read in the Individual household electric power consumption data
# Convert Date variable to Date class
# Subset the data frame to return records from the dates 2007-02-01 and 2007-02-02
# Coerce  variables types to Numeric
# Convert from character to dates-time type
# Specify the global graphics parameters that affect all plots in an R session
#       mfrow: number of plots per row, column (plots are filled row-wise)
# Create a plot of household global minute-averaged active power (in kilowatt)
# Create a plot of minute-averaged voltage (in volt) 
# Create a plot of energy sub-metering 
# Create a plot of household global minute-averaged reactive power (in kilowatt)
# Copy the plot to a PNG file
##########################################################################################################

# Clear the workspace
rm(list=ls())

#Optional: set working directory to  where the  Dataset was unzipped
#setwd("C:\\JP Docs\\Data Science Certification\\WD");

## load the data
# Read in the Individual household electric power consumption data
# Missing values are coded as ?
df <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", dec=".")

# Convert Date variable to Date class
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset the data frame to return records from the dates 2007-02-01 and 2007-02-02
subsetDf <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Coerce the following variables types to Numeric
subsetDf$Global_active_power <- as.numeric(subsetDf$Global_active_power)
subsetDf$subMetering1 <- as.numeric(subsetDf$Sub_metering_1)
subsetDf$subMetering2 <- as.numeric(subsetDf$Sub_metering_2)
subsetDf$subMetering3 <- as.numeric(subsetDf$Sub_metering_3)
subsetDf$Global_reactive_power <- as.numeric(subsetDf$Global_reactive_power)
subsetDf$Voltage <- as.numeric(subsetDf$Voltage)

# Convert from character to dates-time type
subsetDf <- transform(subsetDf, datetime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#specify the global graphics parameters that affect all plots in an R session
# mfrow: number of plots per row, column (plots are filled row-wise)
par(mfrow = c(2, 2))

#Create a plot of household global minute-averaged active power (in kilowatt)
plot(subsetDf$datetime,subsetDf$Global_active_power, type="l", xlab="", ylab="Global Active Power")


#Create a plot of minute-averaged voltage (in volt) 
plot(subsetDf$datetime,subsetDf$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Create a plot of energy sub-metering 
plot(subsetDf$datetime, subsetDf$subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(subsetDf$datetime, subsetDf$subMetering2, type="l", col="red")
lines(subsetDf$datetime, subsetDf$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

#Create a plot of household global minute-averaged reactive power (in kilowatt)
plot(subsetDf$datetime,subsetDf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Copy the histogram  plot to a PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
#Close the PNG device
dev.off()
