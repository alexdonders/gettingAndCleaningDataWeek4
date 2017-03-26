
# init
if(!file.exists("./data")){dir.create("./data")}
fUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# read tradining data
xTrain = read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain = read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain = read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
xTest = read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest = read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest = read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features = read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

colnames(xTrain) = features[,2] 
colnames(yTrain) = "activityId"
colnames(subjectTrain) = "subjectId"

colnames(xTest) = features[,2] 
colnames(yTest) = "activityId"
colnames(subjectTest) = "subjectId"

colnames(activityLabels) = c('activityId','activityType')

allTrain = cbind(yTrain, subjectTrain, xTrain)
allTest = cbind(yTest, subjectTest, xTest)
data = rbind(allTrain, allTest)

colNames = colnames(data)

meanAndStd = (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

setForMeanAndStd = data[ , meanAndStd == TRUE]

setWithActivityNames = merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# perform aggregation
secTidySet = aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet = secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)


