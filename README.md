# GettingCleaningDataCourseProject
Course Project for the Coursera Getting and Cleaning Data course
#Output Data File
The final output data file is named summarised.csv. This file contains the results of running the run_analysis.R script on the input data. The details of this file can be found in the CodeBook.
The file can be opened in R using read.csv("sumarised.csv") with no other arguments.
#Input Data

The final output file is created using the following data sets:

- subject_train.txt : contains one row of data with subject ids of training data
- subject_test.txt : contains one row of data with subject ids of test data
- X_train.txt : contains all of the measurement data for the training subjects
- X_test.txt : contains all of the measurement data for the test subjects
- y_train.txt : contains one column of data with activity ids for the training subjects
- y_test.txt : contains one column of data with activity ids for the test subjects
It was assumed during this analysis that all of the above listed files lined up by row within the test or train data. That is, the first row of data in subject_train lines up with the first row of X_train and the first row of y_train. The same goes for the test data. 
The features.txt file was used to name the measurement columns and the activity_labels.txt file was used to replace the

activity label numbering with descriptive names.
#Scripts
##run_analysis.R
The run_analysis script file performs the entire analysis in 5 main steps
1. read in the data files and merge them into one. For this analysis, the Inertial Signals data was not needed
   so only the subject_train, X_train, y_train, subject_test, X_test, and y_test files were merged together. The rows 
   the train data were simply appended to the rows of the test data, with all of the columns lining up.
2. Extracts only the mean and standard deviation columns from the merged data set. The mean and standard deviation
   columns were chosen based on the text mean() or std() being in the column name
3. Bring in the activity_labels.txt file to replace the existing activity label numbers with descriptive names
4. Give the columns in the data set descriptive names. This step was actually performed during the data load/merge.

   The column names were taken from the features.txt file. This step adds the text "Avg-" to the beginning of each
   measurement column name in preparation of step 5.

5. Finally, the data set is grouped by subject and activity. The mean of all of the data columns is then calculated.
   This gives one row of data for each subject/activity unique combination. This creates a tidy data set by meeting the    tidy dataset criteria.
   - Each variable forms its own column
   - Each observation forms its own row
   - The data table contains only one type of observational unit
