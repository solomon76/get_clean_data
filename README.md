#Getting and Cleaning Data Course Project
## Introduction
The script essentially reads in the test and training data from the given dataset and merged into one single data set. The readme will give the flow of the script and the general function that it does. 

## Data read in
- The script reads in the activity labels that allow one to assign activities to the numeric number indicated in the X_test.txt and X_train.txt
- The script reads in the features label for each kind of measurements that were made. The list of features are given in the features.txt.
- The script reads in the actual data for the test and training set (y_test.txt and y_train.txt)

## Processing of data
- The training and test data are merged together with the different types of activities.
- As the activities types are denoted by a numeric number, they are mapped to the actual string describing the activities.
- The training and test data were then compiled into a single list for further analysis.

## Further processing of data
- There are a total of six different activities, and each of them were split up and the mean was calculated. The final results were combined into the varaiable "activities_mean".

** All the processing is done by the script : run_analysis.R **
