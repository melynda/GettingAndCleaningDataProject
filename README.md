GettingAndCleaningDataProject README
====================================

Contains files for the course project - Coursera Getting and Cleaning Data


#### Project Description

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#####CodeBook.md is the markdown file contained in this repository that contains an explanation of all data, variables and transformations.

#####run_analysis.R is the project file contained in this repository that accomplishes the following:
* Merges the training and the test sets to create one data set. The x_train and x_test data are merged using rbind; the y_train and y_test data merged using rbind; the subject_train and subject_test data merged using rbind.
* Extracts only the measurements on the mean and standard deviation for each measurement.  Grep is used on the features data to find names of all measurements with mean or standard deviation.  The mean and standard deviation measurements are then extracted from the merged_x data.
* Uses descriptive activity names to name the activities in the data set.  The merged_x data is given column names from the features data. 
* Appropriately labels the data set with descriptive variable names.  Merged_y data is named “activity_id”, and the merged_subject data is named “subject”. The activity_labels columns are named “activity_id” and “activity”.
* From the data set achieved from the steps above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The merged_x_mean_stddev dataset is merged with the activity labels.  The resulting data is merged with the subject data. The result is saved as merged_all_data_mean_stddev.  The melt() function (which is included in the R package reshape2) is used to “melt” the merged_all_data_mean_stddev data so that each row is a unique id-variable combination of subject and activity.  The dcast() function (which is also included in the R package reshape2) is used to cast the melted data into a data frame by averaging activity and subject, thereby producing the independent tidy data set.

#####tidy_data_avg_mean_stddev.txt is the independent tidy data set produced by the run_analysis.R script.  This data set contains the average of each variable for each activity and each subject.


#### Helpful links regarding project and source files:
* [Link to Coursera project description page](https://class.coursera.org/getdata-009/human_grading/view/courses/972587/assessments/3/submissions)
* [Link to full description of source files](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Download link to source files](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
