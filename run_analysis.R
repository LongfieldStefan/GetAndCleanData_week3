
#Read every file and look at the dimensions
test_x <- read.table(".\\data\\test\\X_test.txt")
test_y <- read.table(".\\data\\test\\y_test.txt")
train_x <- read.table(".\\data\\train\\X_train.txt")
train_y <- read.table(".\\data\\train\\y_train.txt")
subject_test <- read.table(".\\data\\test\\subject_test.txt")
subject_train <- read.table(".\\data\\train\\subject_train.txt")

activityLabels <- read.table(".\\data\\activity_labels.txt")
features <- read.table(".\\data\\features.txt")

#1. Merges the training and the test sets to create one data set.
all_x <- rbind(test_x,train_x)
all_y <- rbind(test_y,train_y)
all_subject <- rbind(subject_test, subject_train)

#Give the x-table the right colnames to make them easier to address
colnames(all_x) <- features[,2]

#2. Extract the mean and the sdt columns
mean_ColIndex <- grep("mean()", colnames(all_x), fixed = TRUE)
std_ColIndex <- grep("std()", colnames(all_x), fixed = TRUE)
mean_all_x <- all_x[,mean_ColIndex]
std_all_x <- all_x[,std_ColIndex]

#3+4. Descriptive activity names, name of the acitivity in last column with name of the activity from activity_labels
all <- cbind(all_x, 
             factor(all_y[,1], activityLabels[,1], labels = activityLabels[,2]))
colnames(all)[ncol(all)] <- "Activity"

#5. creates a second, independent tidy data set with the average of each variable(column) for each activity and each subject.
all <- cbind(all,
             factor(all_subject[,1], 1:30))
colnames(all)[ncol(all)] <- "Subject"

tidy_dataset <- aggregate(all[,1:(ncol(all)-2)], list(all$Activity, all$Subject),mean)
write.table(tidy_dataset, file = "tidy_dataset.txt", row.names = FALSE)
