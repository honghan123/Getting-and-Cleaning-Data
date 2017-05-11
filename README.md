
## This is the Getting and Cleaning Data Project ##

The goal of the project is to get, process, clean and generate tidy dataset file. 
[The data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) used for this project is from a website represent data collected from the accelerometers from the Samsung Galaxy S smartphone

Here is the requirement of the project:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The completed project package include ###

* **README.md**     The instructure to generate the submitted result
* **CodeBook.md**   Modified code book for the proceesed dataset and final tidy dataset, based on original dateset, after data clean, process. 
* **run_analysis.R**    R script to download, merge, process and generate dataset based on 5 requirements
* **output1.txt**      Merged, processed dataset from step 1-4.
* **tidy.txt**         The transformed dataset based on step 5 requirement

###  Run run_analysis.R ###

run_analysis() function is all in one function and does not take any variable.  

To run, simple type:  **run_analysis()**

The working directory is **C:/Getting-and-Cleaning-Data/data** (for windows use). 

*Notes: Unix/Linux user will need to modify this working directory*

run_anaylysis() will complete all 5 tasks and product two output files. **output1.txt** and **tidy.txt**

