## Coursera - Exploring Data
## Project 1

## plot1.R
## Duplicates Plot4 given in the course project webpage (white
## or transparent background) as a 480x480pix PNG file
##
## Plot description: 
##    Global Active Power (kilowatts) histogram, 15 red bins?
## Inputs:  none
## Outputs: PNG file ./figure/plot1.png

source("project1_helpers.R")
## Assumes that the working directory is already correct
##  setenv(os = "windows")


plot1 <- function() {
    ## Load base plotting package if necessary
    require(graphics)
    par(bg = NA)

    ## Load file into memory if necessary. Make the columns 
    ## have the appropriate type
    selData <- dataCheck()
    
    ## Make the plot
    attach(selData)
    png("./figure/plot1.png", width=480, height=480)
    hist(Global_active_power, breaks = 15, col="red", 
         xlab="Global active power (kilowatts)", main = "Global Active Power")
    dev.off()
    detach(selData)
}