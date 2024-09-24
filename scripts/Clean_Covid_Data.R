#### Preamble ####
# Purpose: Cleans the Raw Data
# Author: Dhruv Gupta
# Date: 22 September, 2024
# Contact: dhruv.gupta@mail.utoronto.ca
# License: MIT
# Pre-requisites: Raw Data Necessary


#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_covid_data <- read_csv("data/raw_data/raw_covid_data.csv")

cleaned_covid_data <- raw_covid_data %>%
  
  ## Selecting the Variables of Interest
  select(`X_id`, `Age.Group`, `Client.Gender`, `Reported.Date`, `Ever.in.ICU`, `Ever.Hospitalized`, `Ever.Intubated`, `Outcome`)  %>%
  
  ## Cleaning the Names of the Variables
  janitor::clean_names() %>%
  
  ## Correctly arranging Reported Dates in Chronological Order
  mutate(reported_date = as.Date(reported_date, format = "%Y_%m_%d")) %>%
  arrange(reported_date) %>%
  
  ## Matching Case ID's to Chrononogically Arranged Dates
  mutate(x_id = row_number()) %>%
  
  ## Remove NA Values
  drop_na() %>%
  
  ## Group all other Gender Values (other than MALE and FEMALE) as OTHER
  mutate(client_gender = case_when(
    client_gender %in% c("MALE", "FEMALE") ~ client_gender,  # Keep "MALE" and "FEMALE" as they are
    client_gender %in% c("UNKNOWN", "OTHER", "NON-BINARY", "TRANSGENDER", 
                         "TRANS WOMAN", "TRANS MAN", "NOT LISTED, PLEASE SPECIFY") ~ "OTHER",  # Group others as "OTHER"
    TRUE ~ client_gender  # Keep any other values unchanged (if any)
  ))

#### Save data ####
write_csv(cleaned_covid_data, "data/analysis_data/cleaned_covid_data.csv")

