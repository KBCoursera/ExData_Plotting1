# Read the file into a dataframe
cClasses=c(rep("character",2), rep("numeric",7))
hpc <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE, colClasses=cClasses)

# Remove the observations we don't care about
hpc <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

# Convert the date column to a date
# hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Create the png file containing the graph
if (file.exists("plot1.png")) file.remove("plot1.png")
png(filename="plot1.png")
gap=table(trunc(hpc$Global_active_power*2))
barplot(gap, col=c("Red"), xlab="", ylab="Frequency", main="Global Active Power", ylim=c(0,1200),space=0,xaxt='n',xlim=c(0,16))
axis(side=1, at=c(0,16), lwd.ticks=0, labels=c("",""))
axis(side=1, at=c(0,4,8,12), line=1, labels=c(0,2,4,6))
mtext("Global Active Power (kilowatts)",1,line=3)
dev.off()
