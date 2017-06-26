# plot2.R
# Execute in directory that contains household_power_consumption.txt
library(data.table)
library(lubridate)
epc_all <- fread('household_power_consumption.txt')
epc<-subset(epc_all,Date=='1/2/2007' | Date=='2/2/2007')

epc[epc=="?"] <- NA

epc[,dayOfWeek:=weekdays(as.Date(Date,'%d/%m/%Y'))]

gap <- as.numeric(epc$Global_active_power)
gap <- gap[!is.na(gap)]

png(file='plot2.png', width = 480, height = 480)

with(faithful,plot(gap,
                   type="l",
                   xaxt="n",
                   ylab='Global Acive Power (kilowatts)'
))
axis(1, at=c(1,floor((1+length(gap))/2),length(gap)),labels=c('Thu','Fri','Sat'))
dev.copy(h,file='plot2.png')
dev.off()
