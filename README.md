run_analysis.R
====================================

R script to manipulate a wearable computing dataset collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The script performs the following actions:
- loads all the files of the dataset;
- merges the training and the test sets (including activity labels and subjects IDs) to create one data set;
- extracts only the measurements on the mean and standard deviation for each measurement;
- assigns descriptive activity names to name the activities in the data set;
- appropriately labels the data set with descriptive variable names;
- starting from the obtained tidy dataset creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The produced dataset is tidy as:
- each variable is in one column
- each different observation of the variables is in one row
- there's only one table as there's only one kind of variables.

The command for reading the final dataset and looking at it in R is:

finalSet <- read.table("./finalSet.txt", sep="\t")

The script has been implemented referring to David Hood "David's Project FAQ", available at:

https://class.coursera.org/getdata-009/forum/thread?thread_id=58