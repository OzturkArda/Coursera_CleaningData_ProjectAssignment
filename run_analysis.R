# Author  : Arda OZTURK
# Subject : Getting and Cleaning Data Course Project
# Date    : 28.01.2016
#
##############################################################################
#
#This script is created to fulfill the tasks listed below:
#
#Task 1:
#Merge the training and the test sets to create one data set.
#
#Task 2:
#Extract only the measurements on the mean and standard deviation for each 
#measurement
#
#Task 3:
#Use descriptive activity names to name the activities in the data set
#
#Task 4:
#Appropriately labels the data set with descriptive variable names
#
#Task 5:
#Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject (From the data set in step 4) 
#
###############################################################################


#Fecth required libraries
library(plyr)



# Task 1
#==============================================================================

#Files are downloaded and extracted (from zip file) manually

#Create datas set for training files
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

#Create data sets for training files
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

#bind x data
xData <- rbind(xTrain, xTest)

#bind y data
yData <- rbind(yTrain, yTest)

#bind subject data
subjectData <- rbind(subjectTrain, subjectTest)



# Task 2
#==============================================================================

#read features for mapping
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

#read only related columns
xData <- xData[, mean_and_std_features]

# correct column name
names(xData) <- features[mean_and_std_features, 2]



# Task 3
#==============================================================================

#read activities for mapping
activities <- read.table("activity_labels.txt")

# update values with correct activity names
yData[, 1] <- activities[yData[, 1], 2]

# correct column name
names(yData) <- "activity"



# Task 4
#==============================================================================

# correct column name
names(subjectData) <- "subject"

#bind all data
allData <- cbind(xData, yData, subjectData)



# Task 5
#==============================================================================

averagesData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

#generate output
write.table(averagesData, "averages_data.txt", row.name=FALSE)
