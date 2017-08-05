url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(url,temp)
power_consumption <- unzip(temp)
unlink(temp)
rm(url, temp)

pwr_consum <- read_delim("D:/Jackie/Documents/Coursera/EDA/Dataset/household_power_consumption.txt", delim = ";", na = "?")
rm(power_consumption)

twodaypower <- subset(pwr_consum, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

with(twodaypower, 
     hist(Global_active_power, 
          main = "Global Active Power", 
          xlab = "Global Active Power(Kilowatts)",
          col = "red"))

dev.off()
