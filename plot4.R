#  Plot 4

# CLEAR WORK SPACE
rm(list=ls())
dev.off()

# LOAD DATA
source("loadData.R")

# prevent bug legend top right
dev.set(1)

par(bg = "white", mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dataTable, {
  plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=0.75)
  plot(Global_reactive_power~DateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png,"plot4.png", width=480, height=480)

dev.off()