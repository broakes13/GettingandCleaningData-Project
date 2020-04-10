## Getting and Cleaning Data Course Project
## April 10 2020

## Script to complete the following from supplied data extracted from
## Samsung Galaxy S smartphones:

## 1. Merges the training and the test sets to create one data set.
##       This data frame is called alldat.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement. 
##       This data frame is called meanstdord
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.
##       This data frame is called actsubjdf

# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url,"Data.zip")
# files included from download above unzipped and stored in working directory

#read in relevant raw data
xtrain <- read.table("X_train.txt")
ytrain <- read.table("y_train.txt")
xtest <- read.table("X_test.txt")
ytest <- read.table("y_test.txt")
features <-read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

#Apply named features to each variable name for test and train sets
names(xtest)<-features$V2
names(ytest)<- "Actnum"
names(xtrain)<-features$V2
names(ytrain)<- "Actnum"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

#Add activities descriptions based upon number
library(dplyr)
ytest2<-mutate(ytest,Activity = activitylabels[Actnum,2])
ytrain2<-mutate(ytrain,Activity = activitylabels[Actnum,2])

#combine subject, x and y data for both test and train
test<-cbind(subject_test,ytest2,xtest)
train<-cbind(subject_train,ytrain2,xtrain)

#merge test and training datasets
alldat<-rbind(test,train)
allnames <- names(alldat)

#extract the mean and std dev measurements
means <- alldat[,grep("mean",allnames)]
stds <- alldat[,grep("std",allnames)]

#create new df containing labeling, means, and stds
meanstd <-data.frame(alldat$Subject,alldat$Activity,means,stds)
names(meanstd)[1]<-"Subject"
names(meanstd)[2]<-"Activity"
meanstd$Subject<-as.factor(meanstd$Subject)

#ordering mean/std df based on subject / activity
meanstdord<-meanstd[order(meanstd$Subject,meanstd$Activity),]

#split based on subject and apply mean to all data columns
subsplit<-split(meanstdord,meanstdord$Subject)
subjmean<-sapply(subsplit, function(x) {colMeans(x[,c(3:81)])})

#split based on activity and apply mean to all data columns
actsplit<-split(meanstdord,meanstdord$Activity)
actmean<-sapply(actsplit, function(x) {colMeans(x[,c(3:81)])})

#combine the activity and subject means into a final "tidy" dataframe
actsubjdf <- data.frame(cbind(actmean,subjmean))
