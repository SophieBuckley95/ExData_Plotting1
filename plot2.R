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


## Creating plot 2---------------------------------------------------------------------------------
## Create a png file for the plot
png("plot2.png", width = 480, height = 480)

## Concatenate the date and time fields and convert them to date-time format
DateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Create the plot of type line, giving it appropriate axis labels
plot(DateTime, as.numeric(subsetData$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the device
dev.off()
##-------------------------------------------------------------------------------------------------