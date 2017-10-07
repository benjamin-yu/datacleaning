# Coursera Getting and Cleaning Data Peer Course

The code in this repo prepares a tidy dataset based on lessons from the Coursera "Getting and Cleaning Data" course. The R script will take the requested data, as provided by the instructors, and turns it into a narrow data set. The original data file can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

---
## Project Summary
The following is a project summary from the Coursera assignment.

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

---
## Repo Contents
It contains the following files:
* This README file
* codebook.md - Use this file to interpret the variables and if you have any questions on methodology
* run_analysis.R - R script used to create "tidy.txt" data set
* tidy.txt - Text output of tidy dataset, as requested per the assignment

## Prerequisites
You will need the dplyr and reshape2 packages in order to run the R script.