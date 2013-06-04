
# create a vector of (random) time series data with n entries
timeseries <- function(n) {
    runif(n, min=0, max=10)
}

# plot a random graph, with trendline
x = 1:5
t = timeseries(5) 
plot(t)
abline(lm(t~x), col='gray')

# plot many trend line graphs
manytrends <- function(n) {
    par(mfrow = c(3, 3))
    for (i in 1:9) {
        x = 1:n
        t = timeseries(n)
        plot(t)
        abline(lm(t~x), col='gray')
    }
    par(mfrow = c(1, 1))
}

manytrends(5)