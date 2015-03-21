# CodeBook.md

This is the code book for the course project for the Coursera course "Getting and Cleaning Data". This document supplements the information found in the features_info.txt file in the raw data set for this project. Information that can be found there will not be repeated in this document.

To generate the output tidy data, the raw test and train data were concatenated (along with the subject files and the activity file) to create a single large data set. This data set was then grouped by subject and activity. This grouping was further manipulated to generate a single average value for each of the data values for each subject and activity.

The resulting identifying data variables are:
subject_id : the id of the subject  
activity   : the activity performed by the subject  

After these identifying variables are the average values for the various mean and std data values. The signal values are discussed in the features_info.txt file. Each signal has an mean and standard deviation (one for each dimension X, Y, and Z if there is more than one). The naming convention used in the tidy data is as follows using the example of the three dimensional signal tBodyAcc-XYZ (as given in the features_info.txt file):

The average mean values for each dimension:  
tBodyAcc.mean.X  
tBodyAcc.mean.Y  
tBodyAcc.mean.Z  

and the average std values for each dimension:  
tBodyAcc.std.X  
tBodyAcc.std.Y  
tBodyAcc.std.Z  

For a signal with only one dimension (e.g. tGravityAccMag), the values are:  
tGravityAccMag.mean  
tGravityAccMag.std  

The full list of signals that have been manipulated are:
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
