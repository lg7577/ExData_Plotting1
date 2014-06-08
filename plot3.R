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
#finding MIN and MAX values for Y axis
m1_max <- max(as.numeric(TestSubset$Sub_metering_1))
m1_min <- min(as.numeric(TestSubset$Sub_metering_1))
#Define graphic device
png(file = "plot3.png",width = 480, height = 480)
#Create plot but don't show content
with(TestSubset,{
  plot(TimeDate,Sub_metering_2, 
       xlab = "",ylab = "Energy sub metering", type = "n")
  plot(TimeDate,Sub_metering_3, 
       xlab = "",ylab = "Energy sub metering", type = "n")
  plot(TimeDate,Sub_metering_1, 
       xlab = "",ylab = "Energy sub metering", ylim = c(m1_min,m1_max), 
       type = "n")})
#Add lines and legend to the plot
lines(TestSubset$TimeDate,TestSubset$Sub_metering_1, col = "black")
lines(TestSubset$TimeDate,TestSubset$Sub_metering_2, col = "red")
lines(TestSubset$TimeDate,TestSubset$Sub_metering_3, col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
#Close graphic device 
dev.off()