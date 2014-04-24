# Read in all the data

../rawData/train/subject_train.txt


../rawData/train/Inertial Signals:
  body_acc_x_train.txt
body_acc_y_train.txt
body_acc_z_train.txt
body_gyro_x_train.txt
body_gyro_y_train.txt
body_gyro_z_train.txt
total_acc_x_train.txt
total_acc_y_train.txt
total_acc_z_train.txt

Subj_train <- read.table(file='../rawData/train/subject_train.txt')
X_train <- read.table(file='../rawData/train/X_train.txt')
y_train <- read.table(file='../rawData/train/y_train.txt')
