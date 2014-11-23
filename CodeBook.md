# CodeBook
## Getting and Cleaning Data Project

### Explanation of data, variables, and transformations 

#### First, read the needed text files in using read.table:
* activity_labels <— activity_labels.txt, which contains names for the activities.
* features <— features.txt, which contains a list of all features.
* subject_train <- subject_train.txt, which contains subject numbers for the training dataset.
* x_train <— X_train.txt, which contains the metric values of the training data.
* y_train <— y_train.txt, which contains the activity numbers of the training set.
* subject_test <- subject_test.txt, which contains the subject numbers for the test dataset.
* x_test <— X_test.txt, which contains the metric values of the test data.
* y_test <— y_test.txt, which contains the activity numbers of the test set.

#### Second, merge the training set, test set, and subjects:
* Merged_x contains the x_train and x_test data merged using rbind.
* Merged_y contains the y_train and y_test data merged using rbind.
* Subject contains the subject_train and subject_test data merged using rbind.

#### Next, give the columns of the merged data sets descriptive names:
* Columns of merged_x are given the descriptive names from column 2 of the features data.
* The column of merged_y data is give the name “activity_id”.
* The column of merged_subject data is named “subject”.
* The column names of activity_labels are named “activity_id” and “activity”.

#### The next step is to extract only the measurements on the mean and standard deviation for each measurement: 
* Grep is used on the second column of the features data to find matches for mean and std. The results are saved into mean_stddev.  
* The measurements in the dataset merged_x that match mean_stddev are saved as merged_x_mean_stddev.

#### Next, merge the merged_y data and the activity_labels, and save the merged data as merged_y_activities: 
* Using cbind, the merged_x_mean_stddev dataset is merged with the activity labels in the merged_y_activities dataset. The result is saved as merged_data_mean_stddev.  
* Using cbind, merged_data_mean_stddev is merged with the subject data. The result is saved as merged_all_data_mean_stddev.  This dataset is written to a text file named merged_data_mean_stddev.txt.

#### Create the tidy data as follows:  
* The melt() function (which is included in the R package reshape2) is used to “melt” the merged_all_data_mean_stddev data so that each row is a unique id-variable combination of subject and activity. The melted data is saved as melted_data.  
* The dcast() function (which is also included in the R package reshape2) is used to cast the melted_data into a data frame by averaging activity and subject.  
* The tidy data that results from this reshaping is saved as tidy_data_avg_mean_stddev, and then written to a text file named tidy_data_avg_mean_stddev.txt.





