##########################################################################################################

## Peer-graded Assignment: Exploratory Data Analysis Course Project 1
## Jeremy Peters
## 9/2/2017

# plot2.r File Description:

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