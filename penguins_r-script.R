# Assignment 2 - Exercise 1
# Pipeline step 1

# Author: 201903536
# Date: 02 November 2023


# This R script contains the solution for the first step of the pipeline of Assignment 2 - Exercise 1
# for the course "Data for Data Scientists"

# In this script, a function with a single argument data, that takes a dataset and performs some input 
# transformation on it is defined. The function returns the transformed data.
 

# 1. Setup: load packages
library("tidyverse")


# 2. Installing the data

# I am using the palmerpenguins dataset. 
# The description of the dataset can be found here:
# https://cran.r-project.org/web/packages/palmerpenguins/readme/README.html

# Install and load palmerpenguins data
install.packages("palmerpenguins")
library(palmerpenguins)

# The palmerpenguins package contains two datasets.
# For this exercise, we are interested in the penguins dataset.
data(package = 'palmerpenguins')

# The dataset penguins contains the size measurements for adult foraging penguins near 
# Palmer Station, Antarctica. The dataset holds 344 penguins of three different species 
# Source: https://cran.r-project.org/web/packages/palmerpenguins/readme/README.html

# Inspect the variables in penguins
summary(penguins)

# Inspect the first few rows of the dataset.
head(penguins)

# The dataset is already tidy so we can continue with the task.


# 3. Transforming the data 

# Potentially, we are only interested in penguins from the island Biscoe. 
# Therefore, we write a function that filters the dataset for penguins found on Biscoe island. 
# Furthermore, we want to get rid of missing values.

filter_biscoe <- function(dt) {
  filtered_dt <- dt %>%
    filter(island == "Biscoe") %>%
    na.omit
  return(filtered_dt)}

# Execute the function with the penguin data
# and save the filtered dataset as "filtered_peng"
filtered_peng <- filter_biscoe(penguins)

# Check the island variable
summary(filtered_peng$island)

# As we can see, the filtered dataset only contains 163 observations, 
# which all have been found on Biscoe island. 

# The new dataset is printed out below
print(filtered_peng)