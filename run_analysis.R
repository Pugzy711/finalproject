library(dplyr)
# download zip file containing data if it hasn't already been downloaded

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
    download.file(zipUrl, zipFile, mode = "wb")
}

# unzip zip file containing data if data directory doesn't already exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
    unzip(zipFile)
}
# delete the zip file
    file.remove(zipFile)

# variables common to both 
    messyfeatures <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
    features <- gsub("[,\\.()-]", "", messyfeatures[[2]])
    features <- gsub("^f", "frequencydomain", features)
    features <- gsub("^t", "timedomain", features)
    features <- gsub("Acc", "accelerometer", features)
    features <- gsub("Gyro", "gyroscope", features)
    features <- gsub("Mag", "magnitude", features)
    features <- gsub("Freq", "frequency", features)
    features <- gsub("std", "standarddeviation", features)
    features <- tolower(features)
    features <- gsub("bodybody", "body", features)
# get training set:
    training <- read.table(file.path(dataPath, "train", "X_train.txt"), col.names = features)
    activity_train <- read.table(file.path(dataPath, "train", "y_train.txt"))
    sub_train <- read.table(file.path(dataPath, "train", "subject_train.txt"))

# add columns to table
    trainingfinal <- mutate(training, subject = sub_train[[1]], activity = activity_train[[1]])
    
# get test set:
    test <- read.table(file.path(dataPath, "test", "X_test.txt"), col.names = features)
    sub_test <-read.table(file.path(dataPath, "test", "subject_test.txt"))
    activity_test <- read.table(file.path(dataPath, "test", "y_test.txt"))
    testfinal <- mutate(test, subject = sub_test[[1]], activity = activity_test[[1]])
    
# merge the two data sets 
    total_data <- full_join(trainingfinal, testfinal)
# select only the mean and std columns for each measurement, include activity and subject
    variables <- names(total_data)
    columns <- grep("mean|standarddeviation|activity|subject", variables)
    filtered_data <- select(total_data, all_of(columns))
    
#  change activity column to descriptive values instead of integers
    activity_label <- read.table(file.path(dataPath, "activity_labels.txt"))
    final_data <- merge(filtered_data, activity_label, by.x = "activity", by.y = "V1")
# replace activity column with V2 (descriptive column)
    final_data <- mutate(final_data, activity = V2)
# remove the V2 column
    final_data <- select(final_data,-V2)
# group by activity and subject then summarize with mean
    by_act_sub <- group_by(final_data, activity, subject)
    tidysummary <- summarise_all(by_act_sub, mean)
    write.table(tidysummary, file = "tidydata.txt",row.names = FALSE)

# note: to read data
# x <- read.table("tidydata.txt", header = TRUE)
# View(x)







