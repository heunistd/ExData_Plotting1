png("plot1.png", height=480, width=480, bg="white") ## saves image as png with specified dimensions
EPC <- read.table("household_power_consumption.txt", sep=";", header= T) ## reads in data frame
EPC$Date <-as.Date(EPC$Date, "%d/%m/%Y") ## converts character to Date 
nEPC <- subset(EPC, EPC$Date >= "2007-02-01" & EPC$Date <= "2007-02-02") ## new data frame with selected dates
nEPC$Global_active_power <- as.numeric(as.character(nEPC$Global_active_power)) ## changes to numeric
hist(nEPC$Global_active_power, col="red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)") ## plots histogram
dev.off()