#read household power consumption data 
household<-read.table("household_power_consumption.txt", skip=1, sep=";")
#create names for corresponding columns 
names(household)<-c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
#subset data of interest ie 1/2/2007 to 2/2/2007
household<-subset(household, household$Date=="1/2/2007" | household$Date=="2/2/2007")
#create historigram of frequency of global active power in kilowatts 
hist(as.numeric(as.character(household$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#save to png
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()
