---
title: "CodeBook for the course project of Getting and Cleaning Data"
output: html_document
---
The code book would describe the variables, the data, and any transformations that would be performed to clean up the data

##Data for the Project

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the data and unzip it. The files needed for this project are:

    - 'features.txt': List of all features.

    - 'activity_labels.txt': Links the class labels with their activity name.

    - 'train/X_train.txt': Training set.

    - 'train/y_train.txt': Training labels.

    - 'train/subject_train.txt': subject who performed the activity. range from 1 to 30.

    - 'test/X_test.txt': Test set.

    - 'test/y_test.txt': Test labels.

    - 'test/subject_train.txt': subject who performed the activity. range from 1 to 30
    
#Variables descriptions before the data is tidy

features: 477 Levels, angle(tBodyAccJerkMean),gravityMean) angle(tBodyAccMean,gravity) ... tGravityAccMag-std()

activity labels: 6  Levels, LAYING  SITTING  STANDING  WALKING  WALKING_DOWNSTAIRS  WALKING_UPSTAIRS

subject: range from 1 to 30

#Data Transform
1. Training data: 
    Apply feature names to column names of X_train data
    merge X_train,  y_train, and  subject_train data into one data set
 
2. Testing data: 
    Apply feature names to column names for X_test data
    merge X_test, y_test and subject_test data into one data set
 
3. Merge Training data and Testing data into one dataset.

4. Extracts only the measurements on the mean and standard deviation for each measurement. 
    For the feature column names, only extrat columns whose names contain "mean" or "std", but not "meanFreq"

4. Replace activity id in data set with descriptive activity name.

5. Approriately lables the data set with descriptive variable names:
    feature column names are not tidy: Remove "-", "()" from the column names
    Removed duplicated "Body" from column names containing "BodyBody"
    use lowercase for all column names

After data transform, the column namse for tidy data are:

[1]  "subject"              "activity"             "tbodyaccmeanx"        "tbodyaccmeany"        "tbodyaccmeanz"        "tbodyaccstdx"        
[7]  "tbodyaccstdy"         "tbodyaccstdz"         "tgravityaccmeanx"     "tgravityaccmeany"     "tgravityaccmeanz"     "tgravityaccstdx"     
[13] "tgravityaccstdy"      "tgravityaccstdz"      "tbodyaccjerkmeanx"    "tbodyaccjerkmeany"    "tbodyaccjerkmeanz"    "tbodyaccjerkstdx"    
[19] "tbodyaccjerkstdy"     "tbodyaccjerkstdz"     "tbodygyromeanx"       "tbodygyromeany"       "tbodygyromeanz"       "tbodygyrostdx"       
[25] "tbodygyrostdy"        "tbodygyrostdz"        "tbodygyrojerkmeanx"   "tbodygyrojerkmeany"   "tbodygyrojerkmeanz"   "tbodygyrojerkstdx"   
[31] "tbodygyrojerkstdy"    "tbodygyrojerkstdz"    "tbodyaccmagmean"      "tbodyaccmagstd"       "tgravityaccmagmean"   "tgravityaccmagstd"   
[37] "tbodyaccjerkmagmean"  "tbodyaccjerkmagstd"   "tbodygyromagmean"     "tbodygyromagstd"      "tbodygyrojerkmagmean" "tbodygyrojerkmagstd" 
[43] "fbodyaccmeanx"        "fbodyaccmeany"        "fbodyaccmeanz"        "fbodyaccstdx"         "fbodyaccstdy"         "fbodyaccstdz"        
[49] "fbodyaccjerkmeanx"    "fbodyaccjerkmeany"    "fbodyaccjerkmeanz"    "fbodyaccjerkstdx"     "fbodyaccjerkstdy"     "fbodyaccjerkstdz"    
[55] "fbodygyromeanx"       "fbodygyromeany"       "fbodygyromeanz"       "fbodygyrostdx"        "fbodygyrostdy"        "fbodygyrostdz"       
[61] "fbodyaccmagmean"      "fbodyaccmagstd"       "fbodyaccjerkmagmean"  "fbodyaccjerkmagstd"   "fbodygyromagmean"     "fbodygyromagstd"     
[67] "fbodygyrojerkmagmean" "fbodygyrojerkmagstd" 
