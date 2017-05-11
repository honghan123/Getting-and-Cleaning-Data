
## Getting and Cleaning Data Code Book ##
There are two dataset produced in this project

*output1.txt*

*tidy.txt*

### output1.txt Code Book ###
The dataset comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 'time') is at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time-BodyAccelererometer-XYZ and time-GravityAccelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time-BodyAccerometerJerk-XYZ and time-BodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time-BodyAccelerometerMagitude, time-GravityAccerometerMagitude, time-BodyAccelerometerJerkMagitude, time-BodyGyroscopeMaggitude, time-BodyGyroscopeJerkMagitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyDomainSignal-BodyAccelerometer-XYZ, frequencyDomainSignal-BodyAccelerometerJerk-XYZ, frequencyDomainSignal-BodyGyroscope-XYZ, frequencyDomainSignal-BodyAccelerometerJerkMagnitude, frequencyDomainSignal-BodyGyroscopeMagnitude, frequencyDomainSignal-BodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

**time-BodyAccelerometer-XYZ**

**time-GravityAccelerometer-XYZ**

**time-BodyAccelerometerJerk-XYZ**

**time-BodyGyroscope-XYZ**

**time-BodyGyroscopeJerk-XYZ**

**time-BodyAccelerometerMagnitude**

**time-GravityAccelerometerMagnitude**

**time-BodyAccelerometerJerkMagnitude**

**time-BodyGyroscopeMagnitude**

**time-BodyGyroscopeJerkMagnitude**

**frequencyDomainSignal-BodyAccelerometer-XYZ**

**frequencyDomainSignal-BodyAccelerometerJerk-XYZ**

**frequencyDomainSignal-BodyGyroscope-XYZ**

**frequencyDomainSignal-BodyAccelerometerMagnitude**

**frequencyDomainSignal-BodyAccelerometerJerkMagnitude**

**frequencyDomainSignal-BodyGyroscopeMagnitude**

**frequencyDomainSignal-BodyGyroscopeJerkMagnitude**

Dataset only containes mean and standard deviation value for these variables, for example:

*time-BodyAccelerometer-mean-X*

*time-BodyGyroscopeJerk-standardDeviation-X*

*frequencyDomainSignal-BodyAccelerometerJerk-mean-Z*

**subject_id** column range from 1-30 represent 30 volunteers within an age bracket of 19-48 years. 

**activity** is a factor represent the six activities a subject performs (walking, walking_upstairs, walking_downstairs, sitting, standing, laying)

### tidy.txt Code Book ###

tidy dataset include all variables in output1 dataset.  however, all variables values are an average value of each subject and each activity. 

All column names are prefixed with "average-", such as: *average-time-BodyAccelerometer-mean-X*


