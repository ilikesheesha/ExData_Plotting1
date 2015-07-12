source("utils.R")
loadRequiredPackages()
downloadAndExtractData()

hpc <- readData(dataFile)

png(
    file = "plot1.png", width = 480, height = 480, units = "px"
)

with(
    hpc,
    hist(
        Global_active_power,
        xlab = "Global Active Power (kilowatts)",
        col = "red",
        main = "Global Active Power"
    )
)

#dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
