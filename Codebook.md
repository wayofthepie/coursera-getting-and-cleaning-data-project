
# Summary
This codebook contains information on the transformation of the raw dataset to a tidied dataset and further
information on the variables contained in that tidied dataset.

# Tidying Process
The script "run_analysis.R" takes the raw data in the unzipped dataset "getdata-projectfiles-UCI HAR
Dataset" and produces a tidied dataset using the following process:

1. Read in all needed data from files into a separate data frame per file.
2. Combine test and train data frames as follows:
    - Combine the test and train data "X_test.txt" and "X_train.txt" into a single data frame called **testAndTrainData**, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
    - Combine the test and train activities "y_test.txt" and "y_train.txt" into a single data frame, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
    - Combine the test and train subjects "subject_test.txt" and "subject_train.txt" into a single dataframe, the training data added in rows proceeding the test data. No re-ordering of the data takes place.
3. Update the column names in the combined test and train data frame **testAndTrainData** to the names contained in the "features.txt" data frame.
4. Add the activities data frame created from "activity_labels.txt" as a column called "Activity" and the subjects data frame created from "train/subject_train.txt" to a column called "Subject" to the combined test and train data frame **testAndTrainData**.
5. Remove all columns in the **testAndTrainData** data frame which do not stand for **mean** or **std** (standard deviation) - also keeping the "Activity" and "Subject" columns.
6. Rename the columns in the **testAndTrainData** data frame for readability:
    - Replace **mean()** with **Mean** and **std()** with **StandardDeviation** in column names.
    - Replace any remaining "(" or ")" symbols also removing and "-".
    - Replace "f" in column names starting with "f" with Frequency and "t" in column names starting with "t" with Time.
7. Replace the "Activity" column rows in the **testAndTrainData** data frame which up to now only had numbers with the labels corresponding to the numbers taken from "activity_labels.txt".
8. Create a new data frame with the average of each variable for each "Activity" and "Subject" in the **testAndTrainData** data frame, call this **aggregatedTestAndTrainData**.
9. Finally write the **aggregatedTestAndTrainData** out to a file called "tidiedData.txt" renaming the "Group.1" column to "Activity" and the "Group.2" column to "Subject".

# Variables

## Activity
Activity performed for the given data.

## Subject
The Subject for the given data.
   
## Features 
In all the below features **X** stands for measurements in the x-axis, **Y** measurements in the y-axis and **Z** measurements in the z-axis of either an **Accelerometer** which is denoted in the feature name by **Acc** or a **Gyroscope** denoted by **Gyro**.

Features beginning with "Time" are time measurements and those beginning with "Frequency" are frequency domain signals calculated using a Fast Fourier Transform.

Feature names containing **Jerk** stands for the time rate of change of acceleration. 

Those with **Mag** stand for the magnitude, calculated using the euclidean norm, of the respective measurement in its three dimensions - e.g. AccMag is the magnitude of acceleration in the X Y and Z axes.
 
 
### Mean of time based measurements
The following are the features corresponding to the *Mean* of the specified time based measurements taken from the dataset:
TimeBodyAccMeanX

TimeBodyAccMeanY

TimeBodyAccMeanZ

TimeGravityAccMeanX

TimeGravityAccMeanY

TimeGravityAccMeanZ

TimeBodyAccJerkMeanX

TimeBodyAccJerkMeanY

TimeBodyAccJerkMeanZ

TimeBodyGyroMeanX

TimeBodyGyroMeanY

TimeBodyGyroMeanZ

TimeBodyGyroJerkMeanX

TimeBodyGyroJerkMeanY

TimeBodyGyroJerkMeanZ

TimeBodyAccMagMean

TimeGravityAccMagMean

TimeBodyAccJerkMagMean

TimeBodyGyroMagMean

TimeBodyGyroJerkMagMean

### Standard deviation of time based measurements
The following are the features corresponding to the *Standard Deviation* of the specified time based measurements taken from the dataset:

TimeBodyAccStandardDeviationX

TimeBodyAccStandardDeviationY

TimeBodyAccStandardDeviationZ

TimeGravityAccStandardDeviationX

TimeGravityAccStandardDeviationY

TimeGravityAccStandardDeviationZ

TimeBodyAccJerkStandardDeviationX

TimeBodyAccJerkStandardDeviationY

TimeBodyAccJerkStandardDeviationZ

TimeBodyGyroStandardDeviationX

TimeBodyGyroStandardDeviationY

TimeBodyGyroStandardDeviationZ

TimeBodyGyroJerkStandardDeviationX

TimeBodyGyroJerkStandardDeviationY

TimeBodyGyroJerkStandardDeviationZ

TimeBodyAccMagStandardDeviation

TimeGravityAccMagStandardDeviation

TimeBodyAccJerkMagStandardDeviation

TimeBodyGyroMagStandardDeviation

TimeBodyGyroJerkMagStandardDeviation

### Mean of frequency based measurements
The following are the features corresponding to the *Mean* of the specified frequency based measurements taken from the dataset:

FrequencyBodyAccMeanX

FrequencyBodyAccMeanY

FrequencyBodyAccMeanZ

FrequencyBodyAccJerkMeanX

FrequencyBodyAccJerkMeanY

FrequencyBodyAccJerkMeanZ

FrequencyBodyGyroMeanX

FrequencyBodyGyroMeanY

FrequencyBodyGyroMeanZ

FrequencyBodyAccMagMean

FrequencyBodyBodyAccJerkMagMean

FrequencyBodyBodyGyroMagMean

FrequencyBodyBodyGyroJerkMagMean

### Standard deviation of frequency based measurements
The following are the features corresponding to the *Standard Deviation* of the specified frequency based measurements taken from the dataset:

FrequencyBodyAccStandardDeviationX

FrequencyBodyAccStandardDeviationY

FrequencyBodyAccStandardDeviationZ

FrequencyBodyAccJerkStandardDeviationX

FrequencyBodyAccJerkStandardDeviationY

FrequencyBodyAccJerkStandardDeviationZ

FrequencyBodyGyroStandardDeviationX

FrequencyBodyGyroStandardDeviationY

FrequencyBodyGyroStandardDeviationZ

FrequencyBodyAccMagStandardDeviation

FrequencyBodyBodyAccJerkMagStandardDeviation

FrequencyBodyBodyGyroMagStandardDeviation

FrequencyBodyBodyGyroJerkMagStandardDeviation
