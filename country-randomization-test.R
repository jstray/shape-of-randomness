data = read.csv("firearms.csv", header=T, sep=",")

# plot all OECD countries except the US and mexico
keeprows = data[,"OECD"]=="Y"
keeprows = keeprows & !(data[,"country"] == "United States") & !(data[,"country"] == "Mexico")
guns = data[keeprows,"firearms"]
deaths = data[keeprows,"homicides"]

# plot our data
plot(guns, deaths)

# permute the deaths, and plot that
plot(guns, sample(deaths))

# plot a grid of charts, most with permuted Y values, one real
lineup <- function(x, y, realchart) {
    par(mfrow = c(3, 3))
    for (i in 1:9) {
        if (i==realchart) {
            plot(x, y, xlab="", ylab="")
        } else {
            plot(x, sample(y), xlab="", ylab="")
        }
    }
    par(mfrow = c(1, 1))
}

# this chart will be the one with the real data
realchart = sample(1:9, 1)

lineup(guns, deaths, realchart)
