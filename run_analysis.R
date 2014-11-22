################################################################################
# Load the necessary packages
################################################################################
library(dplyr)

################################################################################
# Read the data files
################################################################################

# Set the data folder paths names
dataFolder <- "./UCI HAR Dataset/"
testFolder <- paste(dataFolder, "test/", sep="")
trainFolder <- paste(dataFolder, "train/", sep="")

# Read the subject ids fot the test set
subjectTest <- read.table(paste(testFolder, "subject_test.txt", sep=""))

# Read the test set
XTest <- read.table(paste(testFolder,"X_test.txt", sep=""), sep="")

# Read the Body Acceleration X component of the test set
BodyAccXTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_x_test.txt", 
                                 sep=""), sep="")

# Read the Body Acceleration Y component of the test set
BodyAccYTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_y_test.txt", 
                                 sep=""), sep="")

# Read the Body Acceleration Z component of the test set
BodyAccZTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_z_test.txt", 
                                 sep=""), sep="")

# Read the Total Acceleration X component of the test set
TotalAccXTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_x_test.txt", 
                                  sep=""), sep="")

# Read the Total Acceleration Y component of the test set
TotalAccYTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_y_test.txt", 
                                  sep=""), sep="")

# Read the Total Acceleration Z component of the test set
TotalAccZTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_z_test.txt", 
                                  sep=""), sep="")

# Read the Gyro Angular Velocity X component of the test set
TotalAccXTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_x_test.txt", 
                                  sep=""), sep="")

# Read the Gyro Angular Velocity Y component of the test set
TotalAccYTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_y_test.txt", 
                                  sep=""), sep="")

# Read the Gyro Angular Velocity Z component of the test set
TotalAccZTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_z_test.txt", 
                                  sep=""), sep="")

# Read the ativities labels for the test set
activityLabelsTest <- read.table(paste(testFolder, "y_test.txt", sep=""))

# Read the subject ids fot the training set
subjectTrain <- read.table(paste(trainFolder, "subject_train.txt", sep=""))

# Read the train set
XTrain <- read.table(paste(trainFolder,"X_train.txt", sep=""), sep="")

# Read the Body Acceleration X component of the training set
BodyAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_x_train.txt", 
                                  sep=""), sep="")

# Read the Body Acceleration Y component of the training set
BodyAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_y_train.txt", 
                                  sep=""), sep="")

# Read the Body Acceleration Z component of the training set
BodyAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_z_train.txt", 
                                  sep=""), sep="")

# Read the Total Acceleration X component of the training set
TotalAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_x_train.txt", 
                                   sep=""), sep="")

# Read the Total Acceleration Y component of the training set
TotalAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_y_train.txt", 
                                   sep=""), sep="")

# Read the Total Acceleration Z component of the training set
TotalAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_z_train.txt", 
                                   sep=""), sep="")

# Read the Gyro Angular Velocity X component of the training set
TotalAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_x_train.txt", 
                                   sep=""), sep="")

# Read the Gyro Angular Velocity Y component of the training set
TotalAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_y_train.txt", 
                                   sep=""), sep="")

# Read the Gyro Angular Velocity Z component of the training set
TotalAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_z_train.txt", 
                                   sep=""), sep="")

# Read the ativities labels for the training set
activityLabelsTrain <- read.table(paste(trainFolder, "y_train.txt", sep=""))

# Read the features names
featuresNames <- read.table(paste(dataFolder, "features.txt", sep=""))

# Read the activities labels in descriptive form
activityLabels <- read.table(paste(dataFolder, "activity_labels.txt", sep=""))


################################################################################
# Assign descriptive names (as factors) to the activities (I perform this task
# now in order to have the activities labels ready in descriptive form for the
# sets merging).
################################################################################

# Convert the labels to character for both training and test set
for (i in seq_along(activityLabels$V2)) {
    activityLabelsTrain$V1[activityLabelsTrain$V1 == i] <- as.character(activityLabels$V2[i])
    activityLabelsTest$V1[activityLabelsTest$V1 == i] <- as.character(activityLabels$V2[i])
}

# ------------
# Training Set
# ------------
# Convert labels to lower case
activityLabelsTrain$V1 <- tolower(activityLabelsTrain$V1)

# Remove underscore and convert the first character after underscore to upper case
# (camel case). It works as these names aren't assigned to variables names but to 
# values (character values) of variables.
for (i in seq_along(activityLabelsTrain$V1)) {
    # Split the string according to "_" (using the temporary variable tmp)
    tmp <- unlist(strsplit(activityLabelsTrain$V1[i], "_"))
    # If the string has undersore, convert the first character after it to upper case
    # and compose the final string (otherwise do nothing).
    if (!is.na(tmp[2])) {
        activityLabelsTrain$V1[i] <- paste(tmp[1], toupper(substr(tmp[2], 1, 1)), 
                                           substr(tmp[2], 2, nchar(tmp[2])), sep="")
    }
}

# Convert the new labels to factors
activityLabelsTrain$V1 <- factor(activityLabelsTrain$V1)

# Set the variable name to "activity"
colnames(activityLabelsTrain) <- "activity"

# ------------
# Test Set
# ------------
# Convert labels to lower case
activityLabelsTest$V1 <- tolower(activityLabelsTest$V1)

# Remove underscore and convert the first character after underscore to upper case
# (camel case). It works as these names aren't assigned to variables names but to 
# values (character values) of variables.
for (i in seq_along(activityLabelsTest$V1)) {
    # Split the string according to "_" (using the temporary variable tmp)
    tmp <- unlist(strsplit(activityLabelsTest$V1[i], "_"))
    # If the string has undersore, convert the first character after it to upper case
    # and compose the final string (otherwise do nothing).
    if (!is.na(tmp[2])) {
        activityLabelsTest$V1[i] <- paste(tmp[1], toupper(substr(tmp[2], 1, 1)), 
                                           substr(tmp[2], 2, nchar(tmp[2])), sep="")
    }
}

# Convert the new labels to factors
activityLabelsTest$V1 <- factor(activityLabelsTest$V1)

# Set the variable name to "activity"
colnames(activityLabelsTest) <- "activity"

################################################################################
# Label the training adataset, the test dataset and the two subjects datasets
# (training and test) with descriptive variable names (I perform this task now
# in order to have the activities descriptive names maintained in the merged
# dataset and avoid repeated "standard" Vi names).
################################################################################
# Remove the first occurrence of "-" (it doesn't mean axis or energy bands)
featuresNames$V2 <- sub("-", "", featuresNames$V2)

# Remove "," from all features names not indicating energy bands and replace "-"
# with "axis" (as in these names "-" refers to X, Y or Z axis)
selection <- grep("-[A-Z]", featuresNames$V2)
featuresNames$V2[selection] <- gsub(",", "", featuresNames$V2[selection])
featuresNames$V2[selection] <- gsub("-", "axis", featuresNames$V2[selection])

# Assign the character "to" to "," when it's intended to separate energy bands.
selection <- grep("-[0-9]*,[0-9]*", featuresNames$V2)
featuresNames$V2[selection] <- gsub(",", "to", featuresNames$V2[selection])

# Remove "-" everywhere
featuresNames$V2 <- gsub("-", "", featuresNames$V2)

# Assign "between" to "("  and "and" to "," to features names indicating angles
selection <- grep("angle", featuresNames$V2)
featuresNames$V2[selection] <- gsub(",", "and", featuresNames$V2[selection])
featuresNames$V2[selection] <- gsub("\\(", "between", featuresNames$V2[selection])

# Remove "(" and ")" everywhere
featuresNames$V2 <- gsub("\\(|\\)", "", featuresNames$V2)

# Set the features names to lower case
featuresNames$V2 <- tolower(featuresNames$V2)

# Assign "time" to "t" when occurring at the beginning of the feature name
featuresNames$V2 <- gsub("^t", "time", featuresNames$V2)

# Assign "frequency" to "f" when occurring at the beginning of the feature name
featuresNames$V2 <- gsub("^f", "frequency", featuresNames$V2)

# Assign the descriptive variable names to the training set.
colnames(XTrain) <- featuresNames$V2

# Assign the descriptive variable names to the test set.
colnames(XTest) <- featuresNames$V2

# Set the subject training variable name to "subject"
colnames(subjectTrain) <- "subject"

# Set the subject test variable name to "subject"
colnames(subjectTest) <- "subject"

################################################################################
# Merge train and test sets
################################################################################
# Combine train sets (X_train, subject_train and y_train) by columns 
trainSet <- cbind(subjectTrain, XTrain, activityLabelsTrain)

# Combine test sets (X_test, subject_test and y_test) by columns 
testSet <- cbind(subjectTest, XTest, activityLabelsTest)

# Combine the obtained train and test sets by rows
mergedSet <- rbind(trainSet, testSet)

################################################################################
# Extract data on mean and standard deviation for each measurement
################################################################################
# Build the vector of indices for column selection
meanIdx <- grep("mean", colnames(mergedSet))
stdIdx <- grep("std", colnames(mergedSet))
selectionIdx <- sort(c(1, meanIdx, stdIdx, dim(mergedSet)[2]))

# Extract the selected columns (including the subject and the activity colums)
# and assign them to the variable meanStdSet
meanStdSet <- mergedSet[, selectionIdx]

################################################################################
# Create a new dataset with the average of each variable for each activity and 
# each subject
################################################################################
# Group the meanStdSet by subject and activity
by_subjectActivity<-group_by(meanStdSet, subject, activity)

# Loop through variable names (except subject and activity) and evaluate the 
# variables average
for (i in seq(2,length(colnames(meanStdSet))-1)) {
    var <- eval(parse(text=paste("meanStdSet$",colnames(meanStdSet)[i],sep="")))
    varName <- colnames(meanStdSet)[i]
    tmp <- summarize(by_subjectActivity, mean(var))
    # Assign the name "average" to the evaluated variable
    colnames(tmp)[3] <- "average"
    # Add a new variable named "variable" containing the name of the averaged varaible
    tmp$variable <- rep(varName,dim(tmp)[1])
    # Swap the variable and average columns
    tmp <- tmp[,c("subject", "activity", "variable", "average")]
    # Add the new data to the final data.frame
    if (i==2) {
        finalSet <- tmp
    }
    else {
        finalSet <- rbind(finalSet, tmp)
    }  
}

# Order the final set for subject and activity
finalSet <- finalSet[order(finalSet$subject, finalSet$activity),]

# Save the final dataset to .txt file
write.table(finalSet, "./finalSet.txt", sep="\t")