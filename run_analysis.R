# Load datasets
features 	<- read.table("UCI HAR Dataset/features.txt")
testData	<- read.table("UCI HAR Dataset/test/X_test.txt")
trainData	<- read.table("UCI HAR Dataset/train/X_train.txt")

# Merge and rename columns
testAndTrain 		<- rbind(testData,trainData)
colnames(testAndTrain) 	<- f$V2

# Extract only measurements on mean and standard deviation
# To do this, search the column names for substrings "mean" and "std"
testAndtrainC <- testAndTrain[grepl("mean",colnames(testAndTrain)) | grepl("std",colnames(testAndTrain))]
