Peer-graded Assignment: Getting and Cleaning Data Course Project
----------------------------------------------------------------

The purpose of this project is to demonstrate the ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis

Data for the project
--------------------

One of the most exciting areas in all of data science right now is
wearable computing. Companies like Fitbit, Nike, and Jawbone Up are
racing to develop the most advanced algorithms to attract new users. The
data set is collected from the accelerometers from the Samsung Galaxy S
smartphone.

-   [Full description of the data at the site where it is
    obtained](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
    </br>
-   [Data for the project: UCI HAR
    Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Files
-----

This repository contains:

-   `README.txt` that explains the analysis files.

-   `CodeBook.md` which is a code book that describes the variables, the
    data, and any transformations or work that is performed to clean up
    the data.

-   `run_analysis.R` which performs data cleaning in these 5 steps:

1.  Merges the training and the test sets to create one data set
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement
3.  Uses descriptive activity names to name the activities in the data
    set
4.  Appropriately labels the data set with descriptive variable names
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject

-   `TidyData.txt`, a data set from step 4 of `run_analysis.R`
