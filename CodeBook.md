#Code Book

The script run_analysis.R tabulated two data frames called m and m_agg.

##m data frame:
Each row of m corresponds to a particular measurement, for details on how these measurements were taken see the readme file in UCI HAR Dataset/ directory.

The columns of m:
- Subject_Number: 1-30 indicating which subject the measurement corresponds to.
- Activity_Type : [Walking, Walking Upstairs, Walking Downstairs, Standing Up,Sitting Down, Laying Down] indicating which activity is being performed during the measurement
- Other features:  We have kept a subset of the features in the full dataset corresponding to the means and standard deviations of various other features.  Details about the features can be read about in the README.txt inside UCI HAR Dataset/ directory and they are obtained from the features.txt file.  Note: Hyphens and brackets have been converted to dots. 

##m_agg data frame:
This data frame computes the **averages** of the features in data frame m for given Subject_Number and Activity_Type, sorted by Activity_Type then Subject_Number.

The columns of m_agg:
- Subject_Number: 1-30 indicating which subject the measurement corresponds to.
- Activity_Type : [Walking, Walking Upstairs, Walking Downstairs, Standing Up,Sitting Down, Laying Down] indicating which activity is being performed during the measurement
- Other features: **Average** values of the other features in m for given Subject_Number and Activity_Type.  These have the syntax "Average_" before a feature from the data frame m.

