power_con <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power_con) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
sub1 <- subset(power_con,power_con$Date=="1/2/2007" | power_con$Date =="2/2/2007")

sub1$DateTime <- with(sub1, strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S"))


png("plot2.png", width=480, height=480)
plot(sub1$DateTime,as.numeric(as.character(sub1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
