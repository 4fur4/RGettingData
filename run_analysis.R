rm(list=ls())
install.packages("plyr")
library(plyr)
##Features names
features <- data.frame(read.table("UCI HAR Dataset/features.txt"))

##Load test data with the given feature names
test.data <- data.frame(read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$V2))

##Filter test data columns by those containing mean or std 
test.data <- test.data[,grep("mean[^Freq]|std",names(test.data))]

##Load test data activities
test.activities <- data.frame(read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "Activity"))
##Load test data subjects
test.subject <- data.frame(read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject"))


##Load train data with the given feature names
train.data <- data.frame(read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2))
##Load train data activities
train.activities <- data.frame(read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "Activity"))
##Load train data subjects
train.subject <- data.frame(read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject"))

##Filter train data columns by those containing mean or std 
train.data <- train.data[,grep("mean[^Freq]|std",features$V2)]

##Paste test data + test activities + test subject together
test <- cbind(test.subject,test.activities,test.data)

##Paste train data + train activities + train subject together
train <- cbind(train.subject,train.activities,train.data)

##Paste training data and test data together
data <- rbind(test,train)

##Rename based on the file activity_labels.txt
data$Activity <- revalue(as.character(data$Activity), 
                           c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING"))

##Relabel feature names
names(data)<-sub("^t", "Time.",names(data))
names(data)<-sub("^f", "Fourier.",names(data))
names(data)<-gsub("Body", "Body.",names(data))
names(data)<-gsub("Gravity", "Gravity.",names(data))
names(data)<-gsub("Acc", "Acc.",names(data))
names(data)<-gsub("Jerk", "Jerk.",names(data))
names(data)<-gsub("Gyro", "Gyro.",names(data))
names(data)<-gsub("Mag", "Mag.",names(data))
names(data)<-gsub("Mag", "Mag.",names(data))
names(data)<-gsub("\\.\\.\\.", "\\.",names(data))
names(data)<-gsub("\\.\\.", "\\.",names(data))
names(data)<-gsub("\\.$", "",names(data))


dataResult<- aggregate(. ~ Activity + Subject,data = data,FUN=mean)
write.csv(dataResult, file = "aggregateData.csv", row.names = FALSE)
