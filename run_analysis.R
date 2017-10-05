## Please Note
## This algorithm assumes:
## - the Samsung data is in your working directory
## - the dplyr package is loaded


## features_info     ## Shows information about the variables used on the feature vector.

##Read the files needed

## List of all features.
# This table hsd 561 obs of 2 variables that coincide with 
# the 561 variables found in result sets in 'train/X_train.txt' and 'test/X_test.txt'.
# This data is used to name the variables of the result sets
f <- read.table('features.txt')           

## Links the class labels with their activity name. 
# This data is used to name the activities of the result sets via the 'train/y_train.txt' and 'test/y_test.txt' files.
al <- read.table('activity_labels.txt')   

## Training result set.
trainx <- read.table('train/X_train.txt') 

## Training activities.
trainy <- read.table('train/y_train.txt') 

## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
trainSub <- read.table('train/subject_train.txt')      

## Testing result set.
testx <- read.table('test/X_test.txt')  

## Testing activities.
testy <- read.table('test/y_test.txt')    

## Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
testSub <- read.table('test/subject_test.txt')      


## Combine the two activity sets
activity <- rbind(trainy, testy)
activity <- inner_join(activity, al, by="V1")
activity <- activity[,2] 
names(activity) <- "activity"

## Combine the two subject sets
subject <- rbind(trainSub, testSub)
names(subject) <- "subject"

## Combine the two results sets
data <- rbind(trainx, testx)


## Identify the mean and standard deviation columns we need to extract
extractColumns = c(grep("mean()", f[,2]) , grep("std()", f[,2]))
extractColumnNames = c(grep("mean()", f[,2], value=TRUE) , grep("std()", f[,2], value=TRUE))

## Extract the columns
myData <- tbl_df(data)
dataExtract <- select(myData, extractColumns)
names(dataExtract) <- extractColumnNames
dataExtract <- cbind(activity, subject, dataExtract)

dataExtract <- group_by(dataExtract, activity, subject)
summary = summarise_all(dataExtract, funs(mean(., na.rm=TRUE)))

write.table(summary, "UCI_HAR_Dataset_Means.txt", row.names =  FALSE)
