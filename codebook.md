#Data Code Book

## Code Book Introduction

The following are the data definitions for the tidy data set, generated from the Coursera set for the Peer-reviewed project in Week 4 of "Getting and Cleaning Data."

The data is provided in this github repo and is also available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Data Definitions
* Subject - ID number identifying the person being observed in the experiment
* Activity - The activity that the subject was performing at the time of the observation.
* Variable - The variable being measured at the time of observation
* Value - The value of the variable being measured.

### Activity Definitions
Per the original, messy data set, Activity is divided into the following categories:
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

### Reading the Variables
Variable names have been transformed to be human readable. From the original, messy data set:
* "t" has been transformed to "Time" to denote a time measure
* "f" has been transformed to "Frequency" to denote a frequency measure
* Syntax has been cleaned to be Camel Casing and invalid characters (parentheticals) have been removed.

### Narrow vs. Wide Data Set
For this assignment, I considered the narrow data set tidy. Since we don't know what problem this data set is for, and we don't know if all measures are required at each observation, in my point of view, the best way to organize this data is to make it long and narrow in order to better subset for analysis.

### Acknowledgements
I have used the following sources in determining what is valid for this tidy data set:
* [thouhtfulbloke](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)'s advice on the Getting and Cleaning Data assignment.
* Hadley Wickham's paer on tidydata, as recommended by instructors.

Thank you for reading and grading!
