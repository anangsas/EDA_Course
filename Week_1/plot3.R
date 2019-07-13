power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub1 <- subset(power_con,power_con$Date=="1/2/2007" | power_con$Date =="2/2/2007")

sub1$DateTime <- with(sub1, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
sub1$Sub_metering_1 <- as.numeric(sub1$Sub_metering_1)
sub1$Sub_metering_2 <- as.numeric(sub1$Sub_metering_2)
sub1$Sub_metering_3 <- as.numeric(sub1$Sub_metering_3)


png("plot3.png", width=480, height=480)
with(sub1, plot(DateTime, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
with(sub1, lines(DateTime, Sub_metering_2,type="l", col= "red"))
with(sub1, lines(DateTime, Sub_metering_3,type="l", col= "blue"))
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
