## Course Project for "Getting and Cleaning Data" on Coursera
## 
## run_analysis.R
##
## This script should be able to run the analysis on the data
## given in the course assuming it is in the working directory.
## The data is assumed to be in the same structure as the given 
## .zip file (including directory structures).

library(dplyr)

dataRootDir <- "./UCI HAR Dataset"

# get the acticity data
activityFile <- paste(dataRootDir, "activity_labels.txt", sep="/")
activities <- read.table(activityFile, col.names=c("activity_id","activity"))

# get the features information
featuresFile <- paste(dataRootDir, "features.txt", sep="/")
features <- read.table(featuresFile, col.names=c("feature_id", "feature"))

# get the test data
testDir <- paste(dataRootDir,"test",sep="/")
X_testFile <- paste(testDir, "X_test.txt", sep="/")
y_testFile <- paste(testDir, "y_test.txt", sep="/")
subject_testFile <- paste(testDir, "subject_test.txt", sep="/")
X_test <- read.table(X_testFile, col.names=features[,2])
y_test <- read.table(y_testFile, col.names=c("activity_id"))
subject_test <- read.table(subject_testFile, col.names=c("subject_id"))

# create the full test data set and remove the original data
data_test <- data.frame(X_test,y_test,subject_test)
rm(X_test)
rm(y_test)
rm(subject_test)

# get the training data
trainDir <- paste(dataRootDir,"train",sep="/")
X_trainFile <- paste(trainDir, "X_train.txt", sep="/")
y_trainFile <- paste(trainDir, "y_train.txt", sep="/")
subject_trainFile <- paste(trainDir, "subject_train.txt", sep="/")
X_train <- read.table(X_trainFile, col.names=features[,2])
y_train <- read.table(y_trainFile, col.names=c("activity_id"))
subject_train <- read.table(subject_trainFile, col.names=c("subject_id"))

# create the full train data set and remove the original data
data_train <- data.frame(X_train,y_train, subject_train)
rm(X_train)
rm(y_train)
rm(subject_train)

# combine test and train data sets and remove the original data
data_combined <- rbind(data_test,data_train)
rm(data_test)
rm(data_train)

# extract only the required columns (the mean and std of each measurement)
extractCols <- sort(c(grep("(mean|std)\\(",features[,2])))
extract_data <- select(data_combined,subject_id,activity_id,extractCols)
extract_data <- merge(activities,extract_data)
extract_data <- select(extract_data,-activity_id)

tidy_data <- extract_data %>% group_by(subject_id,activity) %>%
    summarise_each(funs(mean))
names(tidy_data) <- gsub("\\.\\.","",names(tidy_data))

outFile <- "results.txt"
write.table(tidy_data, file=outFile, row.name=FALSE)
