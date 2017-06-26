# plot4.R
# Execute in directory that contains household_power_consumption.txt
library(data.table)
library(lubridate)
epc_all <- fread('household_power_consumption.txt')
epc<-subset(epc_all,Date=='1/2/2007' | Date=='2/2/2007')

epc[epc=="?"] <- NA

epc[,dayOfWeek:=weekdays(as.Date(Date,'%d/%m/%Y'))]

png(file='plot4.png', width = 480, height = 480)

plotData<-epc[,c('Sub_metering_1','Sub_metering_2','Sub_metering_3')]
par(mfrow=c(2,2))

## First plot
with(faithful,plot(epc$Global_active_power,
                   type="l",
                   xaxt="n",
                   ylab='Global Acive Power (kilowatts)'
))
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))
## Second plot
with(faithful,plot(epc$Voltage,
                   type="l",
                   xaxt="n",
                   ylab='Voltage',
                   xlab="datetime"
))
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))
## Third plot
with(faithful,matplot(plotData,
                      type="l",
                      xaxt="n",
                      ylab='Energy sub metering',
                      col=c('black','red','blue'),
                      lty=c(1,1,1)
))
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=1:3, pch="___")
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))

## Fourth Plog
with(faithful,plot(epc$Global_reactive_power,
                   type="l",
                   xaxt="n",
                   ylab='Global_reactive_power',
                   xlab="datetime"
))
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))

#
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))
dev.copy(h,file='plot4.png')
dev.off()
