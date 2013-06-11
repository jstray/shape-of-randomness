# two sets of measurements
a = c(0.90, 0.93, 1.25, 1.24, 1.38, 0.94, 1.14, 0.73, 1.46)
b = c(1.15, 0.88, 0.90, 0.74, 1.21)

# different means, a slighltly larger
mean(a)
mean(b)

# plot both on same graph
plot(a, rep(0, length(a)), col="red")
points(b, rep(-0.5, length(b)), col="blue")


# put all measurements in the same bucket, and try all possible assignments between a and b
testvector <- function(a, b) {
    samples = c(a,b)
    permuted = sample(samples, replace=FALSE)
    new_a = permuted[1:length(a)]
    new_b = permuted[(length(a)+1):length(permuted)]
    list(new_a, new_b)
}

# test statistic: difference in means
meandif <- function(vecs) {
    abs(mean(unlist(vecs[1])) - mean(unlist(vecs[2])))
}

# so what does that distribution look like? and where's the observed mean?
plotmeanperm <- function(a,b) {
    hist(replicate(10000, meandif(testvector(a,b))), breaks=50, xlim=c(0, 0.5))
    abline(v = mean(a)-mean(b), col = "blue", lwd = 2)
}

plotmeanperm(c(0.90, 0.93, 1.25, 1.24, 1.38, 0.94, 1.14, 0.73, 1.46), c(1.15, 0.88, 0.90, 0.74, 1.21))


# use synthetic data so show effect of sample size
plotsamplesize <- function(n) {
    fake_a = rnorm(n, mean(a), sd(a))    
    fake_b = rnorm(n, mean(b), sd(b))
    plotmeanperm(fake_a, fake_b)
}