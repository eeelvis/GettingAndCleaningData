This repository cotains the following files:

run_analysis.R
codebook.md
news.csv
xMatrixCut.csv

The "run_analysis.R" file contains the R code that do following: 

1- Transform the UCIHAR Dataset into a matrix where each observation is one of the 10299 data points captured in the appropriate study and each of the rows is one of the variables measured. For details see description of the appropriate file "xMatrixCut.csv" in the codebook.md file. 

2- Produce a dataset "news.csv" which contains only the average value of each of the variables for each subject. For details see the description of the appropriate file "news.csv" in the codebook.md file.

The codebook.md file describes the ouput files of "run_analysis.R" (news.csv and xMatrixCut.csv), the variables, the data, and work that performed to clean up the data.

The data used to generate the files in this repository was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on 2014 04 15. For detailed information about the data see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

