dataUrl <-
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dataArchive <- "household_power_consumption.zip"
dataFile <- "household_power_consumption.txt"

loadRequiredPackages <- function() {
    if (require(dplyr) == FALSE) {
        install.packages("dplyr")
        library(dplyr)
    }
    if (require(lubridate) == FALSE) {
        install.packages("lubridate")
        library(lubridate)
    }
}

downloadData <- function(url, destfile) {
    if (!file.exists(destfile)) {
        download.file(url = url,
                      destfile = destfile,
                      mode = "wb")
    } 
}

extractData <- function(zipfile, extractedFile) {
    if (!file.exists(extractedFile)) {
        unzip(zipfile, exdir = ".")
    }
}

downloadAndExtractData <- function() {
    downloadData(dataUrl, dataArchive)
    extractData(dataArchive, dataFile)
}

readData <- function(file) {
    tbl_df(read.table(file, 
                      header = TRUE, 
                      sep = ";",
                      na.strings = "?")) %>%
        filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
         mutate(DateTime = dmy_hms(paste(Date, " ", Time))) %>%
         mutate(Date = dmy(Date), Time = hms(Time))
}