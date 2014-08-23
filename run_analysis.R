###############################################################################
# 
#
###############################################################################

###
## Load datasets
###

baseDatasetDirectory <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/"

# Labels for activities
activityLabels 	<- read.table(paste(baseDatasetDirectory,"activity_labels.txt", sep=""))

# Names of the features
features        <- read.table(paste(baseDatasetDirectory,"features.txt", sep=""))

# Test dataset
testData	<- read.table(paste(baseDatasetDirectory,"test/X_test.txt", sep=""))

# Test subjects
testSubjects    <- read.table(paste(baseDatasetDirectory,"test/subject_test.txt", sep=""))

# Test activities
testActivities 	<- read.table(paste(baseDatasetDirectory,"test/y_test.txt", sep = ""))
                        #activityLabels, by.x=1, by.y=1)
                       
# Training dataset
trainData       <- read.table(paste(baseDatasetDirectory,"train/X_train.txt", sep=""))

# Test subjects
trainSubjects   <- read.table(paste(baseDatasetDirectory,"train/subject_train.txt", sep=""))

# Training activities
trainActivities <- read.table(paste(baseDatasetDirectory,"train/y_train.txt", sep=""))
                        
                        
                        
###
## Merge the test and training datasets
###
testAndTrainData        <- rbind(testData,trainData)


###
## Merge the test and training activities
###
testAndTrainActivities	<- rbind(testActivities,trainActivities)


###
## Merge test and training subjects
###
testAndTrainSubjects <- rbind(testSubjects, trainSubjects)


###
## Update column names
###
# Take the names from the features data
colnames(testAndTrainData)    <- features$V2


###
## Add the named activites to a column called "Activity"
###
testAndTrainData["Activity"]  <- testAndTrainActivities


###
## Add the subjects to a column called subjects
###
testAndTrainData["Subject"] <- testAndTrainSubjects


###
## Extract only measurements on mean and standard deviation
###
# To do this, search the column names for substrings "mean" and "std" also 
# keeping the Activites column 
testAndTrainData <- testAndTrainData[grepl("mean|std|Activity|Subject",colnames(testAndTrainData))]


###
## Update column names
###

# Remove symbols : "(" ")" "-"
colnames(testAndTrainData) <- gsub("\\()|-", "", colnames(testAndTrainData))

# All columns starting with "f" are frequencies, prefix with "Frequency"
colnames(testAndTrainData) <- gsub("^f", "Frequency", colnames(testAndTrainData))

# All columns starting with "t" are times, prefix with "Time"
colnames(testAndTrainData) <- gsub("^t", "Time", colnames(testAndTrainData))

# Make "mean" and "std" (standard deviation) columns clearer
colnames(testAndTrainData) <- gsub("mean", "Mean", colnames(testAndTrainData))
colnames(testAndTrainData) <- gsub("std", "StandardDeviation", colnames(testAndTrainData))


###
## Re-label Activities
###
testAndTrainData["Activity"] <- factor(testAndTrainData[["Activity"]], labels=activityLabels$V2)

###
## Compute means
###

# Exclude Activity and Subject and generate means
exclude <- names(testAndTrainData) %in% c("Activity","Subject")
aggregatedTestAndTrainData <- aggregate(testAndTrainData[!exclude],
                by=list(testAndTrainData$Subject,testAndTrainData$Activity),FUN="mean")

# Rename coulmns generate by aggregate
colnames(aggregatedTestAndTrainData)[1] <- "Activity"
colnames(aggregatedTestAndTrainData)[2] <- "Subject"

# Save tidied data
write.table(aggregatedTestAndTrainData, "tidiedData.txt", row.name=FALSE)
