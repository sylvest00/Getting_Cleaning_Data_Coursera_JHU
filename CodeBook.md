##Code Book for Getting & Cleaning Data Course Project
Location: sylvest00/Getting_Cleaning_Data_Coursera_JHU.git

I. Raw data
-----------
a. Source 
   [Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the smartphone data set. 
   
   [Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the dataset used for the Coursera course project. 
   
   
b. Experiemntal design 

   Data were collected on 30 individuals who completed multiple trials of 6 activities that include walking along a horizontal plane, walking upstairs, walking downstairs, sitting, standing, and laying. During each activity state, an individual's 3-axial angular velocity and acceleration were recorded via the accelerometer and gyroscope of a Samsung Galaxy S II affixed to the waist. 
           
   The following data was collected by the investigators:
      tBodyAcc-XYZ 
      tGravityAcc-XYZ 
      tBodyAccJerk-XYZ 
      tBodyGyro-XYZ 
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

           The data were processed using various filters including FFT where the data was represented in both the time and frequency domain. The investigators of this study then performed statistical analysis on the data (mean, standard deviation).
           
           The goal of this course project was to take the raw data files collected by the investigators and create a tidy data set (for each individual across each activity state) the average of the mean and standard deviation approximated by the investigators.


II. Processed Data
------------------
    a. 
