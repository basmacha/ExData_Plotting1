#read in household power consumption dataset & code for missing data in household dataframe 
household<-read.table("household_power_consumption.txt", skip=1, sep=";", na.strings=c("?"))
#remove missing data 
household<-na.omit(household)
#create names for columns in household dataframe 
names(household)<-c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
#subset data of interest ie from 1/2/2007 to 2/2/2007
household<-subset(household, household$Date=="1/2/2007" | household$Date=="2/2/2007")
#convert classes of dates and time using paste & strptime 
DatesTimes<-strptime((paste(household$Date, household$Time, sep="")), format="%d/%m/%Y %H:%M:%S")
#create plot of global active power in kilowatts compared against days 
plot(DatesTimes, household$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
#save plot into png format 
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()

