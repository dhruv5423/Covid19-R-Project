#### Preamble ####
# Purpose: Tests on Cleaned Data
# Author: Dhruv Gupta
# Date: 22 September, 2024
# Contact: dhruv.gupta@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# Any other information needed? 


#### Workspace setup ####
library(tidyverse)

cleaned_covid_data <- read_csv("data/analysis_data/cleaned_covid_data.csv")

#### Test data ####

## Test 1: NAs Test in Variables of Interest

sum(is.na(cleaned_covid_data$age_group))
sum(is.na(cleaned_covid_data$client_gender))
sum(is.na(cleaned_covid_data$outcome))


## Test 2: Empty Strings Test in Variables of Interest

sum(cleaned_covid_data$age_group == "")
sum(cleaned_covid_data$client_gender == "")
sum(cleaned_covid_data$outcome == "")

## Test 3: Tests for Appropriate Values in Variables of Interest

# 3a) Test for Unique Gender Values to only return MALE, FEMALE, and OTHER

unique(cleaned_covid_data$client_gender)

# 3b) Test for Unique Age Values to return Correct and Logical Age Bins

unique(cleaned_covid_data$age_group)

# 3c) Test for Unique Outcome Values to only return RESOLVED, ACTIVE, and FATAL

unique(cleaned_covid_data$outcome)
