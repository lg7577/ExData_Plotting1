#Define graphic design
png(file = "plot1.png",width = 480, height = 480)
#Create histogram
hist(as.numeric(TestSubset$Global_active_power),col = "Red", main = "Global Active Power", xlab = "Global Active power (kilowatts)")
#Close graphic device
dev.off()