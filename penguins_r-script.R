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
library("randomNames")

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


# 3. Modifying the function


# Modify the previously written function by adding a second variable
# Create a function filter_biscoe that not only filters for Biscoe penguins 
# but also assigns names from a list of randomly generated names to the observations 
# by creating a "names" column. Furthermore, a "first_letter" column is created that 
# indicates the initial for each observation. The function returns the modified dataset.

filter_biscoe <- function(dt, ls) {
  filtered_dt <- dt %>%
    filter(island == "Biscoe") %>%
    na.omit
  
  filtered_dt$name = ls
  
  require(stringr)
  filtered_dt$first_letter <- str_extract(filtered_dt$name, "[aA-zZ]{1}")
  
  # Arrange the columns so that first letter and name are in the first two columns
  final_dt <- filtered_dt %>%
    select(first_letter, name, everything())
  
  return(final_dt)}


# 4. Executing the function

# The input factors of the modified function are (1) the penguins dataset and 
# (2) a list containing 163 random names that can be assigned to the 163 observations
# of the penguins dataset after filtering for Biscoe Island penguins only

# Generate 163 random names; set a seed for reproducability
set.seed(100)
names_list = randomNames(163, which.names = "first")

# Execute the function with the penguin data; save the filtered dataset as "filtered_peng"
modified_peng <- filter_biscoe(penguins, names_list)

# Investigate the filtered_peng dataset
head(modified_peng)