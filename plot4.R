# Read the file into a dataframe
cClasses=c(rep("character",2), rep("numeric",7))
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=cClasses)

# Remove the observations we don't care about
hpc <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

# Create a datetime variable
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time),"%d/%m/%Y %H:%M:%S")



# Create the png file containing the graph
plot.file.name <- "plot4.png"
if (file.exists(plot.file.name)) file.remove(plot.file.name)
png(filename=plot.file.name)

# Set up to show 4 plots on one device
par(mfcol=c(2,2))


# First Plot
plot(hpc$datetime, hpc$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(hpc$datetime, hpc$Global_active_power)


# Second Plot
plot(hpc$datetime, hpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_1)
lines(hpc$datetime, hpc$Sub_metering_2, col="red")
lines(hpc$datetime, hpc$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1, bty="n")


# Third Plot
plot(hpc$datetime, hpc$Voltage, type="n", xlab=colnames(hpc)[10], ylab=colnames(hpc)[5])
lines(hpc$datetime, hpc$Voltage)


# Fourth Plot
plot(hpc$datetime, hpc$Global_reactive_power, type="n", xlab=colnames(hpc)[10], ylab=colnames(hpc)[4])
lines(hpc$datetime, hpc$Global_reactive_power)



dev.off()
