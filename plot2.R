data <- read.table(file="~/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

Febdates <- subset(data, Date%in%c("1/2/2007","2/2/2007"))
Febdates$Date <- as.Date(Febdates$Date, format = "%d/%m/%Y")
Febdates$Time <- strptime(Febdates$Time, "%H:%M:%S")
Febdates$Time <- format(Febdates$Time, '%H:%M:%S')
Febdates$DayTime <- paste(Febdates$Date, Febdates$Time)
Febdates$DayTime <- strptime(Febdates$DayTime, format = "%Y-%m-%d %H:%M:%S")

png(file="~/Desktop/Coursera/ExData_Plotting1/plot2.png")
with(Febdates, plot(DayTime, Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)"))
dev.off()
