#  Plot 3

# CLEAR WORK SPACE
rm(list=ls())
dev.off()

# LOAD DATA
source("loadData.R")

# prevent bug legend dont fit
dev.set(1)
  
with(dataTable, {
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)

dev.off()