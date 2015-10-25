CodeBook for Tidy_data_step5.txt
The dataset includes the mean value of all measurements from test and train datasets for each combination of
subject(volunteer in the experiments) and activity for the following variables. The data set is also sorted 
by subject and activity.
variables:
  Subject: 
    Identifications of the volunteers in the experiments, range from 1-30
  Activity:
    The activity the volunteers took during the measurements, there are 6 activities considered:
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING
  The remaing variables:
    The features selected for this database come from the accelerometer and gyroscope 3-axial raw 
    signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were 
    captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd
    order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly,
    the acceleration signal was then separated into body and gravity acceleration signals 
    (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner
    frequency of 0.3 Hz. 
    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain
    Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
    signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
    tBodyGyroMag, tBodyGyroJerkMag). 
    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ,
    fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
    indicate frequency domain signals). 

    Signals were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
    Features are normalized and bounded within [-1,1]
    Variable name         Unit
    tBodyAcc-XYZ          g
    tGravityAcc-XYZ       g
    tBodyAccJerk-XYZ      g
    tBodyGyro-XYZ         radians/second
    tBodyGyroJerk-XYZ     radians/second
    tBodyAccMag           g
    tGravityAccMag        g
    tBodyAccJerkMag       g
    tBodyGyroMag          radians/second
    tBodyGyroJerkMag      radians/second
    fBodyAcc-XYZ          g
    fBodyAccJerk-XYZ      g
    fBodyGyro-XYZ         radians/second
    fBodyAccMag           g
    fBodyAccJerkMag       g
    fBodyGyroMag          radians/second
    fBodyGyroJerkMag      radians/second
    
    The set of variables that were estimated from these signals are: 
    mean(): Mean value
    std(): Standard deviation

  
