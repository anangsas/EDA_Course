power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub1 <- subset(power_con,power_con$Date=="1/2/2007" | power_con$Date =="2/2/2007")

sub1$DateTime <- with(sub1, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))
sub1$Global_active_power <- as.numeric(sub1$Global_active_power)
sub1$Sub_metering_1 <- as.numeric(sub1$Sub_metering_1)
sub1$Sub_metering_2 <- as.numeric(sub1$Sub_metering_2)
sub1$Sub_metering_3 <- as.numeric(sub1$Sub_metering_3)
sub1$Global_reactive_power <- as.numeric(sub1$Global_reactive_power)
sub1$Voltage <- as.numeric(sub1$Voltage)


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(sub1,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power")) 
with(sub1,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")) 
with(sub1, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(sub1, lines(DateTime, Sub_metering_2,type="l", col= "red"))
with(sub1, lines(DateTime, Sub_metering_3,type="l", col= "blue"))
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.6, col = c("black", "red", "blue"),box.col = "transparent", bg = "transparent")
with(sub1,plot(DateTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")) 
dev.off()
