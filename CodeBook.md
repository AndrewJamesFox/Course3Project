Andrew Fox

Coursera for Johns Hopkins University

Data Science Course - Getting and Cleaning Data

A description of the dataset is here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

`run_analysis.R` script prepares the data according to the instructions for the course project.

**Downloading the data**

The dataset is downloaded to the following path: ./data/projectData.zip and unzipped into the folder `UCI HAR Dataset`

**Reading the data**

The data is read in along with the features file.

`features <- features.txt` (561 rows, 2 columns)

The features come from the accelerometer and gyroscope 3-axial raw singals tAcc-XYZ and tGyro-XYZ. These are then passed through filters to create various features.

`train_subjects <- train/subject_train.txt` (7352 rows, 1 column)

the subjects of the experiment from which data is obtained; the train set

`train_x <- train/X_train.txt` (7352 rows, 561 columns)

recorded features of train set

`train_activity <- train/y_train.txt` (7352 rows, 1 columns)

the numeric label of the activity the subject performed; train set

`train` dataset is created by binding the columns of the previous three files with cbind()

`test_subjects <- test/subject_test.txt` (2947 rows, 1 column)

the subjects of the experiment from which data is obtained; the test set

`test_x <- test/X_test.txt` (2947 rows, 561 columns)

recorded features of test set

`test_activity <- test/y_test.txt` (2947 rows, 1 columns)

the numeric label of the activity the subject performed; test set

`test` dataset is created by binding the columns of the previous three files with cbind()

**Merging the data**

`data` (10299 rows, 562 columns) is a completely merged data table created by binding the rows of the `train` and `test` with rbind()

**Extracting measurements on mean and std**

`g <- grep("mean|std", features)` (79 items)

The indices of the features containing only "mean" or "std" are taken using grep()

`data <- data[g, ]`

The data is subsetting to only include indices of data obtained with "mean" or "std" features. `data` (79 rows, 563 columns).

**Naming activities**

`activity_labels <- activity_labels.txt` (6 rows, 2 columns)

correlates a number with the activity that was performed.

The activity column in data is transformed to replace the numeric label with its corresponding activity.

**Naming variables**

A series of gsub() calls makes the variable names more readable.

"Acc" subbed with "Accelerometer"

"Gyro" subbed with "Gyroscope"

"BodyBody" subbed with "Body"

"Mag" subbed with "Magnitude"

Anything starting with "t" subbed with "Time"

Anything starting with "f" subbed with "Frequency"

"tBody" subbed with "TimeBody"

"-mean()" subbed with "Mean"

"-std()" subbed with "STD"

"-freq()" subbed with "Frequency"

"angle" subbed with "Angle"

"gravity" subbed with "Gravity"

**Tidy Data**

`FinalData` is created by grouping `data` by subject and activity, then taking the means of each variable for both activity and subject
