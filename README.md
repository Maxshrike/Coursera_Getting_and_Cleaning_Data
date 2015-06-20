# Coursera Getting and Cleaning Data
Programming assignment for the Coursera "Getting and Cleaning Data" Course

##Introduction:

This repository is the course project for the Getting and Cleaning Data course.  The repository contains this readme.md, a codebook.md (markdown document)the script written for the project and a sample output text file for the simplifed ("tidied") data set.

##Data Source:

Information on the data can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Project Script and Result:

To acheive the project objective, a script was written called  run_analysis.R which will go import the various data sets and variable names, the script will merge the training data and test data sets together. Labels are added to the merged dataset, the labels are simplified for easy reading, and only columns that have to do with mean and standard deviation are retained.

##Requirements to run the script:

* The UCI HAR Dataset must be extracted from the zip file
* The UCI HAR Dataset must be in a directory called "UCI HAR Dataset"
* Script will be located in and run from the same working directory as the "UCI HAR Dataset" directory

Per the assignment, the final output of the script is a "tidy" data set (called tidyset.txt) that will be written to the working directory.  This tidy data set will have the means of all the columns per activity and test subject. An example of this output file can also be found in this repository.

##Code Book:

This repository contains a CodeBook.md file which explains the steps performed and the resulting output and variables.
