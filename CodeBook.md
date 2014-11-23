# CodeBook
## Getting and Cleaning Data Project

### About the data:
Experiments were carried out on a group of volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data was captured and recorded. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Explanation of data, variables, and transformations: 

#### Read the needed text files in using read.table:
* activity_labels <— activity_labels.txt, which contains names for the activities.
* features <— features.txt, which contains a list of all features.
* subject_train <- subject_train.txt, which contains subject numbers for the training dataset.
* x_train <— X_train.txt, which contains the metric values of the training data.
* y_train <— y_train.txt, which contains the activity numbers of the training set.
* subject_test <- subject_test.txt, which contains the subject numbers for the test dataset.
* x_test <— X_test.txt, which contains the metric values of the test data.
* y_test <— y_test.txt, which contains the activity numbers of the test set.

#### Merge the training set, test set, and subjects:
* Merged_x contains the x_train and x_test data merged using rbind.
* Merged_y contains the y_train and y_test data merged using rbind.
* Subject contains the subject_train and subject_test data merged using rbind.

#### Give the columns of the merged data sets descriptive names:
* Columns of merged_x are given the descriptive names from column 2 of the features data.
* The column of merged_y data is give the name “activity_id”.
* The column of merged_subject data is named “subject”.
* The column names of activity_labels are named “activity_id” and “activity”.

#### Extract only the measurements on the mean and standard deviation for each measurement: 
* Grep is used on the second column of the features data to find matches for mean and std. The results are saved into mean_stddev.  
* The measurements in the dataset merged_x that match mean_stddev are saved as merged_x_mean_stddev.

#### Merge the merged_y data and the activity_labels, and save the merged data as merged_y_activities: 
* Using cbind, the merged_x_mean_stddev dataset is merged with the activity labels in the merged_y_activities dataset. The result is saved as merged_data_mean_stddev.  
* Using cbind, merged_data_mean_stddev is merged with the subject data. The result is saved as merged_all_data_mean_stddev.  This dataset is written to a text file named merged_data_mean_stddev.txt.

#### Create the tidy data as follows:  
* The melt() function (which is included in the R package reshape2) is used to “melt” the merged_all_data_mean_stddev data so that each row is a unique id-variable combination of subject and activity. The melted data is saved as melted_data.  
* The dcast() function (which is also included in the R package reshape2) is used to cast the melted_data into a data frame by averaging activity and subject.  
* The tidy data that results from this reshaping is saved as tidy_data_avg_mean_stddev, and then written to a text file named tidy_data_avg_mean_stddev.txt.

#### Activity Labels
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

#### ID Fields
* subject - The participant ID
* activity - The activity performed when the measurements were taken

#### Extracted Fields - Mean and Standard Deviation

* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()




