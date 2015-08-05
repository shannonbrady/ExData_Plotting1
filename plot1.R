data <- read.table(file="~/Downloads/household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")

Febdates <- subset(data, Date%in%c("1/2/2007","2/2/2007"))
Febdates$Date <- as.Date(Febdates$Date, format = "%d/%m/%Y")

png(file="~/Desktop/Coursera/ExData_Plotting1/plot1.png", width= 480, height= 480, units="px")
hist(Febdates$Global_active_power, col = "red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency" )

dev.off()
