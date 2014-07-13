## Coursera - Exploring Data
## Project 1

## plot4.R
## Duplicates Plot4 given in the course project webpage (white
## background) as a 480x480pix PNG file
##
## Plot description: 
##     2x2 matrix of plots. filling col-wise from the left top:
##        - plot 2
##        - plot 3
##        - Voltage vs datetime, black line
##        - Global_reactive_power vs datetime, blackline
## Inputs:  none
## Outputs: PNG file ./figure/plot4.png

source("project1_helpers.R")
## Assumes that the working directory is already correct
##  setenv(os = "windows")


plot4 <- function() {
    ## Load base plotting package if necessary
    require(graphics)
    
    ## Load file into memory if necessary. Make the columns 
    ## have the appropriate type
    selData <- dataCheck()
    
    ## Make the plot
    attach(selData)
    png("./figure/plot4.png", width=480, height=480)
    
    par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0), bg=NA) 
    # plot 2
    plot(DateTime, Global_active_power, type = "l"
         , ylab="Global active power (kilowatts)"
         , xlab ="")
    #plot 3
    plot(DateTime, Sub_metering_1, type = "l"
         , ylab="Energy sub metering"
         , col = "black"
         , xlab ="")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, bty="n",
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    #voltage vs datetime
    plot(DateTime, Voltage, type = "l", xlab = "datetime", col = "black")
    #Global_reactive_power vs datetime
    plot(DateTime, Global_reactive_power, type = "l"
         , xlab = "datetime", col = "black")
    dev.off()
    
    detach(selData)
}


