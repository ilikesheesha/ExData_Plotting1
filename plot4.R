source("utils.R")
loadRequiredPackages()
downloadAndExtractData()

hpc <- readData(dataFile)

png(
    file = "plot4.png", width = 480, height = 480, units = "px"
)

par(mfcol = c(2, 2))

with(
    hpc,
    plot(
        DateTime, Global_active_power,
        ylab = "Global Active Power",
        xlab = "",
        type = "l"
    )
)

with(hpc, {
    plot(
        DateTime, Sub_metering_1,
        ylab = "Energy sub metering",
        xlab = "",
        type = "l",
        col = "black"
    )
    lines(DateTime, Sub_metering_2,
          col = "red")
    lines(DateTime, Sub_metering_3,
          col = "blue")
    legend(
        "topright",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1, 1, 1),
        col = c("black", "red", "blue"),
        bty = "n"
    )
})

with(hpc,
     plot(
         DateTime, Voltage,
         ylab = "Voltage",
         xlab = "datetime",
         type = "l"
     ))

with(
    hpc,
    plot(
        DateTime, Global_reactive_power,
        ylab = "Global_reactive_power",
        xlab = "datetime",
        type = "l"
    )
)

#dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
