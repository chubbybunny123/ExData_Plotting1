## Coursera - Exploring Data
## Project 1

## project1_helpers.R

## FUNCTION: setupEnv
## Set the working directory, depending on whether this is running
## in Windows or Linux. load some useful packages
##
## INPUTS:
##   os - [char vect] defaults to "windows", otherwise this would 
##        be "linux"

setupEnv <- function(os = "windows") {
    if(os == "windows") {
        setwd("D:\\Google Drive\\ubuntu-share\\coursera-exploreData")
    } else {                     ## (os == "linux") 
        setwd("/home/jwyim/Desktop/ubuntu-share/coursera-exploreData")        
    }   
    setwd("ExData_Plotting1")
    
    ## conditional create figure folder
    if(!file.exists("figure")) {
        dir.create("figure")
    }

    ## load the basic plotting package, with default transparent background
    require(graphics)
    par(bg = NA)
}

## FUNCTION: dataCheck
## Look to see if the zip file has been downloaded, unzipped, and
## loaded in to memory. If necessary ,it will load the data as a data
## table, taking only data from the dates 2007-02-01 and 2007-02-02.
## Then it creates a new column with combined date and time, called
## datetime, in the XPOSITL format.
##
## Inputs:
## Outputs:
##   

dataCheck <- function() {
    if(!file.exists("household_power_consumption.txt")) {

        ## Download and unzip the file
        filename = "exdata-data-household_power_consumption.zip"
        fileUrl <- paste("https://d396qusza40orc.cloudfront.net"
                         ,"/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                         , sep="")
        download.file(fileUrl, destfile=filename)
        unzip(filename)
        
        ## Record the download date
        date.DL <- date()
        fileConn <- file("household_power_dateDL.txt")
        writeLines(date.DL, fileConn)
        close(fileConn)    
    }
        ## Read the file in to R, only from dates 2007-02-01 and 2007-02-02
        ## read.csv2.sql does a selective read for semi-colon separated data
    if(!exists("selData")) {
 
        txtname = "household_power_consumption.txt"
## The required packages for this doesn't work with my version of R?
##        require(sqldf)
##        sqltext = "SELECT * FROM file WHERE Date = '1/2/2007' OR '2/2/2007'"
##        selData <- read.csv2.sql(txtname
##            ,sql = sqltext
##            ,header = TRUE, na.strings = "?", sep=";", quote =""
##            ,colClasses = c(rep("character", each=2), rep("numeric", each=7))
##        )
        require(data.table)
        fullData <- read.table(txtname, header = TRUE, na.strings = "?" 
                       , colClasses = c(rep("character", each=2), rep("numeric", each=7))
                       , sep=";", quote ="")
        fullData$DateTemp <- as.Date(fullData$Date, format = "%d/%m/%Y")

        ## saves this selData into the global environment so we don't have to 
        ## load it again.
        ## only from dates 2007-02-01 and 2007-02-02
        selData <<- with(fullData
            , subset(fullData, DateTemp == "2007-02-01" | DateTemp == "2007-02-02"))
        rm(fullData)

        ## make POSIXct object
        selData$DateTime <<- with(selData, as.POSIXct(paste(Date, Time), 
                                             format = "%d/%m/%Y %H:%M:%S"))
    }
    return(selData)
}