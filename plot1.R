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
par(mfrow = c(1,1))
#make histogram - plot 1
hist(as.numeric(x$Global_active_power),xlab="Global Active Power (kiloWatts)",col="red",main="")
title(main=expression(bold("Global Active Power")))
dev.copy(png, file = "~/Coursera/R/Exploratory data analysis/plot1.png")
dev.off()