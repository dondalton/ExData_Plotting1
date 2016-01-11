power <- read.csv("~/Coursera/R/Exploratory data analysis/github/household_power_consumption.txt", sep=";")
# subset to only two days
x <- power[(power$Date == "1/2/2007" | power$Date == "2/2/2007"),]
# get ride of question marks
x$Global_active_power <- gsub("\\?","0",x$Global_active_power)
x$Sub_metering_2 <- gsub("\\?","0",x$Sub_metering_2)
x$Sub_metering_1 <- gsub("\\?","0",x$Sub_metering_1)
x$Sub_metering_3 <- gsub("\\?","0",x$Sub_metering_3)
x$Global_reactive_power <- gsub("\\?","0",x$Global_reactive_power)
x$Voltage <- gsub("\\?","0",x$Voltage)
# convert to date time format
x$datetime <- strptime(paste(x$Date,x$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#make plot 4
par(mfrow = c(2,2))
plot(x$datetime,x$Global_active_power,type="l",ylab="Global Active Power (kW)",xlab="")
plot(x$datetime,x$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(x$datetime,x$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="")
legend("top",cex=.5,lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(x$datetime,x$Sub_metering_2,col="red")
lines(x$datetime,x$Sub_metering_3,col="blue")
plot(x$datetime,x$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png, file = "~/Coursera/R/Exploratory data analysis/plot4.png")
dev.off()