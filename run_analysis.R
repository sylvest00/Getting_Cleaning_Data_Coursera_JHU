############################################################################################
# Coursera Course: Getting and Cleaning Data, Fall 2015
# Course Project: Make a tidy data set
#
#     run_analysis.R loads data sets containing information and statistics on
#     body and gyroscope motion during various activities. These data sets
#     include:
#           activity_labels.txt
#               Contains numeric and string ID's for the activities performed
#               during recording
#           features.txt
#               A list of the variables estimated by the investigators.
#           subject.txt
#               A list of the ID numbers of participants.
#           X_train.txt, X_test.txt
#               A data set containing the body and gyroscope measures as well as
#               some statistical measures of participants. The column names are
#               contained in features.txt.
#           y_train.txt, y_test.txt
#               Contains the numeric ID of the activity performed by each participant.
#
#     After loading the above files, they are combined and manipulated in order
#     to create a final data set that includes the average mean and std values
#     for each participant across multiple trials performed for each activity state.
#     This tidy data set is then saved in the current directory as "tidy_data.txt".
#
#     The following packages are required: dplyr and Hmisc.
###########################################################################################

#Load required packages
library(dplyr)
library(Hmisc)

#Read in feature and activity labels and store as featNames and activityNames, respectively.
featNames     <- read.table("features.txt",sep=" ")
activityNames <- read.table("activity_labels.txt")

#Load training data, activity label, and the subject's ID number.
#Bind to create a data frame containing all 3 data sets.
train_df  <- read.table("subject_train.txt",header=FALSE,col.names="subject",check.names = FALSE)       #load & store subject's ID
temp_df   <- read.table("y_train.txt",header=FALSE,col.names="activity",check.names = FALSE)            #load & store activity label
train_df  <- cbind(train_df,temp_df)
temp_df   <- read.table("X_train.txt",header=FALSE,col.names = featNames[,2],check.names = FALSE)       #load & store training data
train_df  <- cbind(train_df,temp_df)

#Load test data, activity label, and the subject's ID number.
#Bind to create a data frame containing all 3 data sets
test_df   <- read.table("subject_test.txt",header=FALSE,col.names="subject",check.names = FALSE)        #load & store subject's ID
temp_df   <- read.table("y_test.txt",header=FALSE,col.names="activity",check.names = FALSE)             #load & store activity label
test_df   <- cbind(test_df,temp_df)
temp_df   <- read.table("X_test.txt",header=FALSE,col.names = featNames[,2],check.names = FALSE)        #load & store test data
test_df   <- cbind(test_df,temp_df)


#Combine the training & test data frames.There are columns of the data frame with duplicate
#names but different values (see README for an example). For good tidying practice,
#the columns with duplicate names were not removed. bind_rows() removes columns with
#duplicated names, so rbind() was used instead.

data_df <- rbind(train_df,test_df)


#Remove characters and replace with either a space or an underscore for better indexing
colnames(data_df) <- gsub(",","_",names(data_df))
colnames(data_df) <- gsub("-","_",names(data_df))
colnames(data_df) <- gsub("\\()","",names(data_df))
data_df_names <- names(data_df)


#Find duplicated column names and add a subscript to differentiate between them.
featNames_unique <- unique(data_df_names)
count = 1;
for (i in 1:length(featNames_unique)){
  idx <- which(featNames_unique[i] == data_df_names)
  if (length(idx) > 1){
    newNames <- paste(data_df_names[idx],c(1:length(idx)),sep="_")
    colnames(data_df)[idx] <- newNames
    count = count + 1;
  }
}
data_df_names <- names(data_df)


#Extract mean and std values to create a new data frame, MS_df_fin
MS_df     <- select(data_df,matches("mean|std"))
mean_df   <- select(data_df,ends_with("mean"))
mean_df_x <- select(data_df,ends_with("mean_X"))
mean_df_y <- select(data_df,ends_with("mean_y"))
mean_df_z <- select(data_df,ends_with("mean_z"))
mean_df   <- cbind(mean_df,mean_df_x,mean_df_y,mean_df_z)
std_df    <- select(data_df,ends_with("std"))
std_df_x  <- select(data_df,ends_with("std_x"))
std_df_y  <- select(data_df,ends_with("std_y"))
std_df_z  <- select(data_df,ends_with("std_z"))
std_df    <- cbind(std_df,std_df_x,std_df_y,std_df_z)
MS_df_fin <- data.frame(subject = data_df$subject, activity = data_df$activity)
MS_df_fin <- cbind(MS_df_fin,mean_df,std_df)


#Change numeric activity label to a string listed in activityNames
for (i in 1:length(MS_df_fin$activity)){
  MS_df_fin$activity[i] = as.character(activityNames[MS_df_fin$activity[i],2])
}


#The column names are descriptive enough and they are described in the code book,
#so minimal changes were made. The extra "Body" from a few column names was removed.
MS_df_fin <- rename(MS_df_fin,
                    fBodyAccJerkMag_mean = fBodyBodyAccJerkMag_mean,
                    fBodyGyroMag_mean = fBodyBodyGyroMag_mean,
                    fBodyAccJerkMag_std = fBodyBodyAccJerkMag_std,
                    fBodyGyroJerkMag_mean = fBodyBodyGyroJerkMag_mean,
                    fBodyGyroMag_std = fBodyBodyGyroMag_std,
                    fBodyGyroJerkMag_std = fBodyBodyGyroJerkMag_std)


#Take the average of each column across every subject and activity pairing.
#The column names are unchanged; however, the values are now of an average.
tidy_df <- MS_df_fin
tidy_df <- tidy_df %>% group_by(subject,activity) %>% summarize_each(funs(mean(.,na.rm=TRUE)))

#Save tidy_df in a .txt
write.table(tidy_df,"tidy_df.txt",row.names = FALSE)