# plot3.R
# Execute in directory that contains household_power_consumption.txt
library(data.table)
library(lubridate)
epc_all <- fread('household_power_consumption.txt')
epc<-subset(epc_all,Date=='1/2/2007' | Date=='2/2/2007')

epc[epc=="?"] <- NA

epc[,dayOfWeek:=weekdays(as.Date(Date,'%d/%m/%Y'))]

png(file='plot3.png', width = 480, height = 480)

plotData<-epc[,c('Sub_metering_1','Sub_metering_2','Sub_metering_3')]

with(faithful,matplot(plotData,
                   type="l",
                   xaxt="n",
                   ylab='Energy sub metering',
                   col=c('black','red','blue'),
                   lty=c(1,1,1)
))
legend("topright", legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=1:3, pch="___")
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))
dev.copy(h,file='plot3.png')
dev.off()
