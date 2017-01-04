#Steps for week-1 project:

hh_pow_cons <- read.table('household_power_consumption.txt',header = TRUE,sep = ';',stringsAsFactors = FALSE,skip = 66636,nrows = 2880)
name_frame  <- read.table('household_power_consumption.txt',header = TRUE,sep = ';',stringsAsFactors = FALSE,nrows = 1)
names(hh_pow_cons) <- names(name_frame)
hh_pow_cons$Date <- strptime(hh_pow_cons$Date,'%d/%m/%Y')

#sub-setting
#hh_pow_cons <- hh_pow_cons[hh_pow_cons$Date == '2007-02-01' | hh_pow_cons$Date == '2007-02-02',]

hh_pow_cons$Global_active_power   <- as.numeric(hh_pow_cons$Global_active_power)
hh_pow_cons$Global_reactive_power <- as.numeric(hh_pow_cons$Global_reactive_power)
hh_pow_cons$Voltage               <- as.numeric(hh_pow_cons$Voltage)
hh_pow_cons$Global_intensity      <- as.numeric(hh_pow_cons$Global_intensity)
hh_pow_cons$Sub_metering_1        <- as.numeric(hh_pow_cons$Sub_metering_1)
hh_pow_cons$Sub_metering_2        <- as.numeric(hh_pow_cons$Sub_metering_2)
hh_pow_cons$Sub_metering_3        <- as.numeric(hh_pow_cons$Sub_metering_3)

#plot no. 1 - the histogram
png(filename = 'plot1.png',width = 480,height = 480)
par(mar = c(4,4,2,1))
hist(hh_pow_cons$Global_active_power,col = 'Red',main = 'Global Active Power',xlab = 'Global Active Power(kilowatts)')
dev.off()