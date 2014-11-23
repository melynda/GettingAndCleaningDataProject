# CodeBook
## Getting and Cleaning Data Project

## Explanation of data, variables, and transformations 

First, read the needed text files in using read.table:
activity_labels <— activity_labels.txt, which contains names for the activities.
features <- features.txt, which contains a list of all features.
subject_train.txt, which contains subject numbers for the training dataset.
x_train <- X_train.txt, which contains the metric values of the training data.
y_train <- y_train.txt, which contains the activity numbers of the training set. 
subject_train <- subject_test.txt, which contains the subject numbers for the test dataset.
x_test <- X_test.txt, which contains the metric values of the test data.
y_test <- y_test.txt, which contains the activity numbers of the test set.

Second, merge the training set, test set, and subjects:
merged_x contains the x_train and x_test data merged using rbind.
merged_y contains the y_train and y_test data merged using rbind.
subject contains the subject_train and subject_test data merged using rbind.

Next, give the columns of the merged data sets descriptive names:
Give the columns of merged_x names from column 2 of the features data.
Give the column name of merged_y the name “activity_id”.
Give the column name of merged_subject the name “subject”.
Give the column names of activity_labels the names “activity_id” and “activity”.

The next step is to extract only the measurements on the mean and standard deviation for each measurement, 
use grep on the second column of the features data to find matches for mean and std.
Save the results into mean_stddev.  Extract from the dataset merged_x the measurements that match
the list mean_stddev, and save the extracted data as merged_x_mean_stddev.

Next, merge the merged_y data and the activity_labels, and save the merged data as merged_y_activities.  
Use cbind to merge the merged_x_mean_stddev dataset with the activity labels in the merged_y_activities dataset, and save this merged data as merged_data_mean_stddev.  Use bind to merge this merged data with the subject data, and save as merged_all_data_mean_stddev.  Write this dataset to a text file named merged_data_mean_stddev.txt.

Create the tidy data as follows.  Use the melt() function (which is included in the R package reshape2), to “melt” the merged_all_data_mean_stddev data so that each row is a unique id-variable combination of subject and activity.  Save the melted data as melted_data.  Then, use the dcast() function (which is also included in the R package reshape2), to cast the melted_data into a data frame by averaging activity and subject.  Save this data frame as tidy_data_avg_mean_stddev, and then write this data frame to a text file named tidy_data_avg_mean_stddev.txt.





