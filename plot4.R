# plot4.R --> Coursera Exploratory Data Analysis : Project 1 , Plot 4

# Create Filter for dates to be used in the program
projDates <- c ("1/2/2007",  "2/2/2007" )

# Read the File 
a <- read.table ( file = "../household_power_consumption.txt", header = TRUE, sep =";", , stringsAsFactors=FALSE )

# Convert to data frame for sub setting
myDF <- as.data.frame(a)

# Subset data that we need 
projData <- myDF[which(myDF$Date %in% projDates),]

# Convert the time to time format 
projData$Time <- strptime(do.call(paste0,projData[c(1,2)]), "%d/%m/%Y%H:%M:%S")

# Convert the date to date format
projData$Date <- as.Date(projData$Date, "%d/%m/%Y")

# Generate plot 4
par(mfrow = c(2, 2))
with (projData ,{
 plot (x=Time, y=as.numeric(Global_active_power)/500, type = "l" ,ylab = "Global Active Power" , xlab ="")
 plot (x=Time, y=as.numeric(Voltage), type = "l" ,ylab = "Voltage" , xlab ="datetime")
 plot (x=Time, y=as.numeric(Sub_metering_1),  type = "l", ylab = "Energy Sub Metering" , xlab ="")
	points(x=Time, y=as.numeric(Sub_metering_2), type="l", col="red")
	points(x=Time, y=as.numeric(Sub_metering_3), type="l", col="blue")
	legend("topright", pch = NA, lwd = 3, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 plot (x=Time, y=as.numeric(Global_reactive_power), type = "l" ,ylab = "Global_reactive_power" , xlab ="datetime")
})

#Save the file to PNG
dev.copy(png,"plot4.png")
dev.off()
