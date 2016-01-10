plot1 <- function () {
  EPC.data <- read.table('household_power_consumption.txt', header = T, na.strings = '?', stringsAsFactors = F, sep = ';')
  period <- subset(EPC.data, Date == '1/2/2007' | Date == '2/2/2007')
  
  hist(period$Global_active_power, col='red', main="Global Active Power", xlab = 'Global Active Power (kilowatts)')
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
}

plot1()