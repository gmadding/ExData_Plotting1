# plot1.R
# Execute in directory that contains household_power_consumption.txt
library(data.table)
epc_all <- fread('household_power_consumption.txt')
epc<-subset(epc_all,Date=='1/2/2007' | Date=='2/2/2007')

epc[epc=="?"] <- NA

gap <- as.numeric(epc$Global_active_power)
gap <- gap[!is.na(gap)]

png(file='plot1.png', width = 480, height = 480)

with(faithful,hist(gap,
     main='Global Active Power',
     xlab='Global Acive Power (kilowatts)',
     col='red'
     ))
dev.copy(h,file='plot1.png')
dev.off()
