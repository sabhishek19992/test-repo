hpc <- read.csv("./Data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                      nrows=2075259, quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

dateFilter <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
datetime <- paste(as.Date(dateFilter$Date), dateFilter$Time)
dateFilter$Datetime <- as.POSIXct(datetime)

hist(dateFilter$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(file="plot1.png",png, height=480, width=480)
dev.off()

