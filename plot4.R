data <- read.table(file="~/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

Febdates <- subset(data, Date%in%c("1/2/2007","2/2/2007"))
Febdates$Date <- as.Date(Febdates$Date, format = "%d/%m/%Y")
Febdates$Time <- strptime(Febdates$Time, "%H:%M:%S")
Febdates$Time <- format(Febdates$Time, '%H:%M:%S')
Febdates$DayTime <- paste(Febdates$Date, Febdates$Time)
Febdates$DayTime <- strptime(Febdates$DayTime, format = "%Y-%m-%d %H:%M:%S")

png(file="~/Desktop/Coursera/ExData_Plotting1/plot4.png")
par(mfrow=c(2,2))

with(Febdates, plot(DayTime, Global_active_power, type="l", xlab=NA, ylab="Global Active Power"))

with(Febdates, plot(DayTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(Febdates, plot(DayTime, Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering"))
lines(Febdates$DayTime, Febdates$Sub_metering_2, col="red")
lines(Febdates$DayTime, Febdates$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))

with(Febdates, plot(DayTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()