Getting and Cleaning Data Project

Consolidated / Averaged Human Activity Recognition Using Smartphone Dataset
Version 1.0

BDO April 2020

Starting with Samsung Galaxy S accelerometer data provided at the following location in several txt documnents, the data ia compiled into a single data frame and a consolidated tidy data frame is compiled.

Initial Data:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The consolidated tidy data frame contains the avg of the mean and stdev of accelerometer data for 30 users (subjects) performing 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, laying).  Each row contains the avg of either mean or stdev acceleromter data, there are 79 rows and are labeled describing the associated sensor.  Each column contains either the activity or subect and are labeled describing the content.

The completed product includes this readme file, the codebook that describes the completed R code, the R code itself (run_analysis.R).



