Getting and Cleaning Final Project

The purpose of this project is to take a given set of data and manipulate it into a tidy data set. This tidy data set is suppose to reflect
the average of specific variables from a raw data set that are grouped by the volunteers and the activites explained below. The raw data
was given from a Human Acitity Regcognition Using Smartphones data set. 

The expriment included a group of 30 volunteers, split into a test and train group (30%/70% respectively) within an age bracket of 
19-48 years old. Each volunteer performed 6 activites (laying, sitting, standing, walking, walking upstairs, and walking downstairs)
wearing a smartphone that captured linear acceleration and angular velocity at a consistent rate of 50 Hz.

Contents

This repository contains:

  1) run.analysis.R file - loads the original data set, that shows the steps to manipulating the data to make it tidy.
  2) ReadMe.md file - summarizes the analysis files.
  3) gac_codebook.txt file - explains the scope of the newly transformed data set.
  
Packages used:

  1) dplyr package - used for filtering and merging the data
  2) tiydr package - used for arranging data into the final tidy data set
