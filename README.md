- This repo contains Codebook.md file, run_analysis.R file and this README.md file

- The Codebook.md file explains the data, the variables used and how the summaries were calculated in the run_analysis.R script file  


## General description of run_analysis.R
- The script performs the below steps then writes a "tidydata.txt" file using the tidy data set that was created which, is a summary table of the mean of each variable for the activity and subject variables
- to read and view the file use x <- read.table("tidydata.txt", header = TRUE) then View(x)

## Appropriately labeling the data set with descriptive variable names

- The data set labels were obtained from the features.txt file which contains names that are descriptive but messy. So in order to use the values in this file as variable names, they needed to be cleaned up. 

- the variable names were fetched as a df "messyfeatures" from the "features.txt"" file  using read.table

- column names were cleaned up to exclude all punctuation (e.g.-.,()) using gsub and substituting the punctuation with "". Then the resulting values were changed to all lowercase in a variable called features.

- Other gsub functions were used to remove double words in the name or to expand abreviations e.g. std to standarddeviation, Freq to frequency

- the features variable was used for column names when creating the train and test df in col.names = features

- The reason this step was taken early, was that it makes it easier to search for mean and std variables when all of them as cleaned up i.e. no punctuation or dashes and are all lowercase

## Merging the training and the test sets to create one data set

- the training set was obtained as a df using read.table

- the activity column and the subject column were also obtained using read.table as df

- the two columns were added to the training set using the mutate function. Note: to add them as columns rather than df I used the vectors i.e sub_train[[1]], activity_train[[1]] when adding them 

- the test set df was constructed using the same steps as above

- The two df training and test were merged using full_join function

## Extracting only the measurements on the mean and standard deviation for each measuremen

- the column **names**  i.e. names(data), were filtered using  grep and the regular expression "mean|standarddeviation|activity|subject" which included the activity and subject columns and translates to mean or std or ... 
- the columns were filtered using the select function and the filtered names variables was used as an argument in that function.

## Changing the activity Column 
- the descriptive activity labels were obtained from the "activity_labels.txt" file and this df was merged with the filtered df. This creates a new filtered data table but with an extra column"V2" that contains the described activity as well as the old activity column.  So to tidy up the table, mutate was used to overwrite the integer activity column "activity" with the described activity column "V2". Then the V2 column was removed using the select function. 

## Ceating an independent tidy data set with the average of each variable for each activity and each subject.

- To create tidy data, the activity(6 different) and the subjects(30 different) should be grouped which produces 180 (6X30) combinations i.e. 180 row data table. And each row contains the mean for each variable for each combination. This way the data is consistent with the tidy data components that each variable is in one column and each different observation of that variable should be in a different row.

- group_by was used to group data into activity and subject

- summarize_all was used to calculate the mean for each group combination for each column. 

