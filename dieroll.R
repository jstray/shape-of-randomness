
# roll a six-sided die
dieroll <- function() {
    sample(1:6, 1)
}

# roll two six-sided dice and add them
twodieroll <- function() {
    dieroll() + dieroll()
}

# what do we see if we roll two dice 100 times?
rolls = replicate(100, twodieroll())

# count the number of ways to get each sum
count = rep(0, 12)
for (i in 1:6) { 
    for (j in 1:6) {
        sum = i+j
        count[sum] = count[sum] + 1
    }
}

# look at the histogram for 100 rolls
hist(replicate(100, twodieroll()), breaks=seq(1:12))

# look at lots of histograms for 100 rolls
manyrolls <- function(n) {
    par(mfrow = c(3, 3))
    for (i in 1:9) {
        hist(replicate(n, twodieroll()), breaks=seq(1:12), xlab=NULL, ylab=NULL, main=NULL)
    }
}

manyrolls(100)
