Purpose of run_analysis.R and the output files produced by running script.

PS: Sorry about my english. I am not fluent.
PS2: For more details not mentioned here, read the comments on the code (run_analysis.R).

The file run_analysis.R reads the data from the UCIHAR Dataset and processes it (details below).

The UCIHAR Dataset is the described as following from the source:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Check the README.txt* file for further details about this dataset.

run_analysis.R works by reading the files from test and training sets, loading in variable names and appropriately name the R variables columns and rows. 

The Test and Train datasets are merged into a singl matrix of observations and variables, where each observation is one of the 10299 data points captured in the appropriate study[2], and each of the rows is one of the variables measured. 

The script proceeds to creating a reduced version of the dataset where only "means" of the data are included in the "reduced" version of the dataset. This data are write to the in the place defined in my machine onto a csv format to the file xMatrixCut.csv.

This R script also produces a new dataset which consists in taking the mean variable values for each subject and creating a matrix where entry (i, j) is the mean of the ith variable for the jth subject. This varibale is called "news" and is write to the in the place defined in my machine onto a csv format to the file news.csv.

The source data for job done above, can be found on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and your owners are Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
