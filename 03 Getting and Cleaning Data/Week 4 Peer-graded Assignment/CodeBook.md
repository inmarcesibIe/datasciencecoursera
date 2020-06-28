Code Book
=========

The `run_analysis.R` script performs data cleaning in the following 5
steps:

1. Merges the training and the test sets to create one data set.
----------------------------------------------------------------

-   Load the `dplyr` package.
-   Read the txt files in the UCI HAR Dataset folder and assign each
    data to a variable.
-   Use `rbind` and `cbind` to create merged data.

2. Extracts only the measurements on the mean and standard deviation for each measurement
-----------------------------------------------------------------------------------------

-   Use `select` to select the columns in `tidydata` that contain
    `Subject`, `Activity` and the measurements on the mean and standard
    deviation for each variable.

3. Uses descriptive activity names to name the activities in the data set
-------------------------------------------------------------------------

Replace the numerical codes for the activities in all the rows of the
`Activity` column in `tidydata` data frame with the corresponding names
of the activities found in the second column of the `activities`
variable.

4. Appropriately labels the data set with descriptive variable names
--------------------------------------------------------------------

-   Replace all starting character `f` in column’s name by `Frequency`
-   Replace all starting character `t` in column’s name by `Time`
-   Replace all `Acc` in column’s name by `Accelerometer`
-   Replace all `Gyro` in column’s name by `Gyroscope`
-   Replace all `BodyBody` in column’s name by `Body`
-   Replace all `Mag` in column’s name by `Magnitude`
-   Replace all `angle` in column’s name by `Angle`
-   Replace all `gravity` in column’s name by `Gravity`

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
------------------------------------------------------------------------------------------------------------------------------------------------

-   Create `TidyData` data frame which groups `tidydata` by subject and
    activity first and then take the mean of each activity and each
    subject.
-   Use `write.table` to export `TidyData` data frame into
    `TidyData.txt` file.
