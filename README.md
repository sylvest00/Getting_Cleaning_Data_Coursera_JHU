##Tidying Parts of the "Human Activity Recognition Using Smartphones Dataset"
###Coursera Getting & Cleaning Data Course Project

Location: sylvest00/Getting_Cleaning_Data_Coursera_JHU.git
[Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the smartphone data set.
[Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the dataset used for the Coursera course project.


0. Goal of the script
---------------------
The goal of this project was to take a published data set and tidy it based upon specifications listed in the project page. The final result is a "tidy" data set (based upon the principles of "tidy data") that contains the average across all participants of the study and the activities that they performed for columns that contained the mean or the standard deviation of a measure.

I. File list
------------
The following files are required for the tidy data set to be created:  
run_analysis.R..............Loads data sets and manipulates them to form a tidy data set.  
subject.txt.................Numeric ID's of the study's participants.  
activity_labels.txt.........Numeric and character (string) ID's of activities performed by the study participants.  
features.txt................Names of 561 body and gyroscope measures and statistical analyses from the study (normalized).
y_train.txt.................Numeric ID's of the activities performed during training across all trials for all participants.
X_train.txt.................Training data across all study participants and trials performed for each activity.  
y_test.txt..................Numeric ID's of the activities performed during testing across all trials for all participants.
X_test.txt..................Test data across all trials performed for each activity and each participant.

