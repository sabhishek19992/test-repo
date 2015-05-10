hpc <- read.csv("./Data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                nrows=2075259, quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

dateFilter <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

datetime <- paste(as.Date(dateFilter$Date), dateFilter$Time)
dateFilter$Datetime <- as.POSIXct(datetime)

with(dateFilter, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime,col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd =2,cex=0.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
