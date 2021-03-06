# Coursera-Getting-and-Cleaning-Data-Course-Project

## Overview

This repository is part of a course project from "Getting and Cleaning Data" on Coursera. The aim of the project is to provide a tidy data set from the [UCI Har Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

## How to use it

The main R code is `run_analysis.R`. It computes the cleaning of the data set and creates a second data set stored in `tidydataset.txt`.

The original unzipped folder of the data set should be in the same directory as the `run_analysis.R`. When cloning this repo, the following folder structure should be used for the data analysis:
```
working directory /
     run_analysis.R
     UCI HAR Dataset /
         activity_labels.txt
         ...
         ...
```

## Files

* `run_analysis.R`: R code to perform the cleaning of the data set
* `CodeBook.md`: documentation on the variables of the data set and on the operations to get the tidy data
* `tidydataset.txt`: text file containing the tidy data set, generated by the R code
