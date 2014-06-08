#Get and clean the data
Consumption <- read.table(".//household_power_consumption.txt", sep = ";",header = TRUE)
require(date)
#Convert factor --> Date
Consumption$Date <- as.Date(Consumption$Date, format = "%d/%m/%Y")
#Get the relevant sub set of teh data 
TestSubset <- Consumption[Consumption$Date == "2007-02-01" | Consumption$Date == "2007-02-02",]
#Join the date and time fields into a new field
TestSubset$TimeDate <- paste(TestSubset$Date,TestSubset$Time) 
#Convert the new field to a time format
TestSubset$TimeDate <- strptime(TestSubset$TimeDate, "%Y-%m-%d %H:%M:%S")
#Convert empty value (?) with zero (0)
TestSubset$Global_active_power <- sub("?","0",TestSubset$Global_active_power)
TestSubset$Global_reactive_power <- sub("?","0",TestSubset$Global_reactive_power)
TestSubset$Sub_metering_1 <- sub("?","0",TestSubset$Sub_metering_1)
TestSubset$Sub_metering_2 <- sub("?","0",TestSubset$Sub_metering_2)
TestSubset$Voltage <- sub("?","0",TestSubset$Voltage)
TestSubset$Sub_metering_3 <- sub("NA","0",TestSubset$Sub_metering_3)
#Define graphic design
png(file = "plot1.png",width = 480, height = 480)
#Create histogram
hist(as.numeric(TestSubset$Global_active_power),col = "Red", main = "Global Active Power", xlab = "Global Active power (kilowatts)")
#Close graphic device
dev.off()