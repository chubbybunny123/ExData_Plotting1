## Coursera - Exploring Data
## Project 1

## plot2.R
## Duplicates Plot2 given in the course project webpage (white
## or transparent background) as a 480x480pix PNG file
##
## Plot description: 
##    Global Active Power (kilowatts) vs Thu, Fri, Sat. 
##    Line graph in black, no title
## Inputs:  none
## Outputs: PNG file ./figure/plot2.png

source("project1_helpers.R")
## Assumes that the working directory is already correct
##  setenv(os = "windows")


plot2 <- function() {
    ## Load base plotting package if necessary
    require(graphics)
    
    ## Load file into memory if necessary. Make the columns 
    ## have the appropriate type
    selData <- dataCheck()
    
    ## Make the plot
    attach(selData)
    png("./figure/plot2.png", width=480, height=480)
    plot(DateTime, Global_active_power, type = "l"
         , ylab="Global active power (kilowatts)"
         , xlab ="")
    dev.off()
    detach(selData)

}