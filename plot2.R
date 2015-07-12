source("utils.R")
loadRequiredPackages()
downloadAndExtractData()

hpc <- readData(dataFile)

png(
    file = "plot2.png", width = 480, height = 480, units = "px"
)

with(
    hpc,
    plot(
        DateTime, Global_active_power,
        ylab = "Global Active Power (kilowatts)",
        xlab = "",
        type = "l"
    )
)

#dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
