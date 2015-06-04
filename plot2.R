# Load power consumption data, but subsetting only the dates 1/2/2007 and 2/2/2007
require(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()

# Open PNG device
png("plot2.png",width = 480, height = 480, units = "px")

# Change margin parameters
par(mar=c(4.1,4.1,2,2))

# Make Line plot of Time vs Global Active Power
plot(strptime(paste(power_consumption$Date,power_consumption$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT"),power_consumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Close PNG device
dev.off()