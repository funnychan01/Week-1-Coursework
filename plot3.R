url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp)
power_consumption <- unzip(temp)
unlink(temp)
rm(url, temp)

pwr_consum <- read_delim("D:/Jackie/Documents/Coursera/EDA/Dataset/household_power_consumption.txt", delim = ";", na = "?")
rm(power_consumption)

twodaypower <- subset(pwr_consum, Date == "1/2/2007" | Date == "2/2/2007")
twodaypower$Time <- as.character(twodaypower$Time)
library(dplyr)
head(twodaypower$Date_Time)
twodaypower <- mutate(twodaypower, Date_Time = paste(Date, Time, sep = "/"))
twodaypower$Date_Time <- strptime(twodaypower$Date_Time, format = "%d/%m/%Y/%H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

with(twodaypower, 
     plot(x = Date_Time,
          y = Sub_metering_1,
          type = "n",
          ylab = "Energy sub metering",
          xlab = ""))
with(twodaypower,
     points(x = Date_Time, 
            y = Sub_metering_1,
            type = "s",
            col = "black"))
with(twodaypower,
     points(x = Date_Time, 
            y = Sub_metering_2,
            type = "s",
            col = "red"))
with(twodaypower,
     points(x = Date_Time, 
            y = Sub_metering_3,
            type = "s",
            col = "blue"))
legend("topright", 
       legend = names(twodaypower[7:9]), 
                  col = c("black", "red", "blue"),
                  lty = 1)

dev.off()
