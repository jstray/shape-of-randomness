# Data originally from http://www.michigan.gov/mde/0,1607,7-140-22709_31168_31530---,00.html
# schools.csv the "Fall 2012 MEAP One Year Public Results" Excel file saved as a CSV
raw = read.csv("schools.csv")

# Select only those rows for a specific school (not district), grade 4 math test, with at least 10 students
# keep only school name, number of students, score
classrows = (raw['BuildingCode'] != 0) & (raw['Subject'] == 'Reading') & (raw['Grade'] == 4) & (raw['Mean.Scale.Score.2012'] != '<10')
score = as.numeric(as.character(raw[classrows, "Mean.Scale.Score.2012"]))
classsize = as.numeric(as.character(raw[classrows, "Total.Tested.2012"]))


# plot distribution of number of students in the class
hist(score, 50)
hist(classsize, 50)

# take only very highest scoring classes, and look at their class szie
highscores = score >= 460
hist(classsize[highscores])

# compare mean of high-scoring classes vs. all
mean(classsize[highscores])
mean(classsize)

# repeat for lowest-scoring classes
lowscores = score >= 460
hist(classsize[lowscores])

# compare mean of high-scoring classes vs. all
mean(classsize[lowscores])
mean(classsize)
 
# Show overall distribution of score vs class size
plot(classsize, score)

# generate boostrap samples of test scores, class sizes
sampledscore = function() {
    sample(score, length(score), replace=TRUE)
}

sampledsize = function() {
    sample(classsize, length(classsize), replace=TRUE)
}

plot(sampledsize(), sampledscore())

# View a lot of these. Can you spot which is the real data?
realchart = sample(1:9, 1)

# Now plot the charts in a grid
par(mfrow = c(3, 3))
for (i in 1:9) {
    if (i == realchart)
        plot(classsize, score, xlab="", ylab="", cex=0.2)
    else
        plot(sampledsize(), sampledscore(), xlab="", ylab="", cex=0.2)
}




