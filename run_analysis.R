## This script takes data from the following URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## The script will then merge the training and test data, extract mean and stdev for each measure, and
## creates a tidy data set.

## Required packages: dplyr, tidyr
library(dplyr)
library(reshape2)

# Set Working Directory
# setwd("~/Desktop/Open Items/coursera/Coursera-CleanData/peer-assignment")

# Download dataset to working directory, if it does not already exist.
if (!file.exists("dataset")) {
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip")
        unzip("data.zip")
        file.rename("UCI Har Dataset", "dataset")
        file.remove("data.zip")
}

# Import Activity Labels into R
features <- read.table("dataset/features.txt", col.names = c("featuresid", "measure"))

# Import the Test data into R
test_subject <- read.table("dataset/test/subject_test.txt", col.names = "subjectid")
test_activity <- read.table("dataset/test/y_test.txt", col.names = "activityid")
test_measure <- read.table("dataset/test/X_test.txt")
colnames(test_measure) <- features$measure # apply names of measures to columns

# Merge the Test data into one table
test_all <- cbind(test_subject, test_activity, test_measure)

# Repeat import activity for Training Data
train_subject <- read.table("dataset/train/subject_train.txt", col.names = "subjectid")
train_activity <- read.table("dataset/train/y_train.txt", col.names = "activityid")
train_measure <- read.table("dataset/train/X_train.txt")
colnames(train_measure) <- features$measure # apply names of measures to columns
train_all <- cbind(train_subject, train_activity, train_measure)

## Merge Training and Test Sets
merged <- rbind(test_all, train_all)

# Extract the measures on the mean and standard deviation for each measurement.
library(dplyr)

# I have interepreted the request as pulling measures ONLY with the mean and standard deviation.
# That means I have not included measures like meanFreq in the dataset


# Change Column names into valid columns for dplyr. Solution was found here:
# https://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name
valid_column_names <- make.names(names=names(merged), unique=TRUE, allow_ = TRUE)
names(merged) <- valid_column_names

# Select the columns that contain identifying information and measures
selected <- select(merged, subjectid, activityid, contains("mean..."), contains("std.."))

# Replace the activity id with the labeled activity.
activity_labels <- read.table("dataset/activity_labels.txt", col.names = c("activityid", "activity"))
selected <- join(selected, activity_labels) %>% select(-activityid) %>% select(subjectid, activity, everything())

## Name the activities in the data set descriptively. 

selected <- rename(selected, Subject = subjectid, Activity = activity) #rename identifiers

#rename selected measures based on "features_info.txt" file provided with data
names(selected) <- gsub("^t", "Time", names(selected))
names(selected) <- gsub("^f", "Frequency", names(selected)) 
names(selected) <- gsub("mean","Mean", names(selected)) #Capitalize M in "mean" for camel casing
names(selected) <- gsub("std","Std", names(selected)) #Capitalize S in "std" for camel casing
names(selected) <- gsub("\\.", "", names(selected)) # general cleanup from make.names function


## Label the data set with descriptive variable name.
selected <- rename(selected, Testsubject = subjectid, Action = activity)

## Create a tidy data set with the average of each variable for each activity and each subject.
tidy <- melt(selected, id.vars = c("Subject", "Activity"))
tidy <- arrange(tidy, Subject, Activity) %>% rename(Variable = variable, Value = value)
write.table(tidy, file = "tidy.txt", row.names = FALSE)