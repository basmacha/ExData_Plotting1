#read in data from household power consumption; code for missing data 
household<-read.table("household_power_consumption.txt", skip=1, sep=";", na.strings=c("?"))
#remove missing data 
household<-na.omit(household)
#naming columns in household dataframe 
names(household)<-c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
#subset data of interest 
household<-subset(household, household$Date=="1/2/2007" | household$Date=="2/2/2007")
#convert classes of dates and times using strptime 
DatesTimes<-strptime((paste(household$Date, household$Time, sep="")), format="%d/%m/%Y %H:%M:%S")
#create canvasses for the following plots 
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,2,0))
#create plots 
plot(DatesTimes, household$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
plot(DatesTimes, household$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(DatesTimes, household$sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DatesTimes, household$sub_metering_2, col="red")
lines(DatesTimes, household$sub_metering_3, col="blue")
#create legend 
legend("topright", lty=c(1,1), col=c ("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lwd=1.5, cex=0.5)
plot(DatesTimes, household$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#convert plot to png
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()