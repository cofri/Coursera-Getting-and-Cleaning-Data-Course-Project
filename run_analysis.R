### COURSERA GETTING AND CLEANING DATA ###
### COURSE PROJECT ###
#
# Date: 2015/08/22
# Author: Corentin Friedrich
#
# Goal: From the UCI HAR Dataset, merge data sets,
# extract specific measurements, rename the variables,
# and create a new data set with the average of the measurements
# for each subject and each activity.
#
# DO NOT FORGET TO CHANGE THE WORKING DIRECTORY

## Clean the workspace, load "plyr" library and
# set working directory
rm(list=ls())
yourWorkingDirectory <- "."
library(plyr)
setwd(yourWorkingDirectory)


## Step 1 - Load and merge the training set and the test set
namesFeatures <- read.table("UCI HAR Dataset/features.txt")[,2]
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
dataTest  <- read.table("UCI HAR Dataset/test/X_test.txt")
dataMerge <- rbind(dataTrain,dataTest)
names(dataMerge) <- namesFeatures


## Step 2 - Extract the measurements on the mean and std deviation
indexMean <- grep("mean\\(\\)",namesFeatures)
indexStd <- grep("std\\(\\)",namesFeatures)
dataMerge1 <- dataMerge[,c(indexMean,indexStd)]


## 3 - Use activity name for each activity
# Add a column with the subject number
# Add a column with the descriptive activity names for each row
activitiesTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
activitiesTest <- read.table("UCI HAR Dataset/test/y_test.txt")
activitiesMerge <- rbind(activitiesTrain,activitiesTest)
activityTable <- read.table("UCI HAR Dataset/activity_labels.txt")
activityDescription <- activityTable[as.numeric(activitiesMerge[[1]]),2]
dataMerge2 <- cbind(activityDescription,dataMerge1)

subjectsTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subjectsTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjectsMerge <- rbind(subjectsTrain,subjectsTest)
dataMerge2 <- cbind(subjectsMerge,dataMerge2)
names(dataMerge2)[1] <- "Subject"


## 4 - Label the data set with descriptive variable names
tmp <- names(dataMerge2)
tmp <- sapply(tmp,function(x){gsub("-mean\\(\\)","Mean",x)})
tmp <- sapply(tmp,function(x){gsub("-std\\(\\)","Std",x)})
tmp <- sapply(tmp,function(x){gsub("\\(\\)-","",x)})
tmp <- sapply(tmp,function(x){gsub("-","",x)})
tmp <- sapply(tmp,function(x){gsub("BodyBody","Body",x)})

dataMerge3 <- dataMerge2
names(dataMerge3) <- tmp


## 5 - Create a tidy data set
# Store the average of each variable for each activity 
# and each subject. Store the new set into a text file
fileName <- "tidyDataset.txt"
dataTidy <- ddply(dataMerge3,.(Subject,activityDescription),
                  function(x){colMeans(x[,3:ncol(dataMerge3)])})
write.table(dataTidy,file=fileName,row.names = FALSE)
