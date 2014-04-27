# Read in all the data
setwd("~/Documents/Dropbox/Conge/Study/MOOC/DataScienceSpecialization/GettingAndCleaningData/project/dataCleaningCode")

## Train Data read in
subj_train <- read.table(file='../rawData/train/subject_train.txt')
X_train <- read.table(file='../rawData/train/X_train.txt')
y_train <- read.table(file='../rawData/train/y_train.txt')
body_acc_x_train <- read.table(file='../rawData/train/Inertial Signals/body_acc_x_train.txt')
body_acc_y_train <- read.table(file='../rawData/train/Inertial Signals/body_acc_y_train.txt')
body_acc_z_train <- read.table(file='../rawData/train/Inertial Signals/body_acc_z_train.txt')
body_gyro_x_train <- read.table(file='../rawData/train/Inertial Signals/body_gyro_x_train.txt')
body_gyro_y_train <- read.table(file='../rawData/train/Inertial Signals/body_gyro_y_train.txt')
body_gyro_z_train <- read.table(file='../rawData/train/Inertial Signals/body_gyro_z_train.txt')
total_acc_x_train <- read.table(file='../rawData/train/Inertial Signals/total_acc_x_train.txt')
total_acc_y_train <- read.table(file='../rawData/train/Inertial Signals/total_acc_y_train.txt')
total_acc_z_train <- read.table(file='../rawData/train/Inertial Signals/total_acc_z_train.txt')

## Test Data read in
subj_test <- read.table(file='../rawData/test/subject_test.txt')
X_test <- read.table(file='../rawData/test/X_test.txt')
y_test <- read.table(file='../rawData/test/y_test.txt')
body_acc_x_test <- read.table(file='../rawData/test/Inertial Signals/body_acc_x_test.txt')
body_acc_y_test <- read.table(file='../rawData/test/Inertial Signals/body_acc_y_test.txt')
body_acc_z_test <- read.table(file='../rawData/test/Inertial Signals/body_acc_z_test.txt')
body_gyro_x_test <- read.table(file='../rawData/test/Inertial Signals/body_gyro_x_test.txt')
body_gyro_y_test <- read.table(file='../rawData/test/Inertial Signals/body_gyro_y_test.txt')
body_gyro_z_test <- read.table(file='../rawData/test/Inertial Signals/body_gyro_z_test.txt')
total_acc_x_test <- read.table(file='../rawData/test/Inertial Signals/total_acc_x_test.txt')
total_acc_y_test <- read.table(file='../rawData/test/Inertial Signals/total_acc_y_test.txt')
total_acc_z_test <- read.table(file='../rawData/test/Inertial Signals/total_acc_z_test.txt')

## Read in labels.
activity_labels <- read.table(file='../rawData/activity_labels.txt')
features_labels <- read.table(file='../rawData/features.txt')

# Merge train and test data.
subj <- rbind(subj_train,subj_test)
X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
body_acc_x <- rbind(body_acc_x_train,body_acc_x_test)
body_acc_y <- rbind(body_acc_y_train,body_acc_y_test)
body_acc_z <- rbind(body_acc_z_train,body_acc_z_test)
body_gyro_x <- rbind(body_gyro_x_train,body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_y_train,body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_z_train,body_gyro_z_test)
total_acc_x <- rbind(total_acc_x_train,total_acc_x_test)
total_acc_y <- rbind(total_acc_y_train,total_acc_y_test)
total_acc_z <- rbind(total_acc_z_train,total_acc_z_test)

## recollect memory
rm(list=ls(pattern='_t'))
