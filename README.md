jhu-getdata-003
===============

## Getting and Cleaning Data - Course Project
###James Eisenhauer
Coursera.org  John Hopkins University

In this project we utlize the Human Activity Recognition Using Smartphones Data Set.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual raw data set came from this zip file.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The contents of that zip file can be found in this repository under the data/RawData folder.
This script assumes the data is in the data/RawData folder.

To create the data I utlized the below data files from the raw data.
- data/RawData/activity_labels.txt
= data/RawData/features.txt
- data/RawData/train/X_train.txt
- data/RawData/train/y_train.txt
- data/RawData/train/subject_train.txt
- data/RawData/test/X_test.txt
- data/RawData/test/y_test.txt
- data/RawData/test/subject_test.txt

I then replace the numbered activities with the names and add the actual measurement names to the colums of data.
I then reduce the colums to only contain measurements that relate to mean or standard deviation.  Then the test and train data get bound together to make a single data set.  Once this is complete all the column names get cleaned of special and upper case characters.

In this repository you will find a R script that was developed to obtain the data and produce tidy data.
You will also find the CodeBook that will describe the steps taken to tidy the data as well as the description of this data.

