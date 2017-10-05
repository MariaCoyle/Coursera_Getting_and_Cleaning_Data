# Getting and Cleaning Data Course Project - Maria Coyle
This is my repository for my Coursera - Getting and Cleaning Data project

## Notes
The run_analysis algorithm assumes:
- the Samsung data is in your working directory
- the dplyr package is loaded

## Explanation of the files involved 
### features_info     
features_info provides information about the variables used on the feature vector. We do not read it as part of the algorithm.
### features
features has 561 obs of 2 variables that coincide with the 561 variables found in result sets in 'train/X_train.txt' and 'test/X_test.txt'. This data is used to name the variables of the result sets.
### activity_labels
activity_labels is used to name the activities of the result sets via the 'train/y_train.txt' and 'test/y_test.txt' files.

### Training Data
#### train/X_train
X_train is the training result set.
#### train/Y_train
Y_train provides the training activities undertaken that created the observations in X_train. This information can be cross referenced against activity_labels to get meaningful names for the activities performed. 
#### train/subject_train
subject_train provides the subjects who undertook the activities that created the observations in X_train

### Test Data
#### test/X_test
X_test is the test result set.
#### test/Y_test
Y_test provides the activities undertaken that created the observations in X_test. This information can be cross referenced against activity_labels to get meaningful names for the activities performed. 
#### test/subject_test
subject_test provides the subjects who undertook the activities that created the observations in X_test

## Steps in run_analysis 
1. Read the reference files needed:
- features.txt
- activity_labels
2. Read the training data:
- train/X_train.txt
- train/y_train.txt
- train/subject_train.txt
3. Read the test data:
- test/X_test.txt
- test/y_test.txt
- test/subject_test.txt
4. Combine the training and test activity data together.
5. Join with the activity reference labels to acquire the meaningful name for each.
6. Combine the training and test subject data together.
7. Combine the training and test result data together.
8. Identify the mean and standard deviation columns we need.
9. Extract the mean and standard deviation columns.
10. Combine the activity, subject, mean and standard deviation columns together into a single table.
11. Group the table by activity and subject.
12. Summarize the grouped table to get the average of each variable for each activity and each subject.
13. Write the result to "UCI_HAR_Dataset_Means.txt".
