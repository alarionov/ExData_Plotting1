plot4 <- function () {
  EPC.data <- read.table('household_power_consumption.txt', header = T, na.strings = '?', stringsAsFactors = F, sep = ';')
  period <- subset(EPC.data, Date == '1/2/2007' | Date == '2/2/2007')
  period$timestamp <- strptime(with(period, paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  par(mfcol = c(2,2))
  
  plot(period$timestamp, period$Global_active_power, type='l', xlab = '', ylab = 'Global Active Power (kilowatts)')
  
  plot(period$timestamp, period$Sub_metering_1, type='l', col='black', xlab = '', ylab = 'Energy sub metering')
  lines(period$timestamp, period$Sub_metering_2, type='l', col='red')
  lines(period$timestamp, period$Sub_metering_3, type='l', col='blue')
  legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1,1), lwd = c(1,1), cex = 0.5)
  
  plot(period$timestamp, period$Voltage, type='l', xlab = 'datetime', ylab = 'Voltage')
  plot(period$timestamp, period$Global_reactive_power, type='l', xlab = 'datetime', ylab = 'Global Reactive Power (kilowatts)')
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}

plot4()