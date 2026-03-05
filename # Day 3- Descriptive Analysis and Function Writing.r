# Install packages if needed (run once)
# install.packages("dplyr")
# install.packages("skimr")

# Load libraries
library(dplyr)
library(skimr)

# Select continuous variables only
continuous_vars <- HINTSData_2020_clean %>%
  select(Age,
         AvgDrinksPerWeek,
         WeeklyMinutesModerateExercise,
         BMI)

summary(continuous_vars)
colMeans(continuous_vars, na.rm = TRUE)
apply(continuous_vars, 2, sd, na.rm = TRUE)
apply(continuous_vars, 2, var, na.rm = TRUE)

"The five number summaries provide information about the distribution of each continuous variable. The mean and median values allow us to assess symmetry, while the range and interquartile range indicate variability. Standard deviation and variance quantify dispersion around the mean. Variables such as WeeklyMinutesModerateExercise and AvgDrinksPerWeek may show larger variability, indicating behavioral differences across participants."

HINTSData_2020_clean$smokeStat <- as.factor(HINTSData_2020_clean$smokeStat)

grouped_summary <- HINTSData_2020_clean %>%
  group_by(smokeStat) %>%
  summarise(
    mean_age = mean(Age, na.rm = TRUE),
    sd_age = sd(Age, na.rm = TRUE),
    var_age = var(Age, na.rm = TRUE),
    
    mean_drinks = mean(AvgDrinksPerWeek, na.rm = TRUE),
    sd_drinks = sd(AvgDrinksPerWeek, na.rm = TRUE),
    var_drinks = var(AvgDrinksPerWeek, na.rm = TRUE),
    
    mean_exercise = mean(WeeklyMinutesModerateExercise, na.rm = TRUE),
    sd_exercise = sd(WeeklyMinutesModerateExercise, na.rm = TRUE),
    var_exercise = var(WeeklyMinutesModerateExercise, na.rm = TRUE),
    
    mean_BMI = mean(BMI, na.rm = TRUE),
    sd_BMI = sd(BMI, na.rm = TRUE),
    var_BMI = var(BMI, na.rm = TRUE)
  )

grouped_summary

"When indicating the smoking status, mean and variability are observed. For example, the average BMI, alcohol consumption, and exercise levels may be different compared to non-smokers. These descriptive statistics highlight behavioral and health differences associated with smoking status in this population."

skim(continuous_vars)

my_summary_func <- function(data) {
  
  results <- data.frame(
    Variable = colnames(data),
    Mean = sapply(data, mean, na.rm = TRUE),
    SD = sapply(data, sd, na.rm = TRUE),
    Variance = sapply(data, var, na.rm = TRUE),
    Min = sapply(data, min, na.rm = TRUE),
    Q1 = sapply(data, quantile, probs = 0.25, na.rm = TRUE),
    Median = sapply(data, median, na.rm = TRUE),
    Q3 = sapply(data, quantile, probs = 0.75, na.rm = TRUE),
    Max = sapply(data, max, na.rm = TRUE)
  )
  
  return(results)
}

my_summary_func(continuous_vars)

"The custom function my_summary_func successfully compares the five-number summary, the mean, standard deviation, and variance for each continuous variable. This function allows for an efficient way of calculate multiple statistical interpretations at once."




