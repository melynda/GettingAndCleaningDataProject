## Run Analysis

library("data.table")
library("reshape2")

# save the file path to a variable
filePath <- "./UCI HAR Dataset/"

# load all needed text files
activity_labels <- read.table(paste(filePath, "activity_labels.txt", sep=""))
features <- read.table(paste(filePath, "features.txt", sep=""))

x_train <- read.table(paste(filePath, "train/X_train.txt", sep=""))
y_train <- read.table(paste(filePath, "train/y_train.txt", sep=""))
subject_train <- read.table(paste(filePath, "train/subject_train.txt", sep=""))

x_test <- read.table(paste(filePath, "test/X_test.txt", sep=""))
y_test <- read.table(paste(filePath, "test/y_test.txt", sep=""))
subject_test <- read.table(paste(filePath, "test/subject_test.txt", sep=""))


# merge the training and test sets to create one data set
# merge x_train and x_test; merge y_train and y_test;
# and merge suject_train and subject_test using rbind
merged_x <- rbind(x_train,x_test)
merged_y <- rbind(y_train,y_test)
merged_subject <- rbind(subject_train,subject_test)

# give the columns of the data sets descriptive names
names(merged_x) <- features[,2]
names(merged_y) <- "activity_id"
names(merged_subject) <- "subject"
names(activity_labels) <- c("activity_id", "activity")

# find the features that contain measurements 
# for mean and for standard deviation
mean_stddev <- grep("-mean\\(\\)|-std\\(\\)", features[,2], value=TRUE)

# extract from the data set merged_x only the measurements on 
# the mean and standard deviation for each measurement
merged_x_mean_stddev <- merged_x[,mean_stddev]

# combine the merged_y dataset with the activity_labels
merged_y_activities <- merge(merged_y, activity_labels)

# use cbind to merge the merged_x_mean_stddev data set with the 
# activity labels in merged_y_activities data set, 
# and then merge the resulting data set with the subject data
merged_data_mean_stddev <- cbind(merged_x_mean_stddev, merged_y_activities["activity"])
merged_all_data_mean_stddev <- cbind(merged_data_mean_stddev, merged_subject)

# save the merged_all_data data set to a text file
write.table(merged_all_data_mean_stddev, "merged_data_mean_stddev.txt")

# generate the tidy data set with the average of each variable for each activity and subject; 
# to reshape the data, use the melt() and dcast() functions from the reshape2 package;
# "melt" the data so that each row is a unique id-variable combination
# "cast" the melted data into a data frame by averaging activity and subject
group_by <- c("subject", "activity")
melted_data <- melt(merged_all_data_mean_stddev, id=group_by)
tidy_data_avg_mean_stddev <- dcast(melted_data, activity + subject ~ variable, mean)

# save the tidy_data_avg_mean_stddev to a text file
write.table(tidy_data_avg_mean_stddev, "tidy_data_avg_mean_stddev.txt", row.name=FALSE)
