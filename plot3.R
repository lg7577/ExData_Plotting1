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