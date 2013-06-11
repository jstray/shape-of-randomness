# Plot gun ownership rate vs. firearm homicide rate for all countries, or just OECD or non-OECD
# data originally from http://www.guardian.co.uk/news/datablog/2012/jul/22/gun-homicides-ownership-world-list
# augmented with an OECD column
data = read.csv("firearms.csv", header=T, sep=",")
OECDrows = (data[,"OECD"]=="Y") & !(data[,"country"] == "Mexico")

plotcountries <- function(oecd='all') {
    if (oecd == 'all') {
        rows = data
    } else if (oecd == 'oecd') {
        rows = data[OECDrows,]
    } else if (oecd == 'non-oecd') {
        rows = data[!OECDrows,]
    }

    plot(rows[,"firearms"], rows[,"homicides"], xlab="Firearms per 100", ylab="Homicides per 100,000")
    text(rows[,"firearms"], rows[,"homicides"], rows[,"country"], cex=0.6, col="#808080")
}

plotcountries() 