
# Summary
This codebook contains information on the transformation of the raw dataset to a tidied dataset and further
information on the variables contained in that tidied dataset.

# Tidying Process
The script "run_analysis.R" takes the raw data in the unzipped dataset "getdata-projectfiles-UCI HAR
Dataset" and produces a tidied dataset using the following process:

1. Read in all needed data from files into a separate data frame per file.
2. Combine test and train data frames as follows:
    a. Combine the test and train data "X_test.txt" and "X_train.txt" into a single data frame called *testAndTrainData*, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
    b. Combine the test and train activities "y_test.txt" and "y_train.txt" into a single data frame, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
    c. Combine the test and train subjects "subject_test.txt" and "subject_train.txt" into a single dataframe, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
3. Update the column names in the combined test and train data frame *testAndTrainData* to the names contained in the "features.txt" data frame.
4. Add the activities data frame created from "activity_labels.txt" as a column called "Activity" and the subjects data frame created from "train/subject_train.txt" to a column called "Subject" to the combined test and train data frame *testAndTrainData*.
5. 

# Variables

Activity
    Activity performed for the given data.

Subject
    The Subject 
    
The following Variables
TimeBodyAccMeanX
TimeBodyAccMeanY
TimeBodyAccMeanZ
TimeBodyAccStandardDeviationX
TimeBodyAccStandardDeviationY
TimeBodyAccStandardDeviationZ
TimeGravityAccMeanX
TimeGravityAccMeanY
TimeGravityAccMeanZ
TimeGravityAccStandardDeviationX
TimeGravityAccStandardDeviationY
TimeGravityAccStandardDeviationZ
TimeBodyAccJerkMeanX
TimeBodyAccJerkMeanY
TimeBodyAccJerkMeanZ
TimeBodyAccJerkStandardDeviationX
TimeBodyAccJerkStandardDeviationY
TimeBodyAccJerkStandardDeviationZ
TimeBodyGyroMeanX
TimeBodyGyroMeanY
TimeBodyGyroMeanZ
TimeBodyGyroStandardDeviationX
TimeBodyGyroStandardDeviationY
TimeBodyGyroStandardDeviationZ
TimeBodyGyroJerkMeanX
TimeBodyGyroJerkMeanY
TimeBodyGyroJerkMeanZ
TimeBodyGyroJerkStandardDeviationX
TimeBodyGyroJerkStandardDeviationY
TimeBodyGyroJerkStandardDeviationZ
TimeBodyAccMagMean
TimeBodyAccMagStandardDeviation
TimeGravityAccMagMean
TimeGravityAccMagStandardDeviation
TimeBodyAccJerkMagMean
TimeBodyAccJerkMagStandardDeviation
TimeBodyGyroMagMean
TimeBodyGyroMagStandardDeviation
TimeBodyGyroJerkMagMean
TimeBodyGyroJerkMagStandardDeviation
FrequencyBodyAccMeanX
FrequencyBodyAccMeanY
FrequencyBodyAccMeanZ
FrequencyBodyAccStandardDeviationX
FrequencyBodyAccStandardDeviationY
FrequencyBodyAccStandardDeviationZ
FrequencyBodyAccJerkMeanX
FrequencyBodyAccJerkMeanY
FrequencyBodyAccJerkMeanZ
FrequencyBodyAccJerkStandardDeviationX
FrequencyBodyAccJerkStandardDeviationY
FrequencyBodyAccJerkStandardDeviationZ
FrequencyBodyGyroMeanX
FrequencyBodyGyroMeanY
FrequencyBodyGyroMeanZ
FrequencyBodyGyroStandardDeviationX
FrequencyBodyGyroStandardDeviationY
FrequencyBodyGyroStandardDeviationZ
FrequencyBodyAccMagMean
FrequencyBodyAccMagStandardDeviation
FrequencyBodyBodyAccJerkMagMean
FrequencyBodyBodyAccJerkMagStandardDeviation
FrequencyBodyBodyGyroMagMean
FrequencyBodyBodyGyroMagStandardDeviation
FrequencyBodyBodyGyroJerkMagMean
FrequencyBodyBodyGyroJerkMagStandardDeviation
