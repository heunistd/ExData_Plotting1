png("plot2.png", height=480, width=480, bg="white") ## saves image as png with specified dimensions
EPC <- read.table("household_power_consumption.txt", sep=";", header= T) ## reads in data frame
EPC$Date <-as.Date(EPC$Date, "%d/%m/%Y") ## converts character to Date
nEPC <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02") ## new data frame with selected dates
nEPC$Global_active_power <- as.numeric(as.character(nEPC$Global_active_power)) ## change to numeric
plot(nEPC$Global_active_power, ylab ="Global Active Power (kilowatts)", type="l", xaxt='n', xlab="") ## plots figure without x-axis text and labels
axis(1, at =c(1,1440,2880), labels= c("Thu", "Fri", "Sat")) ## ads desired labels to x-axis on plot
dev.off()