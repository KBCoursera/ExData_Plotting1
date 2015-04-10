# Read the file into a dataframe
cClasses=c(rep("character",2), rep("numeric",7))
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=cClasses)

# Remove the observations we don't care about
hpc <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

# Convert the date column to a date
# hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Create the png file containing the graph
if (file.exists("plot2.png")) file.remove("plot2.png")
png(filename="plot2.png")
hpc$dttm <- strptime(paste(hpc$Date, hpc$Time),"%d/%m/%Y %H:%M:%S")
plot(hpc$dttm, hpc$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(hpc$dttm, hpc$Global_active_power)
dev.off()
