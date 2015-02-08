png("plot4.png", height=480, width=480, bg="white") ## saves image as png with specified dimensions
EPC <- read.table("household_power_consumption.txt", sep=";", header= T) ## reads in data frame
EPC$Date <-as.Date(EPC$Date, "%d/%m/%Y") ## converts character to Date
nEPC <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02") ## new data frame with selected dates
nEPC$Global_active_power <- as.numeric(as.character(nEPC$Global_active_power)) ## change to numeric
nEPC$Voltage <- as.numeric(as.character(nEPC$Voltage))
nEPC$Sub_metering_1 <- as.numeric(as.character(nEPC$Sub_metering_1))
nEPC$Sub_metering_2 <- as.numeric(as.character(nEPC$Sub_metering_2))
nEPC$Sub_metering_3 <- as.numeric(as.character(nEPC$Sub_metering_3))
nEPC$Voltage <- as.numeric(as.character(nEPC$Voltage))
nEPC$Global_reactive_power <- as.numeric(as.character(nEPC$Global_reactive_power))
par(mfrow=c(2,2)) # sets order for multiple plots
plot(nEPC$Global_active_power, ylab ="Global Active Power", type="l", xaxt='n', xlab="") ## plots figure without x-axis text and labels
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat")) ## ads desired labels to x-axis on plot
plot(nEPC$Voltage, ylab ="Voltage", type="l", xaxt='n', xlab="datetime")
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat"))
plot(nEPC$Sub_metering_1, type ="l", ylab= "Energy sub metering", xaxt='n', xlab="")
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat"))
lines(nEPC$Sub_metering_2, type="l", col ="red") ##plots more data on the same figure
lines(nEPC$Sub_metering_3, type="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", col="red", col="blue"), bty="n") ## ads legend to topright corner of plot
plot(nEPC$Global_reactive_power, ylab ="Global_reactive_power", type="l", xaxt='n', xlab="datetime")
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat"))
dev.off()