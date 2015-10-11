# run_analysis.R
# Jasmine Mou
# 2015-10-11
# Reference: http://www.cookbook-r.com/Manipulating_data/Summarizing_data/
# Github Link: https://github.com/ForLearningDataScience/GettingAndCleaningDataCourseProject

library(plyr)

### 1. Merges the training and the test sets to create one data set.
x_train <- read.table("dataset/train/X_train.txt")
y_train <- read.table("dataset/train/Y_train.txt")
subject_train <- read.table("dataset/train/subject_train.txt")

x_test <- read.table("dataset/test/X_test.txt")
y_test <- read.table("dataset/test/Y_test.txt")
subject_test <- read.table("dataset/test/subject_test.txt")

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("dataset/features.txt")
mean_std_indexes <- grep("-(mean|std)\\(\\)", features[, 2])
x_mean_std <- x[, mean_std_indexes]


## 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("dataset/activity_labels.txt")

### replace the feature numbers with according activity names.
y[,1] <- activities[y[,1], 2]


## 4. Appropriately labels the data set with descriptive variable names.

### replace column numbers with according column names.
colnames(y) <- "Activity"
colnames(subject) <- "Subject"
colnames(x_mean_std) <- features[mean_std_indexes,2]

### combine the mean and average of the data into one data set.
data_mean_std <- cbind(x_mean_std, y, subject)


## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
tidy <- ddply(.data = data_mean_std, .variables = c("Activity", "Subject"), .fun = function(data_mean_std) colMeans(data_mean_std[,1:66]))
write.table(tidy, file = "averages_Activity_Subject.txt", row.name = FALSE)
