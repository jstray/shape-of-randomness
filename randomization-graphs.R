# generate y = 1..n +/- v
corrdata <- function(n, v) {
	1:n + (runif(n)-0.5)*2*v
} 

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

n = 32
x = 1:n
y = corrdata(n, 15)

lineup(x,y,3)