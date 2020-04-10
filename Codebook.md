
Getting and Cleaning Data Project
Consolidated / Averaged Human Activity Recognition Using Smartphone Dataset Version 1.0
BDO April 2020

Code book that describes the variables, the data, and any transformations or work performed in the R program run_analysis.R.

Script to complete the following from supplied data extracted from Samsung Galaxy S smartphones:

1. Merges the training and the test sets to create one data set.
    - This data frame is called "alldat".
2. Extracts only the measurements on the mean and standard deviation 
    for each measurement.
    - This data frame is called "meanstdord"
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data 
    set with the average of each variable for each activity and each subject.
    - This data frame is called "actsubjdf"

The R sript performs the following, in oder:
 - Reads in relevant raw data stored in the working directory
 - Apply named features to each variable name for test and train sets
 - Combines subject, x and y data for both test and train data sets
    - Resulting dataframes are "test" and "train"
 - Merge test and training datasets
    - Resulting dataframe is "alldat"
 - Create new dataframe with just mean and std dev measurements
    - Resulting dataframe is "meanstdord"
 - Create new dataframe with mean of all mean/std measurements for each subject
    - Resulting dataframe is "subjmean"
 - Create new dataframe with mean of all mean/std measurements for each activity
    - Resulting dataframe is "actmean"
 - Combine the activity and subject means dataframe into a final "tidy" dataframe
      Resulting dataframe is "actsubjdf"


