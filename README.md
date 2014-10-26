---
title: "README.Rmd"
output: html_document
---

The repo inlcudes following files:

1. The R script **run_Analyais.R** would clean and creat a tidy data set.
2. The **CodeBook.md** describes the variables, the data, and any transformations or work that I would performe to clean up the data.
3. **README.md** explains the R scripts work.  


##Data
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##How run_Analysis.R works:

The script run_Analysis.R file should put under the data directory.

1. download and unzip data

Download the data from the website and unzip it. Set the working directory to be the data directory.

2. load data into R

Training data: combine subject, training labels and train set to training data
Testing data: combine subject, testing labels and test set to testing data

3. Merges the training and test data to create one dataset

4. Extracts only the measurements on the mean and standard deviation for each measurement. 

5. Uses descriptive activity names to name the activities in the data set
 
6. Appropriately labels the data set with descriptive variable names. 

7. From the data set in previous step, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject

8. write tidy data to a text file

