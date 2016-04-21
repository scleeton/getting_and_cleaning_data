library(reshape)

setwd("~/Coursera/Data Cleaning/project/UCI HAR Dataset")

## list of all time and domain feature variables
feature <- read.table("features.txt")

## activity labels
## links class labels with their activity name
activity <- read.table("activity_labels.txt")

## test datasets
setwd("test")
testData  <- read.table("X_test.txt")
testLabel <- read.table("y_test.txt")
testSub   <- read.table("subject_test.txt")

## train datasets
setwd("../train")
trainData  <- read.table("X_train.txt")
trainLabel <- read.table("y_train.txt")
trainSub   <- read.table("subject_train.txt")

## merges the training and the test sets to create one data set
mergedData  <- rbind(testData, trainData)
mergedLabel <- rbind(testLabel, trainLabel)
mergedSub   <- rbind(testSub, trainSub)

## extracts only the measurement on the mean and
## standard deviation for each measurement
pickVars   <- grep("-(mean|std)\\(\\)", feature[, 2], ignore.case = TRUE)
mergedData <- mergedData[, pickVars]

## uses descriptive activity names to name the activities in the data set
## appropriately labes the data set with descriptive variable names
mergedLabel       <- activity[mergedLabel[, 1], 2]

allData           <- cbind(mergedLabel, mergedSub, mergedData)

featureCols       <- make.names(gsub("[-()]", "", feature[pickVars, 2]), unique = TRUE)
colnames(allData) <- c("activity", "subjectid", featureCols)

## create tidy data set with the average of each variable
## for each activity and each subject
meltData <- melt(allData, id = c("activity", "subjectid"))
tidyData <- cast(meltData, subjectid + activity ~ variable, mean)

## write tidy data set to external file for submission
setwd("../..")
write.table(tidyData, "tidy_data_set.txt", row.names = FALSE)

