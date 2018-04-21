
  # -- load requirements --
  library(dplyr)
  
  # -- get data --
  datafileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  datafile <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  if (!file.exists(datafile)) {
    download.file(datafileurl, datafile, mode = "wb")
  }
  
  txtFile <- "household_power_consumption.txt"
  
  if (!file.exists(txtFile)) {
    unzip(datafile)
  }
  
  
  # read data
  dataTable <- read.table(txtFile, header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  
  # formate date
  dataTable$Date <- as.Date(dataTable$Date, "%d/%m/%Y")
  
  # subset Feb. 1, 2007 to Feb. 2, 2007
  dataTable <- subset(dataTable,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
  # remove incomplete
  dataTable <- dataTable[complete.cases(dataTable),]
  
  # combine Date and Time column
  DateTime <- paste(dataTable$Date, dataTable$Time)
  
  # rename vector
  DateTime <- setNames(DateTime, "DateTime")
  
  # remove columns Date & Time 
  dataTable <- dataTable[ ,!(names(dataTable) %in% c("Date","Time"))]
  
  # add column DateTime to Data Table
  dataTable <- cbind(DateTime, dataTable)
  
  # format DateTime
  dataTable$DateTime <- as.POSIXct(DateTime)
  
  # clear unused objects
  rm(datafile, datafileurl, txtFile, DateTime)  


