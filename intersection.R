# Simulation of accidents at an intersection 

# create a time series of accident counts per year by using Poisson distribution
timeseries <- function(n,rate) {
    rpois(n, rate)
}

# plot a random graph, with year labels
# Pretend this is accidents per year at an intersection
randomaccidents <- function(n) {
	year = 1:n
	accidents = timeseries(n,5) 
	barplot(accidents, names=year, ylab="accidents", xlab="year", ylim=c(0,10))
	abline(v=2.5, col="red")
}

# suppose we observe this...
observed <- function() {
  year = 1:5
  accidents = c(6,9,2,5,1)
  barplot(accidents, names=year, ylab="accidents", xlab="year", ylim=c(0,10))
  abline(v=2.5, col="red")
}
observed()

# plot many intersections/accidents
many <- function(n,rate,label) {
    par(mfrow = c(3, 3))	# 9 up
    par(oma=c(2,2,2,2))		# smaller margins
	  par(mar=c(2,2,2,2))
    for (i in 1:9) {
        year = 1:n
        accidents = c(6,9,timeseries(3,rate))
        barplot(accidents, ylim=c(0,10), main=i)
        abline(v=2.5, col="red")    
    }
    par(mfrow = c(1, 1))
    title(label, outer=TRUE, cex.main=0.8)
}

many(5,5, "Simulated without stoplight")
many(5,2.5, "Simulated with a 50% effective stoplight")
