#Summary of the data manipulation script

A script to combine and tidy the Samsung Tracker data is included at run_analysis.R

The code does the following:

1. Reads in the training data and the test data (X_train.txt and X_test.txt) to data frames tr and te
2. Adds a column for the subject number to each of these gotten from subject_train.txt (tr_s) and subject_test.txt (te_s)
3. Changes the activity numbers to names of activities using activity_labels.txt
4. Adds the variable names to the columns of this data gotten from features.txt
5. Merges the training data and test data together (into data frame called m)
6. Searches for columns which have information about the mean and the standard deviation (stored in a vector called ms) of each variable and takes that subset for the data frame m
7. Makes a summarizing table (m_agg) which computes the mean of the different variables in terms of the Activity Type and the Subject Name. Rename the columns (to Average_feature) to represent this change.