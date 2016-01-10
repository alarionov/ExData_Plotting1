plot2 <- function () {
  EPC.data <- read.table('household_power_consumption.txt', header = T, na.strings = '?', stringsAsFactors = F, sep = ';')
  period <- subset(EPC.data, Date == '1/2/2007' | Date == '2/2/2007')
  period$timestamp <- strptime(with(period, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(period$timestamp, period$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
}

plot2()