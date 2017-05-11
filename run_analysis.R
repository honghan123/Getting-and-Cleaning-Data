
##Getting and Cleaning Data project is to collect, work with, and clean a data set.


## run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function()
{
  ## set working directory to store data
  
  wd <- "C:/Getting-and-Cleaning-Data/data"
  output1 <- "C:/Getting-and-Cleaning-Data/data/output1.txt"
  output2 <- "C:/Getting-and-Cleaning-Data/data/tidy.txt"
  
  ## if data directory does not exist, create it
  
  if(!file.exists((wd))) {
      print("create new directory") 
      dir.create(wd, recursive = TRUE)
      }
  
  ## set working directory (data)
  setwd(wd)

  ## check to load downloader package
  
  if(!require("downloader")) install.packages("downloader")
  library(downloader)
  
  if(!require("dplyr")) install.packages("dplyr")
  library(dplyr)
  
  ## reshape2 
  if(!require("reshape2")) install.packages("reshape2")
  library(reshape2)
  
  ## destination zip file name  
  
  dataset_file <- paste(wd, "/dataset.zip", sep = "") 
   
  ## check if file is already downloaded, if not, download it 
  if(!file.exists(dataset_file))
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = dataset_file,  mode ="wb")
  }
  
  ## check if zip file is already unzipped, if no unzip it.
  
  if(!file.exists("UCI HAR Dataset"))
  {
    unzip(dataset_file, exdir = ".")
  }
  else
  {
    print("-- Dataset already downloaded and unzipped -- ")
  }
  
  
  ## file names
  
  feature_file <- paste(wd, "/UCI HAR Dataset/features.txt", sep = "")
  activityLabel_file <- paste(wd, "/UCI HAR Dataset/activity_labels.txt", sep = "")  
  x_test_file <- paste(wd, "/UCI HAR Dataset/test/X_test.txt", sep = "")
  y_test_file <- paste(wd, "/UCI HAR Dataset/test/y_test.txt", sep = "")
  subject_test_file <- paste(wd, "/UCI HAR Dataset/test/subject_test.txt", sep = "")

 
  

  ## read common files  
  feature <- read.table(feature_file)
  activityLabels <- read.table(activityLabel_file)
  
  ## read test files
  x_test <- read.table(x_test_file)
  y_test <- read.table(y_test_file)
  subject_test <- read.table(subject_test_file)
  
  colnames(x_test) <- feature$V2
  
  ## add set column to indicate "test" data set
 # y_test$"2" <- tolower(activityLabels[y_test$V1, 2])
  
  x_test <- cbind("subject_id" = subject_test[[1]], 
                  "activity" = y_test[[1]], 
                  x_test)

  rm(y_test)
  
  s <- sprintf("    test data # of columns: %d # of rows: %d ", ncol(x_test), nrow(x_test) )
  print(s)
  
  ## process train files
  
  x_train_file <- paste(wd, "/UCI HAR Dataset/train/X_train.txt", sep = "")
  y_train_file <- paste(wd, "/UCI HAR Dataset/train/y_train.txt", sep = "")
  subject_train_file <- paste(wd, "/UCI HAR Dataset/train/subject_train.txt", sep = "")

  ## read files  
  x_train <- read.table(x_train_file)
  y_train <- read.table(y_train_file)
  subject_train <- read.table(subject_train_file)
  
  
  colnames(x_train) <- feature$V2
  
  
  y_train$"2" <- tolower(activityLabels[y_train$V1, 2])
  
  x_train <- cbind("subject_id" = subject_train[[1]], 
                   "activity" = y_train[[1]], 
                    x_train)
  
  s1 <- sprintf("   train data # of columns: %d # of rows: %d ", ncol(x_train), nrow(x_train) )
  print(s1)
  
  
  ##  1:	Merges the training and the test sets to create one data set c_data
  
  c_data <- rbind(x_train, x_test)
  
  print(" #1: Merges the training and the test sets to create one data set")
  
  s2 <- sprintf("combined data # of columns: %d # of rows: %d ", ncol(c_data), nrow(c_data) )
  print(s2)

  
  ## 2	Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  col_select <- grep("mean\\(\\)|std\\(\\)", names(c_data))
  
  dataset1 <- c_data[, c(1:2, col_select)]
  
  print("#2: Extracts only the measurements on the mean and standard deviation for each measurement")
  
  ## 3.	Uses descriptive activity names to name the activities in the data set
  
  dataset1$activity <- tolower(activityLabels[dataset1$activity, 2])
  
  print("#3: Uses descriptive activity names to name the activities in the data set")
  print(head(dataset1[,1:4]))
  
  
  ## 4.	Appropriately labels the data set with descriptive variable names. 
 
  names(dataset1) <- gsub("^t", "time-",names(dataset1))
  names(dataset1) <- gsub("^f", "frequencyDomainSignal-",names(dataset1))
  
  names(dataset1) <- gsub("Acc", "Accelerometer",names(dataset1))
  names(dataset1) <- gsub("Gyro", "Gyroscope",names(dataset1))
  names(dataset1) <- gsub("Mag", "Magnitude",names(dataset1))
  names(dataset1) <- gsub("BodyBody", "Body",names(dataset1))  
  
  names(dataset1) <- gsub("mean\\(\\)", "mean",names(dataset1)) 
  names(dataset1) <- gsub("std\\(\\)", "standardDeviation",names(dataset1))   
  
  print("#4: Appropriately labels the data set with descriptive variable names")
  print(names(dataset1))
  
  write.table(dataset1, file = output1, row.name = FALSE)
  
  ##5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject"

  print(head(dataset1[, 1:4], 20))

  dataset2 <- dataset1
  
  dataset2 <- dataset2 %>% 
            melt(id = c("subject_id", "activity")) %>%
            dcast(subject_id + activity ~ variable, mean)
  
  ## Add average prefix to column names
  names(dataset2) <- gsub("^t", "average-t", names(dataset2))
  names(dataset2) <- gsub("^f", "average-f", names(dataset2))  
  

  write.table(dataset2, file = output2, row.name =FALSE)
  
  print(head(dataset2[, 1:4], 20))
  
  return(dataset2)
  
}