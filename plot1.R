##########################################################################################################

## Peer-graded Assignment: Exploratory Data Analysis Course Project 1
## Jeremy Peters
## 9/2/2017

# plot1.r File Description:

# This script will execute the following tasks on the UC Irvine Machine Learning Repository "Individual household electric power consumption" Data Set  downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Read in the Individual household electric power consumption data
# Convert Date variable to Date class
# Subset the data frame to return records from the dates 2007-02-01 and 2007-02-02
# Coerce Global_active_power variable type to Double
# Create a histogram of household global minute-averaged active power (in kilowatt)
# Copy the histogram  plot to a PNG file
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

# Coerce Global_active_power variable type to Double
subsetDf$Global_active_power <- as.numeric(subsetDf$Global_active_power)

#Create a histogram of household global minute-averaged active power (in kilowatt)
hist(subsetDf$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#Copy the histogram  plot to a PNG file
dev.copy(png, file="plot1.png", width=480, height=480)
#Close the PNG device
dev.off()
#cat("Plot1.png has been saved in", getwd())


