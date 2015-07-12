source("utils.R")
loadRequiredPackages()
downloadAndExtractData()

hpc <- readData(dataFile)

png(
    file = "plot3.png", width = 480, height = 480, units = "px"
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
        col = c("black", "red", "blue")
    )
})

#dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()
