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
activity <- rbind(y_train,y_test)

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

## Extract Mean and standard deviation for measurements.
body_acc_x_mean = rowMeans(body_acc_x)
body_acc_x_sd = apply(data.matrix(body_acc_x),1,sd)
body_acc_y_mean = rowMeans(body_acc_y)
body_acc_y_sd = apply(data.matrix(body_acc_y),1,sd)
body_acc_z_mean = rowMeans(body_acc_z)
body_acc_z_sd = apply(data.matrix(body_acc_z),1,sd)

body_gyro_x_mean = rowMeans(body_gyro_x)
body_gyro_x_sd = apply(data.matrix(body_gyro_x),1,sd)
body_gyro_y_mean = rowMeans(body_gyro_y)
body_gyro_y_sd = apply(data.matrix(body_gyro_y),1,sd)
body_gyro_z_mean = rowMeans(body_gyro_z)
body_gyro_z_sd = apply(data.matrix(body_gyro_z),1,sd)

total_acc_x_mean = rowMeans(total_acc_x)
total_acc_x_sd = apply(data.matrix(total_acc_x),1,sd)
total_acc_y_mean = rowMeans(total_acc_y)
total_acc_y_sd = apply(data.matrix(total_acc_y),1,sd)
total_acc_z_mean = rowMeans(total_acc_z)
total_acc_z_sd = apply(data.matrix(total_acc_z),1,sd)


df <- data.frame(body_acc_x_mean, body_acc_x_sd,
                          body_acc_y_mean, body_acc_y_sd,
                          body_acc_z_mean, body_acc_z_sd,
                          body_gyro_x_mean, body_gyro_x_sd,
                          body_gyro_y_mean, body_gyro_y_sd,
                          body_gyro_z_mean, body_gyro_z_sd,
                          total_acc_x_mean, total_acc_x_sd,
                          total_acc_y_mean, total_acc_y_sd,
                          total_acc_z_mean, total_acc_z_sd
)

rm(list=ls(pattern='acc'))
rm(list=ls(pattern='gyro'))


## activity names
subj = as.factor(subj$V1)
activity = as.factor(activity$V1)
levels(activity) <-(list(WALKING=1,WALKING_UPSTAIRS=2,WALKING_DOWNSTAIRs=3,
                  SITTING=4,STANDING=5,LAYING=6))

data <- cbind(df,X)
data$subj <- subj
data$activity <- activity


## average each variable in data for each activity and each subject.

tidy <- aggregate(. ~ subj + activity, data = data, FUN= mean,na.rm=TRUE )
write.csv(tidy,file='../tidyData/smartphone.csv')
