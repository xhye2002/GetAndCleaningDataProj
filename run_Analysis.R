#Get and Cleaning Data Project: prepare tidy data for analysis

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile<-"getdata_projectfiles_UCI HAR Dataset.zip"

#download zip file
if (!file.exists(zipfile)) {
        download.file(fileUrl,destfile= zipfile)
}

#unzip
dataDir<-"./UCI HAR Dataset"
if (!file.exists(dataDir)) {
        unzip(zipfile, exdir = getwd());
}

setwd(dataDir)
features<-read.table("./features.txt")

#read training data: combind subject, train label (activity id) and train set
xTrain<-read.table("./train/X_train.txt")
colnames(xTrain)<-features[, 2]
yTrain<-read.table("./train/y_train.txt")
colnames(yTrain)<-"activityId"
subjectTrain<-read.table("./train/subject_train.txt")
colnames(subjectTrain)<-"subject"

trainData<-cbind(subjectTrain, yTrain, xTrain)

#read testing data: combind subject, test label (acitvity id) and test set
xTest<-read.table("./test/X_test.txt")
colnames(xTest)<-features[, 2]
yTest<-read.table("./test/y_test.txt")
colnames(yTest)<-"activityId"
subjectTest<-read.table("./test/subject_test.txt")
colnames(subjectTest)<-"subject"

testData<-cbind(subjectTest, yTest, xTest)


#1. Merges the training and the test sets to create one data set

data<-rbind(trainData, testData)


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

colNames<-colnames(data)

dataExt<-data[, grepl("mean|std|activityId|subject", colNames) & !grepl("meanFreq", colNames)]

#3. Uses descriptive activity names to name the activities in the data set

activities<-read.table("./activity_labels.txt")
colnames(activities)<-c("activityId", "activity")
actLevels<-as.factor(activities$activity)
dataExt$activityId<-as.factor(dataExt$activityId)
levels(dataExt$activityId)<-actLevels
names(dataExt)[names(dataExt) == "activityId"] <-"activity"

#4.Appropriately labels the data set with descriptive variable names. 

colNames<-colnames(dataExt)
colNames<-gsub("[-()]", "", colNames) # remove -, ()
colNames<-gsub("BodyBody","Body", colNames) # remove duplicated body
colNames<-tolower(colNames) # use lower case
colnames(dataExt)<-colNames

#5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject

ids<-c("subject", "activity")
vars<-setdiff(names(dataExt), ids)
dataMelt<-melt(dataExt, id = ids, measure.vars= vars)
dataTidy<-dcast(dataMelt, subject + activity~variable, mean)

#write tidy data to a text file
write.table(dataTidy, file = "./tidy_data.txt", row.name = FALSE)
