RGettingData
============

Repo containing the course project from "Getting and Cleaning Data" of Coursera. Files in the repo:

* README.md: Repo description
* CookBook.txt: variables/features description
* run_analysis.R: Main script performing course project task
* aggregateData.csv: independent tidy data set from the original UCI HAR data set with the average of each variable for each activity and each subject


The main script run_analysis.R works as follows:
1) Load test data and training data as well as activities, features and subjects
2) Filter test data and training data columns by those containing mean or std (we omit meanFreq for the sake of simplicity)
3) Paste activities, subjects, test data and training data together (pretty much like lego pieces)
4) Rename the activities based on the info existing in activity_labels.txt and relabel features names (we use the plyr package).
5) Create a new independent tidy data set with the average of each variable for each activity and each subject and save it in a .csv file.

Note that the script assumes that the files downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

exist (unzipped) in your working directory. Otherwise you need to run setwd("folder the unzipped folder is").

The data follows the principles of tidiness

*Each variable forms a column.
*Each observation forms a row.
*Each type of observational unit forms a table.

Finally, the aggregateData.csv file can be loaded in R through the command

aggregatedData<-read.csv("aggregateData.csv")
