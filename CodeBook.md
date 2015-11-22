#CodeBook.md

##Tidying Parts of the "Human Activity Recognition Using Smartphones Dataset"
###Coursera Getting & Cleaning Data Course Project
###Location: sylvest00/Getting_Cleaning_Data_Coursera_JHU.git

I. Raw data
-----------

a. Source 

[Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the smartphone data set. [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the dataset used for the Coursera course project. 
   
   
b. Experiemntal design

Data were collected on 30 individuals who completed multiple trials of 6 activities that include walking along a horizontal plane, walking upstairs, walking downstairs, sitting, standing, and laying. During each activity state, an individual's 3-axial angular velocity and acceleration were recorded via the accelerometer and gyroscope of a Samsung Galaxy S II that was affixed to the waist.

The data were processed using various filters including FFT where the data was represented in both the time and frequency domain. The investigators of this study then performed statistical analysis on the data (mean, standard deviation, etc.). The processed data is as follows:
tBodyAcc-XYZ, 
tGravityAcc-XYZ, 
tBodyAccJerk-XYZ, 
tBodyGyro-XYZ, 
tBodyGyroJerk-XYZ, 
tBodyAccMag, 
tGravityAccMag, 
tBodyAccJerkMag, 
tBodyGyroMag, 
tBodyGyroJerkMag, 
fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, 
fBodyAccMag, 
fBodyAccJerkMag, 
fBodyGyroMag, and
fBodyGyroJerkMag 
(XYZ denotes the axis, "body" is the approximated body value, "gyro" is the approximated gyroscope value, "acc" is the acceleration,"t" means that the value is in the time domain, "f" means that the value is in the frequency domain, all values are normalized so that they fall within [-1 1] and are unitless).

Additional analysis was carried out on the above variables to estimate the following (only those important for this project are listed below, see "features_info.txt" in the downloaded data set for information on the other variables):
- mean (mean)
- standard deviation (std)

The goal of this course project was to take the raw data files collected by the investigators and create a tidy data set (for each individual across each activity state) that lists the average of the mean and std values listed above in a trainging data set and a test data set (66 columns total).


II. Processed Data
------------------
The average of the experimental variables that approximate the mean and the std listed above was calulated using the "summarize_each" function. The names of the variables are the same as in the experimental/ raw data files; however, what is represented in each row of the tidy data set (tidy_df) is an *average value*. The data is organized such that each row corresponds to the average values of each study participant for each activity state. There are 30 participants and 6 activity states each, which produces a data frame that consists of 180 rows.

The names of the columns are as follows:
- Column 1: Subject (ID's of study participants 1-30)
- Column 2: Activity state label (6 total)
- Columns 3- 68: The variables listed in the above section that end in mean and std. Here, the values within the columns are the average value across all trials for the original values in the experimental data sets of the same name. The original data was normalized between the range [-1 1] and are thus unitless. It follows that the average of these values are also unitless.