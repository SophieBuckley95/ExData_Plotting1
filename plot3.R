## Download the data-------------------------------------------------------------------------------
## Create variable for the zip folder
zipFolder <- "Household Power Consumption.zip"

## Download zip folder from internet (if not already downloaded)
if(!file.exists(zipFolder)){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipFolder, mode = "wb")
}

## Create a variable for the path to the folder of data
folderPath <- "Household Power Consumption"

## Unzip folder and create directory (if not already unzipped and created)
if(!file.exists(folderPath)){
        unzip(zipFolder)
}
##-------------------------------------------------------------------------------------------------


## Read the data into R----------------------------------------------------------------------------
## Read the household power consumption text file
originalData <- read.csv2("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE)

## Subset the data based on the dates we are interested in
subsetData <- originalData[originalData$Date %in% c("1/2/2007", "2/2/2007"), ]

## Remove the original data set to save memory
rm(originalData)
##-------------------------------------------------------------------------------------------------


## Creating plot 3---------------------------------------------------------------------------------
## Create a png file for the plot
png("plot3.png", width = 480, height = 480)

## Concatenate the date and time fields and convert them to date-time format
DateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Create the graph with axis and labels, but don't plot any data on it
plot(DateTime, as.numeric(subsetData$Sub_metering_1), xlab = "", ylab = "Energy sub metering", type = "n")

## Add the 3 lines of data to the graph, giving them different colours
lines(DateTime, as.numeric(subsetData$Sub_metering_1))
lines(DateTime, as.numeric(subsetData$Sub_metering_2), col = "red")
lines(DateTime, as.numeric(subsetData$Sub_metering_3), col = "blue")

## Add a legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))

## Close the device
dev.off()
##-------------------------------------------------------------------------------------------------