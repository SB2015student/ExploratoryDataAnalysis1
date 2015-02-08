# plot2.R --> Coursera Exploratory Data Analysis : Project 1 , Plot 2

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

# Generate plot 2
plot (x=projData$Time, y=as.numeric(projData$Global_active_power), type = "l" ,ylab = "Global Active Power (kilowatts)" , xlab ="")

#Save the file to PNG
dev.copy(png,"plot2.png")
dev.off()
