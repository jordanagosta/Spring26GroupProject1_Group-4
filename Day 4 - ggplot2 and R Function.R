library(ggplot2)
#load the ggplot2 package for advanced data visualization 
ggplot(hints_subset, aes(x=Age)) + 
  geom_histogram()
#histogram of age 
#this graph displays the distribution of respondents' ages 
#a histogram is appropriate because Age is a continuos variable 

ggplot(hints_subset, aes(x=BMI)) + 
  geom_histogram()
#histogram of BMI 
#shoes how BMI values are distributed among participants 
#it helps identify patterns such as normal distribution or skewness 

ggplot(hints_subset, aes(x=QualityCare)) + 
  geom_bar()
#bar chart for QualityCare 
#graph shoes the frequency of each perceived healthcare quality rating 

ggplot(hints_subset, aes(x=RaceEthn5)) + 
  geom_bar()
#bar chart for Race/Ethnicity, observes groups that are most represented in data


my_visual_func_I <- function(data, variable){
  barplot(table(data[[variable]]),
          main = paste("Distribution of", variable),
          xlab = variable,
          ylab = "Frequency")
}
#bar chart for categorical variables 
#calculates category frequencies 

my_visual_func_I(hints_subset, "QualityCare")
#bar chart for QualityCare

my_visual_func_I(hints_subset, "RaceEthn5")
#bar chart for Race/Ethnicity 

my_visual_funn_II <-function(data, variable){
  hist(data[[variable]],
       main=paste("Distribution of", variable),
       xlab = variable)
}
#histogram for continuous variables and distribution of numeric data 

my_visual_funn_II(hints_subset, "Age")
my_visual_funn_II(hints_subset, "BMI")
#comman generates histogram for continous variables 