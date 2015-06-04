# Load power consumption data, but subsetting only the dates 1/2/2007 and 2/2/2007
require(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()

# Open PNG device
png("plot4.png",width = 480, height = 480, units = "px")

# Make a 2x2 panel
par(mfrow = c(2,2))

# Plot 1
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# Plot 2
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Voltage,type="l",ylab="Voltage",xlab="datetime")

# Plot 3
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
lines(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

# Plot 4
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

# Close PNG device
dev.off()