# Load power consumption data, but subsetting only the dates 1/2/2007 and 2/2/2007
require(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()

# Open PNG device
png("plot3.png",width = 480, height = 480, units = "px")

# Make Line plot of Energy sub metering
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_2,type="l",ylab="Energy sub metering",xlab="",col="red")
lines(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Sub_metering_3,type="l",ylab="Energy sub metering",xlab="",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

# Close PNG device
dev.off()