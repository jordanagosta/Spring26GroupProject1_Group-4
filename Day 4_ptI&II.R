hints <- read.csv("HINTSData_2020_clean.csv")
#Loads HINTS data set into a variable that we can use

barplot(table(hints$QualityCare),
        main = "Distribution of QualityCare",
        xlab = "QualityCare",
        ylab = "Frequency",
        col = "lightblue")
#display bar graph one showing distribution of QualityCare
#graph displays distribution of respondents with their
#quality care rating
barplot(table(hints$RaceEthn5),
        main = "Distribution of RaceEthn5",
        xlab = "RaceEthn5",
        ylab = "Frequency",
        col = "lightgreen")
#display graph one showing distribution of RaceEthn5
#graph displays distribution of respondents with their
#RaceEthn5 rating

hist(table(hints$Age),
     main = "Distribution of Age",
     xlab = "Age",
     ylab = "Frequency",
     col = "yellow")
#display bar graph one showing distribution of Age
#graph displays distribution of respondents with their age
hist(table(hints$BMI),
     main = "Distribution of BMI",
     xlab = "BMI",
     ylab = "Frequency",
     col = "orange")
#display graph one showing distribution of BMI
#graph displays distribution of respondents with their
#BMI rating