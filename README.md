### Getting and Cleaning Data Course Project
Scott Cleeton
April 20, 2016

***

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The audience for this project is individuals enrolled in the Getting and Cleaning Data course. It is expected individuals are competent with basic R syntax.


The R script run_analysis.R expects the data for the project to be downloaded and unzipped into the ~/Coursera/Data Cleaning/project/UCI HAR Dataset folder. The underlying folder structure and file naming conventions should not be manipulated. This R script requires the reshape package to be installed before it can be used.


The R script run_analysis.R does the following:

1. Reads in domain feature variables, activity labels, test, and train datasets from the UCI HAR Dataset required for the project.
2. Merges the training and test data (X, y, and subject) into one data frame respectively.
3. Identifies feature variables measured on the mean and standard deviation, then subsets merged training and test data (X).
4. Uses activity labels to name the activities in the merged training and test data (X)
5. Creates valid R variable names from the feature data frame and renames merged training and test data (X) appropriately. Variables for activity labels and subject IDs are also renamed appropriately.
6. Creates a "tidy" data frame with the averages of each variable for each activity and each subject.
7. Writes the contents of the "tidy" data frame to an external text file ("tidy_data_set.txt").