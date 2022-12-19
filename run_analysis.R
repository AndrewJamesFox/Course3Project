# Getting and Cleaning Data
# Project

getwd()
setwd("./Course - Getting and Cleaning Data/Course3Project")
# If data file doesn't exist, create it
if (!file.exists("data")){dir.create("data")}

# Download the file
file <- "./data/projectData.zip"
if (!file.exists(file)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, destfile=file, method="curl")
}
if (!file.exists("HAR UCI Dataset")){
  unzip(file, exdir="./data")
}

#Read in features
features <- read.table("./data/UCI HAR Dataset/features.txt")[,2]
features

#Train Data
train_subjects <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("subject"))
train_x <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=features)
train_activity <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("activity"))
train <- cbind(train_subjects, train_x, train_activity)
str(train)

#Test Data
test_subjects <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("subject"))
test_x <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names=features)
test_activity <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("activity"))
test <- cbind(test_subjects, test_x, test_activity)
str(test)

# 1 - Merge train and test sets
data <- rbind(train, test)
str(data)

# 2 - Extract only measurements on mean and std
g <- grep("mean|std", features)
nrow(data)
data <- data[g, ]
nrow(data)

# 3 - Name activities
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("id", "activity"))
activity_labels
data[ , "activity"]
for (i in 1:nrow(activity_labels)){
  data[,"activity"] <- gsub(i, activity_labels[i, "activity"], data[,"activity"])
}
data[ , "activity"]

# 4 - Name variables with appropriate names
names(data)
str(data)
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("tBody", "TimeBody", names(data))
names(data)<-gsub("-mean()", "Mean", names(data), ignore.case = TRUE)
names(data)<-gsub("-std()", "STD", names(data), ignore.case = TRUE)
names(data)<-gsub("-freq()", "Frequency", names(data), ignore.case = TRUE)
names(data)<-gsub("angle", "Angle", names(data))
names(data)<-gsub("gravity", "Gravity", names(data))
str(data)

# 5 - Create tidy set with average of each variable for each activity and each subject
library(dplyr)
FinalData <- data %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
str(FinalData)
