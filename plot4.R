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
#Define presentation layout
par(mfcol = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0.5, 0, 0, 0)) 
#finding MIN and MAX values for Y axis
m1_max <- max(as.numeric(TestSubset$Sub_metering_1))
m1_min <- min(as.numeric(TestSubset$Sub_metering_1))
require(datasets)
#First plot
plot(TestSubset$TimeDate,TestSubset$Global_active_power, 
     xlab = "",ylab = "Global Active power", type = "n")
lines(TestSubset$TimeDate,TestSubset$Global_active_power) 
#Second plot
plot(TestSubset$TimeDate,TestSubset$Sub_metering_1, 
     xlab = "",ylab = "Energy sub metering", ylim = c(m1_min,m1_max), 
     type = "n")
lines(TestSubset$TimeDate,TestSubset$Sub_metering_2, col = "red")
lines(TestSubset$TimeDate,TestSubset$Sub_metering_3, col = "blue")
lines(TestSubset$TimeDate,TestSubset$Sub_metering_1, col = "black")
legend("topright", pch = "-", col = c("black", "red", "blue"), lty = 1, lwd = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex = 0.7)
#Third plot
plot(TestSubset$TimeDate,TestSubset$Voltage, 
     xlab = "DateTime",ylab = "Voltage", type = "n")
lines(TestSubset$TimeDate,TestSubset$Voltage)
#Forth plot
plot(TestSubset$TimeDate,TestSubset$Global_reactive_power, 
     xlab = "DateTime",ylab = "Global_reactive_power", type = "n")
lines(TestSubset$TimeDate,TestSubset$Global_reactive_power)
#Set y axis of forth plot
axis(2,at=seq(0.1,0.5,0.1))
#Copy plots from screen to a PNG file
dev.copy(png, file = "plot4.png",width = 480, height = 480)
#Close graphic device
dev.off()

