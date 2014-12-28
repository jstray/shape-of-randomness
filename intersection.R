# Simulation of accidents at an intersection 

# create a time series of accident counts per year by using Poisson distribution
timeseries <- function(n) {
    rpois(n, 5)
}

# plot a random graph, with year labels
# Pretend this is accidents per year at an intersection
randomaccidents <- function(n) {
	year = 1:n
	accidents = timeseries(n) 
	plot(year,accidents,type='o')
}

# suppose we observe this...
observed <- function() {
    year = 1:5
    accidents = c(3,9,2,5,1)
    plot(year,accidents,type='o')
}


# plot many intersections/accidents
many <- function(n) {
    par(mfrow = c(3, 3))	# 9 up
    par(oma=c(2,2,2,2))		# smaller margins
	par(mar=c(2,2,2,2))
    for (i in 1:9) {
        year = 1:n
        accidents = timeseries(n)
		plot(year,accidents,type='o',ann=FALSE, ylim=c(0, n*2)) # no axis labels
    }
    par(mfrow = c(1, 1))
}

many(5)
