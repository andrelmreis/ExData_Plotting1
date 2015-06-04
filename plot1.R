# Load power consumption data, but subsetting only the dates 1/2/2007 and 2/2/2007
require(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")
closeAllConnections()

# Open PNG device
png("plot1.png",width = 480, height = 480, units = "px")

# Make histogram of Global Active Power
hist(main="Global Active Power",power_consumption$Global_active_power,xlab="Global Active Power (kilowatts)",col="red")

# Close PNG device
dev.off()