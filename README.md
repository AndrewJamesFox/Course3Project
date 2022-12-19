---
editor_options: 
  markdown: 
    wrap: 72
---

Andrew Fox Coursera for Johns Hopkins Universtiy

Data Science Course - Getting and Cleaning Data Project

The dataset comes from:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

A description of the dataset is here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

run_analysis.R prepares the data according to instructions for the
course project. It does the following:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.
3.  Uses descriptive activity names to name the activities in the data
    set.
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

`Final.Data.txt` is the dataset that results from run_analysis.R

`CodeBook.md` describes the data, its variables, and all work that was
done on the data
