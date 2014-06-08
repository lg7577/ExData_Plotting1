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

