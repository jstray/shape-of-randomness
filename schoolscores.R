# Data originally from http://www.michigan.gov/mde/0,1607,7-140-22709_31168_31530---,00.html
# schools.csv the "Fall 2012 MEAP One Year Public Results" Excel file saved as a CSV
raw = read.csv("schools.csv")

# Select only those rows for a specific school (not district), grade 4 math test, with at least 10 students
# keep only school name, number of students, score
schoolrows = (raw['BuildingCode'] != 0) & (raw['Subject'] == 'Reading') & (raw['Grade'] == 4) & (raw['Mean.Scale.Score.2012'] != '<10')
schoolcols = c("BuildingName", "Total.Tested.2012", "Mean.Scale.Score.2012")
scores = raw[schoolrows, schoolcols]
names(scores) = c("School", "ClassSize", "Score")
scores[,"ClassSize"] = as.numeric(as.character(scores[,"ClassSize"]))
scores[,"Score"] = as.numeric(as.character(scores[,"Score"]))


# plot distribution of number of students in the class
hist(scores[,"ClassSize"], 50)
hist(scores[,"Score"], 50)

# take only very highest scoring classes, and look at their class szie
highscores=scores['Score'] >= 460
hist(scores[highscores,'ClassSize'])

# compare mean of high-scoring classes vs. all
mean(scores[highscores,'ClassSize'])
mean(scores[,'ClassSize'])

# repeat for lowest-scoring classes
lowcores=scores['Score'] <= 400
hist(scores[highscores,'ClassSize'])

# compare mean of high-scoring classes vs. all
mean(scores[highscores,'ClassSize'])
mean(scores[,'ClassSize'])
 
# Show overall distribution of score vs class size
plot(scores[,"ClassSize"], scores[,"Score"])