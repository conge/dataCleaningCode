#Data Cleaning Project for the online course "Getting and Cleaning Data"

This repository was created to host the scripts for the online course I am taking on [Coursera](www.coursera.com). 
## Files in this repo:

* run_analysis.R: R script to process the raw data provided by the class project. See the Instruction section below for details on how to use the script.  
* README.md: This is the current file, which serves as the documentation and instruction of run_analysis.R. It also contains the codebook for the output file which is a tidy version of the raw data.

## About raw data.

The raw data were collected by motion sensors attached to human subjects while they were carrying out six different activities (e.g. Walking, laying, etc). The description of the data can be found [on the website of UCI Machine Learning repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Objective of the project

Create one R script called **run_analysis.R** that processes the raw data which 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Important Links

* [Course Website](https://class.coursera.org/getdata-002)
* [Project URL](https://class.coursera.org/getdata-002/human_grading)
* [Raw Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Instructions

### 1. Prepare directories and download data 
    
    mkdir ~/dataproject
    cd ~/dataproject
    mkdir tidyData script
    wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    unzip  getdata%2Fprojectfiles%2FUCI\ HAR\ Dataset.zip
    ln -s  UCI\ HAR\ Dataset/ rawData

### 2. download the **run_analysis.R** to the script folder created above.

    cd ~/dataProject/script
    wget https://github.com/conge/dataCleaningCode/blob/master/run_analysis.R

### 3. Run the script in R.

  you can run it under Linux/Unix by typing R at the prompt. 

    R
  
Once in R enter

    source('run_analysis.R')

Wait for a few minutes and you'll see a file named **smartphone.cvs** in the folder ~/dataProject/tidyData

## What does **run_analysis.R** do.

The script **run_analysis.R** read in all the trainning and testing data from the raw data folders and combine them into one big dataset. Average of variables were calculated for each activity and each subject.



