# add needed library
library(reshape)
library(reshape2)


# read in raw data
activity_labels <- read.table("./data/RawData/activity_labels.txt")

features <- read.table("./data/RawData/features.txt")
X_train <- read.table("./data/RawData/train/X_train.txt",  header = FALSE)
y_train <- read.table("./data/RawData/train/y_train.txt")
subject_train <- read.table("./data/RawData/train/subject_train.txt")

X_test <- read.table("./data/RawData/test/X_test.txt",  header = FALSE)
y_test <- read.table("./data/RawData/test/y_test.txt")
subject_test <- read.table("./data/RawData/test/subject_test.txt")

# merge activity lables & activity codes
test_labels <- merge(y_test,activity_labels, all=TRUE, sort=F)
train_labels <- merge(y_train,activity_labels, all=TRUE, sort=F)

# replace default column names
names(test_labels) <- c("activityid", "activity")
names(train_labels) <- c("activityid", "activity")
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")

# replace default column names with feature names
names(X_train) <- features[,2]
names(X_test) <- features[,2]

# reduce data sets to only mean and std columns
X_test <- X_test[, grepl("std|mean[^F]", colnames(X_test))]
X_train <- X_train[, grepl("std|mean[^F]", colnames(X_train))]

# add activty and subject columns to data
testDF  <- cbind(test_labels,X_test)
testDF  <- cbind(subject_test, testDF)
trainDF <- cbind(train_labels,X_train)
trainDF <- cbind(subject_train, trainDF)


# merge X train and test data
mergedData <- rbind(testDF,trainDF)

# remove extra activityID column that was added in activity merge
mergedData <- within(mergedData, rm(activityid))

# lower case all column names
colnames(mergedData) <- tolower(colnames(mergedData))

# remove dash from all column names
colnames(mergedData) <- gsub("\\-", "", colnames(mergedData))

# remove (  from all column names
colnames(mergedData) <- gsub("\\(", "", colnames(mergedData))

# remove ) from all column names
colnames(mergedData) <- gsub("\\)", "", colnames(mergedData))

# write tidied raw data to file
write.table(mergedData, "./data/TidyData/tidydata.txt")

# determine means
meanData <-melt(mergedData, id=c("subject", "activity"))
meanTidyData<-dcast(meanData, subject + activity ~ variable, fun.aggregate=mean)


# write meanTidyData to file
write.table(mergedData, "./data/TidyData/meantidydata.txt")


