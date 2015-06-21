#CodeBook for Coursera Getting and Cleaning Data Project
Programming assignment for the Coursera "Getting and Cleaning Data" Course

##Data Source Credits and Reference:

Information on the data and originating experiment can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original Dataset for download can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Data Author Credits:

###Reference/Citation: Data used in this project comes specifically from the authors cited below

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using 
Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. 
Bruges, Belgium 24-26 April 2013.

##Description of the data (from URL provided/referenced above):

###Experiment that originated the data set:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities
 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
 Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
 The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% 
 of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time 
and frequency domain.

##Description of Data present in source data folders

* README.txt: Details of all the files in downloaded folder
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.i.e list of all measurement variables
* activity_labels.txt: Lists the activity Id with their corresponding activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training activity Id Labels
* train/subject_train.txt: Each row identifies the subject who performed the activity. The range is from 1 to 30.
* test/X_test.txt: Test set.
* test/y_test.txt: Test activity Id Labels
* test/subject_train.txt: Each row identifies the subject who performed the activity. The range is from 1 to 30.

##Details about Files to be used in analysis from Source Data

Shared files: features.txt: 561 rows of 2 variables (feature identity and feature Name) 
* activity_labels.txt: 6 rows of 2 variables (activity identity and activity name)

Test Dataset: x_test.txt: data has 2947 rows of 561 measurement variables. The measurement variables are listed in features.txt 
* y_test.txt: 2947 rows of 1 variables. This is the activity identity - subject_test.txt: 2497 rows of 1 variable (subject identity)

Training Dataset - x_train.txt: data has 7352 rows of 561 measurement variables. The measurement variables are listed in features.txt 
* y_train.txt: 7352 rows of 1 variables. This is the activity identity - subject_train.txt: 7352 rows of 1 variable (subject identity)


##Script Function Description
The run_analysis.R script has the following requirements to perform transformation on UCI HAR Dataset.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The script performs the following to clean up the data:

Merges the training and test sets to create one data set, namely x_train.txt with x_test.txt, the result of which is a 10299x561 data frame.
Merge subject_train.txt with subject_test.txt, the result of which is a 10299x1 data frame with subject IDs, and y_train.txt with y_test.txt, 
the result of which is also a 10299x1 data frame with activity IDs.

Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x68 data frame, 
because only 66 out of 561 attributes are measurements on the mean and standard deviation. (the 2 extra columns are the subjects and activity columns) 
All measurements appear to be floating point numbers in the range (-1, 1).

Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set (originally coded as 1-6, recoded as):

* walking

* walkingupstairs

* walkingdownstairs

* sitting

* standing

* laying

The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names have
 underscores and brackets () are removed. "mean" and "std" ID's are renamed to "Mean" and "Std"  The result is saved as Extracted_Data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column 
 activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are like
 the following examples:

tBodyAccMeanY            
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
 
In the last step the script creates a 2nd and independent tidy data set with the average of each measurement for each activity and each subject. 
The result is saved as tidyset.txt, a 180x68 data frame, where the first column contains subject IDs, 
the second column contains activity names, and then the averages for each of the 66 attributes are in columns 3...68. 
There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.    The resulting tidyset.txt is included in this repository for reference.
 
 
 