# Read the file into a dataframe
cClasses=c(rep("character",2), rep("numeric",7))
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=cClasses)

# Remove the observations we don't care about
hpc <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

# Create a variable holding the timestamp of the observation
hpc$dttm <- strptime(paste(hpc$Date, hpc$Time),"%d/%m/%Y %H:%M:%S")

plot.file.name <- "plot3.png"
# Create the png file containing the graph
if (file.exists(plot.file.name)) file.remove(plot.file.name)
png(filename=plot.file.name)
plot(hpc$dttm, hpc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(hpc$dttm, hpc$Sub_metering_1)
lines(hpc$dttm, hpc$Sub_metering_2, col="red")
lines(hpc$dttm, hpc$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()
