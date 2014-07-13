## Coursera - Exploring Data
## Project 1

## plot3.R
## Duplicates Plot3 given in the course project webpage (white
## or transparent background) as a 480x480pix PNG file
##
## Plot description: 
##     Energy sub metering split into 3 groups:
##         1 - black, 2- red, 3- blue
##         xaxis is date/time, no label
##         yaxis title Energy sub metering
##         no title
## Inputs:  none
## Outputs: PNG file ./figure/plot3.png

source("project1_helpers.R")
## Assumes that the working directory is already correct
##  setenv(os = "windows")


plot3 <- function() {
    ## Load base plotting package if necessary
    require(graphics)
    
    ## Load file into memory if necessary. Make the columns 
    ## have the appropriate type
    selData <- dataCheck()
    
    ## Make the plot
    attach(selData)
    png("./figure/plot3.png", width=480, height=480)
    plot(DateTime, Sub_metering_1, type = "l"
         , ylab="Energy sub metering"
         , col = "black"
         , xlab ="")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1,
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
    detach(selData)
}



