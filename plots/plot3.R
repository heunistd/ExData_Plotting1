png("plot3.png", height=480, width=480, bg="white") ## saves image as png with specified dimensions
EPC <- read.table("household_power_consumption.txt", sep=";", header= T) ##reads in data frame
EPC$Date <-as.Date(EPC$Date, "%d/%m/%Y") ## converts character to Date
nEPC <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02") ## new data frame with selected dates
nEPC$Sub_metering_1 <- as.numeric(as.character(nEPC$Sub_metering_1)) ## change to numeric
nEPC$Sub_metering_2 <- as.numeric(as.character(nEPC$Sub_metering_2))
nEPC$Sub_metering_3 <- as.numeric(as.character(nEPC$Sub_metering_3))
plot(nEPC$Sub_metering_1, type ="l", ylab= "Energy sub metering", xaxt='n', xlab="") ## plots figure without x-axis text and labels
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat")) ## ads desired labels to x-axis on plot
lines(nEPC$Sub_metering_2, type="l", col ="red") ## plots more data on the same figure
lines(nEPC$Sub_metering_3, type="l", col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", col="red", col="blue")) ## ads legend to topright corner of plot
dev.off()