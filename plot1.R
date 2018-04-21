# Plot 1 | Histogram Global Active Power

# CLEAR WORK SPACE
rm(list=ls())
dev.off()

# LOAD DATA
source("loadData.R")

# prevent bug legend dont fit
dev.set(1)

hist(dataTable$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()