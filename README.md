##Tidying Parts of the "Human Activity Recognition Using Smartphones Dataset"
###Coursera Getting & Cleaning Data Course Project
####Location: sylvest00/Getting_Cleaning_Data_Coursera_JHU.git


I. Data source
--------------
[Information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on the smartphone data set.

[Download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the dataset used for the Coursera course project.


II. Goal of the script
----------------------
The goal of this project was to take a published data set and tidy it based upon specifications listed in the project page. The final result is a "tidy" data set (based upon the principles of "tidy data") that contains the average across all participants of the study and the activities that they performed for columns that contained the mean or the standard deviation of a measure.


III. File list
--------------
The following files are required for the tidy data set to be created:  
run_analysis.R..............Loads data sets and manipulates them to form a tidy data set.  
subject.txt.................Numeric ID's of the study's participants.  
activity_labels.txt.........Numeric and character (string) ID's of activities performed by the study participants.  
features.txt................Names of 561 body and gyroscope measures and statistical analyses from the study (normalized).
y_train.txt.................Numeric ID's of the activities performed during training across all trials for all participants.
X_train.txt.................Training data across all study participants and trials performed for each activity.  
y_test.txt..................Numeric ID's of the activities performed during testing across all trials for all participants.
X_test.txt..................Test data across all trials performed for each activity and each participant.

The following packages must be installed for the script to run properly:
- dplyr
- Hmisc
The first two lines of code call library() to load the above packages.

Additional notes:
- There is no user input required.
- The above files must be located within the same directory.

IV. Details of the script
-------------------------
The script first loads the above data (.txt) and constructs a data frame (data_df) that combines the training and test data. The first column of data_df is "subject", the second is "activity", and the remaining 561 are the labels in "features.txt".

Upon inspection, it is noted that there are ome column names (43) that are duplicated (featNames_unique != length(featNames)). These columns also contain different values, meaning they are not columns of duplicated values. Rather, they different columns with the same name. For good measure, these columns were not discarded prior to the final tidying step. Functions were used (rbind instead of bind_rows, etc.) to ensure columns with duplicated names were not automatically removed. After removing special characters (-,(,),.) from column names and replacing them with an underscore, duplicated names were given suffixes in order to differentiate between them. For example, fBodyGyro-bandsEnergy()-1,8 was changed to fBodyGyro_bandsEnergy_1_8. Since fBodyGyro_bandsEnergy_1_8 appears 3 times, each occurance was indexed such that:

> data_df$fBodyGyro_bandsEnergy_1_8_1[1:5]
[1] -0.9998650 -0.9998509 -0.9996805 -0.9999637 -0.9998700
> data_df$fBodyGyro_bandsEnergy_1_8_2[1:5]
[1] -0.9994537 -0.9998564 -0.9999544 -0.9999305 -0.9999259
> data_df$fBodyGyro_bandsEnergy_1_8_3[1:5]
[1] -0.9999554 -0.9999089 -0.9998701 -0.9998773 -0.9998711

Please note in the above code block that the first 5 values in each of these 3 columns (previously with the same name) are in fact different.

Next, all columns that end in "mean", "std", "mean_XYZ", or "std_XYZ", were extracted and bound to a data frame, MS_df_fin, that contained the subject ID and activity ID vectors. The numeric activity ID's were changed to their corresponding character labels. Also, repetative terms in the column names were removed.

Then, MS_df_fin was grouped by subject ID and activity ID using the group_by function.

Finally, the data columns were averaged to produce the final tidy data set. The tidy data set, tidy_df, is written to the current directory.