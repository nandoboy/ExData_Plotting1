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

hh_pow_cons$Day <- weekdays(hh_pow_cons$Date)
hh_pow_cons$t_stamp <- strptime(paste(as.character(hh_pow_cons$Date),hh_pow_cons$Time,sep = ' '),format = '%Y-%m-%d %H:%M:%S')

#plot no. 4
png(filename = 'plot4.png',width = 480,height = 480)
par(mfrow = c(2,2),mar = c(4,4,2,1))

plot(Global_active_power~as.numeric(t_stamp),data = hh_pow_cons,type = "l",xlab="",ylab = 'Global_active_power',xaxt = "n")
axis(side = 1,at = c(as.numeric(min(hh_pow_cons$t_stamp)),as.numeric(mean(hh_pow_cons$t_stamp)),as.numeric(max(hh_pow_cons$t_stamp))),labels = c('Thu','Fri','Sat'))

plot(Voltage~as.numeric(t_stamp),data = hh_pow_cons,type = "l",xlab="datetime",ylab = 'Voltage',xaxt = "n")
axis(side = 1,at = c(as.numeric(min(hh_pow_cons$t_stamp)),as.numeric(mean(hh_pow_cons$t_stamp)),as.numeric(max(hh_pow_cons$t_stamp))),labels = c('Thu','Fri','Sat'))

plot(hh_pow_cons$Sub_metering_1~as.numeric(t_stamp),data = hh_pow_cons,type = "l",xlab = '',ylab = 'Energy sub metering',xaxt = "n")
axis(side = 1,at = c(as.numeric(min(hh_pow_cons$t_stamp)),as.numeric(mean(hh_pow_cons$t_stamp)),as.numeric(max(hh_pow_cons$t_stamp))),labels = c('Thu','Fri','Sat'))
lines(as.numeric(hh_pow_cons$t_stamp),hh_pow_cons$Sub_metering_2,type = 'l',col = 'red')
lines(as.numeric(hh_pow_cons$t_stamp),hh_pow_cons$Sub_metering_3,type = 'l',col = 'blue')
legend('topright',col=c('black','red','blue'),legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd = 1)

plot(Global_reactive_power~as.numeric(t_stamp),data = hh_pow_cons,type = "l",xlab="datetime",ylab = 'Global_reactive_power',xaxt = "n")
axis(side = 1,at = c(as.numeric(min(hh_pow_cons$t_stamp)),as.numeric(mean(hh_pow_cons$t_stamp)),as.numeric(max(hh_pow_cons$t_stamp))),labels = c('Thu','Fri','Sat'))
dev.off()