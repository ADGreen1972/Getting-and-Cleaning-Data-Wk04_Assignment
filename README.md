# Getting_and_Cleaning_Data_Wk_04_Assignment

This repository was created to complete the assignment for Week 4 of the Getting and Cleaning Data Coursera module.

# Summary of Code Steps

Note that the code is stored within the run_analysis.R script. Also I manually downloaded the zip bundle and copied across the relevant files and folders into my working directory.

The code performs the following steps:

1) Read in the activity labels data (activity_labels.txt) and convert them to character
2) Read in the features data (features.txt) and convert to character
3) Elicit out of features the vector components that relate to values containing the strings mean or std
4) Of 3) above, extract the values (e.g. "tBodyAcc-mean()-x")
5) Of 4 above, remove characters shuch as - and []
6) Next, read in the training data (X_train.txt), but only retain the components pre-determined in 3) above
7) Read in the training subjects data (subject_train.txt)
8) Read in the training activities data (Y_train.txt)
9) Column bind 6), 7) and 8) above into a new data set (Train_Full)
10) Next repeat steps 6) to 9) above, but with the applicable test data sets - the final test data set is called Test_Full
11) Concatenate Train_Full and Test_Full to form the analysis data set (Comb_Data)
12) Add in the labels to Comb_Data - utilise the character vector built at end of 5) above
13) Convert both the Subject and Activity variables to factors - the latter uses the activity labels
14) Use the melt function to granulise the data - each row is now uniquely identified by a) Subject, b) Activity and c) Metric (e.g. TBodyAccMeanX()), d) value
15) 

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

