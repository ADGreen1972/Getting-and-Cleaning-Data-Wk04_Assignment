# Getting_and_Cleaning_Data_Wk_04_Assignment

This repository was created to complete the assignment for Week 4 of the Getting and Cleaning Data Coursera module.

# Summary of Code Steps

Note that the code is stored within the run_analysis.R script. Also I manually downloaded the zip bundle and copied across the relevant files and folders into my working directory.

The code performs the following steps:

1) 

# Input Data Sets

1) activity_labels.txt (lookup table for the activity types e.g. 1 = WALKING
2) features.txt (lookup table for all the metrics. Note that we only require metrics which have mean and std embedded within their name)

3) X_train.txt (the training data - each column represents a metric and the rows the subjects)
4) subject_train.txt (lookup table of all the training subjects)
5) Y_train.txt (lookup table of all the training activities)

6) X_test.txt (the test data - each column represents a metric and the rows the subjects)
7) subject_test.txt (lookup table of all the test subjects)
8) Y_test.txt (lookup table of all the test activities)

# Output Data Set

The R code in run_analysis.R creates a single summary output file called Tidy_Data.txt - this is a summarisation of each combination of Subject by Activity for each mean and std metric. The cell values represent the mean of each combination.

