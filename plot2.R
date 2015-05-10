hpc <- read.csv("./Data/household_power_consumption.txt",sep=";", header=TRUE, na.strings="?", 
                      nrows=2075259, quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

dateFilter <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
datetime <- paste(as.Date(dateFilter$Date), dateFilter$Time)
dateFilter$Datetime <- as.POSIXct(datetime)

plot(dateFilter$Global_active_power~dateFilter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

