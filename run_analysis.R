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
BodyAccXTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_x_test.txt", sep=""), sep="")

# Read the Body Acceleration Y component of the test set
BodyAccYTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_y_test.txt", sep=""), sep="")

# Read the Body Acceleration Z component of the test set
BodyAccZTest <- read.table(paste(testFolder,"Inertial Signals/body_acc_z_test.txt", sep=""), sep="")

# Read the Total Acceleration X component of the test set
TotalAccXTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_x_test.txt", sep=""), sep="")

# Read the Total Acceleration Y component of the test set
TotalAccYTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_y_test.txt", sep=""), sep="")

# Read the Total Acceleration Z component of the test set
TotalAccZTest <- read.table(paste(testFolder,"Inertial Signals/total_acc_z_test.txt", sep=""), sep="")

# Read the Gyro Angular Velocity X component of the test set
TotalAccXTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_x_test.txt", sep=""), sep="")

# Read the Gyro Angular Velocity Y component of the test set
TotalAccYTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_y_test.txt", sep=""), sep="")

# Read the Gyro Angular Velocity Z component of the test set
TotalAccZTest <- read.table(paste(testFolder,"Inertial Signals/body_gyro_z_test.txt", sep=""), sep="")

# Read the ativities labels for the test set
activitiyLabelsTest <- read.table(paste(testFolder, "y_test.txt", sep=""))

# Read the subject ids fot the training set
subjectTrain <- read.table(paste(trainFolder, "subject_train.txt", sep=""))

# Read the train set
XTrain <- read.table(paste(trainFolder,"X_train.txt", sep=""), sep="")

# Read the Body Acceleration X component of the train set
BodyAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_x_train.txt", sep=""), sep="")

# Read the Body Acceleration Y component of the train set
BodyAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_y_train.txt", sep=""), sep="")

# Read the Body Acceleration Z component of the train set
BodyAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/body_acc_z_train.txt", sep=""), sep="")

# Read the Total Acceleration X component of the train set
TotalAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_x_train.txt", sep=""), sep="")

# Read the Total Acceleration Y component of the train set
TotalAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_y_train.txt", sep=""), sep="")

# Read the Total Acceleration Z component of the train set
TotalAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/total_acc_z_train.txt", sep=""), sep="")

# Read the Gyro Angular Velocity X component of the train set
TotalAccXTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_x_train.txt", sep=""), sep="")

# Read the Gyro Angular Velocity Y component of the train set
TotalAccYTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_y_train.txt", sep=""), sep="")

# Read the Gyro Angular Velocity Z component of the train set
TotalAccZTrain <- read.table(paste(trainFolder,"Inertial Signals/body_gyro_z_train.txt", sep=""), sep="")

# Read the ativities labels for the train set
activitiyLabelsTrain <- read.table(paste(trainFolder, "y_train.txt", sep=""))


################################################################################
# Merge train and test sets
################################################################################
# Combine train sets (X_train, subject_train and y_train) by columns 
trainSet <- cbind(XTrain, subjectTrain, activitiyLabelsTrain)

# Combine test sets (X_test, subject_test and y_test) by columns 
testSet <- cbind(XTest, subjectTest, activitiyLabelsTest)

# Combine the obtained train and test sets by rows
mergedSet <- rbind(trainSet, testSet)


################################################################################
# Assign descriptive names (as factors) to the activities in the merged dataset
################################################################################



################################################################################
# Label the merged dataset with descriptive variable names
################################################################################



################################################################################
# Extract data on mean and standard deviation for each measurement
################################################################################



################################################################################
# Create a new dataset with the average of each variable for each activity and 
# each subject
################################################################################


