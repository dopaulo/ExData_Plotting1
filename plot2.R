# Plot 2

# CLEAR WORK SPACE
rm(list=ls())
dev.off()

# LOAD DATA
source("loadData.R")

# prevent bug legend dont fit
dev.set(1)

plot(dataTable$Global_active_power~dataTable$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()