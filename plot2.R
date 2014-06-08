#Define graphic design
png(file = "plot2.png",width = 480, height = 480)
#Create plot
with(TestSubset,plot(TimeDate,Global_active_power, 
                     xlab = "",ylab = "Global Active power (kilowatts)", type = "n"))
lines(TestSubset$TimeDate,TestSubset$Global_active_power)
#Close graphic device
dev.off()