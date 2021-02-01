# Code Book for the Getting and Cleaning data Peer reviewed Project

## The Raw Data:
- The raw data was obtained from files in the Human Activity Recognition Using Smartphones Dataset 

- info and descriptions on the specific files were obtained from the README.txt file of that data set

- the files used were: "activity_labels.txt", "feature_info.txt", "features.txt", "test/subject_test.txt", "test/X_test.txt", "test/y_txt", "train/subject_train.txt", "traint/X_train.txt", "train/y_train.txt" 

## the explanations of each file from the README.txt:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## each record contains:
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## The variables used that were extracted and summarized from Raw data:
- messyfeatures : This variable contains all the column names for the data sets as a data frame. These names represent the 561-feature vector with time and frequency domain variables. 

- mixcasefeatures: column names without .-()

- features: column names in all lowercase

### training set variables 

- training: a data frame of the untouched training set

- activity_train: a data frame containing activity label in integers of each record in the training set 

- sub_train: a df containing an identifier of the subject who carried out the experiment for each record in training set

- trainingfinal <- training set data frame that contains all 561- featured vectors and the subject column and the activity labels column

### test set variables:

- test: a data frame of the untouched test set

- sub_test: a df containing an identifier of the subject who carried out the experiment for each record in test set

- activity_test: a data frame containing activity label in integers of each record in the test set 

- testfinal: test set data frame that contains all 561- featured vectors and the subject column and the activity labels column

- total_data: a data frame that merged the training and the test data sets 

### variables involved in creation of the mean and std only table

- variables: contains the names of the columns of the entire table

- columns: contains only the names of columns with "std"" or "mean" or "activity" or "subject" 

- filtered_data: a data frame containing only columns that contain mean, std, activity(integers) and subject  

- activity_label: a data frame containing activity integer and descriptive labels

- final_data: same as filtered_data variable but the activity column values are now descriptive rather than integers

### variables to group by activity and subject and summarize the data

- by_act_sub: final_data variable grouped by activity and subject

- tidysummary: a tidy dataframe where each of the 561 variables as well as the subject and activity columns are in one column and the number of rows is the combination of the subject variable and the activity variable. The summary variable used was the mean for each column for each row. 

