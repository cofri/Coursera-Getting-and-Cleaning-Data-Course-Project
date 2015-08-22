# Codebook for the "Getting and Cleaning Data" project

### Overview
This codebook presents the tidy data set (variables and rows) and gives the details on how the original data set was processed to get the tidy data set.


### Original data set
The description of the original experiment can be found at the website: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zipped original data set can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Information on the variables of the tidy data set

* Number of activities (rows): xxxxx
* Number of variables (columns): xxxx


### Analysis steps
This section describes the steps in the R code `run_analysis.R` to transform the original data set into the tidy data set.

1. Group the training and test sets into one data set
2. Extract only the measurements on the mean and standard deviation of the variables
3. Add a variable (column) with the descriptive activity names (defined in activity_labels.txt)
4. Change the variable names to be consistent, descriptive and clear
5. Create a new dataset (tidydataset.txt) where the variables are averaged according to the activity type and the subject
