##Introduction

run_analysis.R contains all functions to perform the tasks listed below;

*Merges the training and the test sets to create one data set.
*Extracts only the measurements on the mean and standard deviation for each measurement.
*Uses descriptive activity names to name the activities in the data set
*Appropriately labels the data set with descriptive variable names.
*From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First inital data is downloaded from the source.
After every data file is converted to table objects by read.table() function
rbind() is used for binding related data tables.
All data is filtered and only columns with mean and standard deviation measures are exist is choosen. Then columns are given correct names taken from the file "features.txt".
Similar approac is also used fot activity data. names and IDs from the file "activity_labels.txt" are used for substition in dataset.
Columns with vague column names are corrected in the whoel data.
As for the last step, a new dataset with all the average measures for each subject and activity type is created.



##Variables
*Initial data : xTrain, yTrain, xTest, yTest, subjectTrain and subjectTest 
*Merged data  : xData, yData and subjectData 
*Names data (for the xData) : mean_and_std_features
