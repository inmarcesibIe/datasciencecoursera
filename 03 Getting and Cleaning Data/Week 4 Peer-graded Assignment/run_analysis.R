# You should create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load dplyr package
library(dplyr)

# 1. Merges the training and the test sets to create one data set.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("column", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Activity", "activity name"))

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
x <- rbind(x_train, x_test)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity")
y <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
subject <- rbind(subject_train, subject_test)

data <- cbind(subject, y, x)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
tidydata <- select(data, Subject, Activity, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set
tidydata$Activity <- activities[tidydata$Activity, 2]

# 4. Appropriately labels the data set with descriptive variable names.
names(tidydata) <- gsub("^t", "Time", names(tidydata))
names(tidydata) <- gsub("^f", "Frequency", names(tidydata))
names(tidydata) <- gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata) <- gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata) <- gsub("BodyBody", "Body", names(tidydata))
names(tidydata) <- gsub("Mag", "Magnitude", names(tidydata))
names(tidydata) <- gsub("tBody", "TimeBody", names(tidydata))
names(tidydata) <- gsub("angle", "Angle", names(tidydata))
names(tidydata) <- gsub("gravity", "Gravity", names(tidydata))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData <- tidydata %>% group_by(Subject, Activity) %>% summarise_all(mean)
write.table(TidyData, "TidyData.txt", row.name=FALSE)