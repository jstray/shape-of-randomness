data = read.csv("firearms.csv", header=T, sep=",")

# plot all OECD countries except the US and mexico
keeprows = data[,"OECD"]=="Y"
keeprows = keeprows & !(data[,"country"] == "United States") & !(data[,"country"] == "Mexico")
data = data[keeprows,]

# create a matrix with as many rows as countries, plus 9 columns
charts = matrix(numeric(0), dim(data)[1], 9)

# this chart will be the one with the real data
realchart = sample(1:9, 1)


# Fill columns of charts matrix with random permutations of realdata, except for realchart
for (i in 1:9) {
    if (i==realchart) {
        charts[,i] = data[, "homicides"]
    } else {
        charts[,i] = sample(data[, "homicides"], dim(data)[1])
    }

}

# Now plot the charts in a grid
par(mfrow = c(3, 3))
for (i in 1:9) {
	plot(data[,"firearms"], charts[,i], xlab="", ylab="")
}

cat("Press enter to reveal real chart\n")
readline()
cat("Real data is in chart number ", realchart, "\n")
