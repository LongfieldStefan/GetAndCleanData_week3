---
title: "CodeBook for run_analysis.R"
output: html_document
---
=========================================

##Data set files

The dataset contains the following files (information taken from Readme.txt of the dataset):


* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

=========================================

##R data variables

The R script contains the following variables, containg the data described above:

* test_x

* test_y

* train_x

* train_y

* subject_test

* subject_train

* activityLabels

* features

=========================================

##Procedure

In the first section, the test and train datasets for x, y and subjects are merged to 'all_x', 'all_y' and 'all_subject', respectively.

With the data contained in 'features', the columns of the dataset in 'all_x' can be named.

In the second section, all mean and standard deviation measurements are extraced and stored in 'mean_all_x' and 'mean_all_std', respectively.

In the third+fourth section, each observation is labeled with an Activity name, taken from the data in 'activityLabels' and 'all_y'. This labeled data is stored in 'all'.

In the fifth section, each observation is also labeled by a subject, this is which person the measurement belongs to.

At last, the average of each variable for each activity and each subject is stored in tidy_dataset and written to a textfile 'tidy_dataset.txt'.

