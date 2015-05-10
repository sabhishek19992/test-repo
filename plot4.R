hpc <- read.csv("./Data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", 
                nrows=2075259, quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

dateFilter <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)

datetime <- paste(as.Date(dateFilter$Date), dateFilter$Time)
dateFilter$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dateFilter, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)",xlab="")
    lines(Sub_metering_2~Datetime,col="red")
    lines(Sub_metering_3~Datetime,col="blue")
    legend("topright", col=c("black", "red", "blue"), lty=, lwd=2,cex=.35,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
