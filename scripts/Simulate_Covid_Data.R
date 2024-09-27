#### Preamble ####
# Purpose: Simulates 5 Variables Relevant to the Report (ID, Age, Gender, Date and Outcome)
# Author: Dhruv Gupta
# Date: 21 September, 2024
# Contact: dhruv.gupta@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 
# Any other information needed? 


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####

simulate_covid_data <- function(n) {
  
  # Simulating ID
  ID <- 1:n
  
  # Simulating Age Group (Categorical with Normal Distribution Approximation, Mean Age 50)
  age_mean <- 50
  age_sd <- 20
  ages <- rnorm(n, mean = age_mean, sd = age_sd)
  Age_Group <- cut(ages, 
                   breaks = c(-Inf, 19, 29, 39, 49, 59, 69, 79, 89, Inf), 
                   labels = c("≤19", "20-29", "30-39", "40-49", "50-59", 
                              "60-69", "70-79", "80-89", "90+"))
  
  # Simulating Gender (With higher weight for Male and Female)
  Gender <- sample(c("Male", "Female", "Other/Unknown"), 
                   n, replace = TRUE, prob = c(0.49, 0.49, 0.02))
  
  # Simulating Reported Date (Between January 21, 2020, and February 13, 2024)
  start_date <- as.Date("2020-01-21")
  end_date <- as.Date("2024-02-13")
  Reported_Date <- sample(seq.Date(start_date, end_date, by = "day"), 
                          n, replace = TRUE)
  
  # Simulating Outcome (90% Resolved, 5% Fatal, 5% Active)
  Outcome <- sample(c("Resolved", "Active", "Fatal"), 
                    n, replace = TRUE, prob = c(0.90, 0.05, 0.05))
  
  # Creating the data frame
  simulated_data <- data.frame(ID, Age_Group, Gender, Reported_Date, Outcome)
  
  return(simulated_data)
}

set.seed(304) # Seed for Reproducibility
simulated_covid_data <- simulate_covid_data(1000)  # Simulating 1000 rows
print(head(simulated_covid_data))  # Print first few rows
