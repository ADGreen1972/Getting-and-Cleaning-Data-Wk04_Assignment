#### Background relevant package(s)
#### Note that Hmisc is required for the capitalize function and
#### reshape2 is required for the melt functions later
library(Hmisc)
library(reshape2)

#### Manually download the zip bundle and transfer applicable data sets to working directory area

#### Read in all the required data (train and test)

# Read in the activity labels and convert to character
Act_Labels <- read.table("UCI HAR Dataset/activity_labels.txt")
Act_Labels[,2] <- as.character(Act_Labels[,2])

# Read in the features data and convert to character
Features <- read.table("UCI HAR Dataset/features.txt")
Features[,2] <- as.character(Features[,2])

# Pinpoint location of mean and set dev variables - feed into Features_Relevant
Features_Relevant <- grep(".*mean.*|.*std.*", Features[,2])

# Using Features_Relevant, extract the relevant variable names
Features_Relevant.names <- Features[Features_Relevant,2]

# Clean the variable names - remove characters from strings (e.g. - and [])
Features_Relevant.names = gsub('-mean', 'Mean', Features_Relevant.names)
Features_Relevant.names = gsub('-std', 'Std', Features_Relevant.names)
Features_Relevant.names = gsub('[-()]', '', Features_Relevant.names)

# Load the training data and only retain the relevant mean and std variables
Train_Data <- read.table("UCI HAR Dataset/train/X_train.txt")[Features_Relevant]

# Load the training activities and the training subjects data
# Note that both input data sets are singular column
Train_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
Train_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")

# Column bind the Train_Data, Train_Activities and Train_Subjects data sets
Train_Full <- cbind(Train_Subjects, Train_Activities, Train_Data)

# Repeat above four steps, but for the test data
Test_Data <- read.table("UCI HAR Dataset/test/X_test.txt")[Features_Relevant]
Test_Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
Test_Activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
Test_Full <- cbind(Test_Subjects, Test_Activities, Test_Data)

# Concatentate the two data sources to create one overall data set
Comb_Data <- rbind(Train_Full, Test_Full)

# Now add in the labels
colnames(Comb_Data) <- c("Subject", "Activity", capitalize(Features_Relevant.names))

# Convert Subject variable to factor
Comb_Data$Subject <- as.factor(Comb_Data$Subject)

# Use the Act_Labels data to convert Activity column to factors
Comb_Data$Activity <- factor(Comb_Data$Activity, levels = Act_Labels[,1], labels = Act_Labels[,2])

# Use the melt function to create one row for each Subject/Activity/{all of Features_Relevant.names} 
# This essentially multiplies data set by a factor of length(Features_Relevant)!
Comb_Data.Melted <- melt(Comb_Data, id = c("Subject", "Activity"))

# The dcast function is used to calculate the mean for each Subject/Activity and one column for each variable
Comb_Data.Mean <- dcast(Comb_Data.Melted, Subject + Activity ~ variable, mean)

# Finally, output the final data set
write.table(Comb_Data.Mean, "Tidy_Data.txt", row.names = FALSE, quote = FALSE)

