#read in household power consumption data; code for missing data 
household<-read.table("household_power_consumption.txt", skip=1, sep=";", na.strings=c("?"))
#remove missing data 
household<-na.omit(household)
#naming columns in household dataframe 
names(household)<-c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
#subseting data of interest 
household<-subset(household, household$Date=="1/2/2007" | household$Date=="2/2/2007")
#converting classes of dates and time using strptime 
DatesTimes<-strptime((paste(household$Date, household$Time, sep="")), format="%d/%m/%Y %H:%M:%S")
#create plots of dates compared to sub_metering_1
plot(DatesTimes, household$sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(DatesTimes, household$sub_metering_2, col="red")
lines(DatesTimes, household$sub_metering_3, col="blue")
#create legend differentiating lines 
legend("topright", lty=1, col=c ("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#create png of plot
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()