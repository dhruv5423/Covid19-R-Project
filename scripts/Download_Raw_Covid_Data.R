#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Dhruv Gupta
# Date: 21 September, 2024
# Contact: dhruv.gupta@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
install.packages(opendatatoronto)
library(opendatatoronto)
library(tidyverse)

#### Download data ####

# get package
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")
print(resources)

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_covid_data <- filter(datastore_resources, row_number()==2) %>% get_resource()
raw_covid_data


#### Save data ####

# Write CSV File into Raw Data Folder in Project
write_csv(raw_covid_data, "data/raw_data/raw_covid_data.csv") 
