## Part 1 : Merge the two data set

## Create Training set
features <- read.table("./features.txt")
features <- as.vector(features[,2])
X_train <- read.table("./train/X_train.txt")
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")

    train_set <- cbind(subject_train,y_train,X_train)
    colnames(train_set)<- c("Subject", "Labels",features)
    
## Create Test set
X_test <- read.table("./test/X_test.txt")
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
    
    test_set <- cbind(subject_test,y_test,X_test)
    colnames(test_set)<- c("Subject", "Labels",features)   

##Merge the two data set
    
  data_set <-rbind(train_set,test_set)
  

##Part 2 : Extrat the mean and standard deviation measurements

  
  ##Part with the mean
## Get all measurements with mean
mean_measurement <- grep("mean", colnames(data_set))

## Generate the matrix with mean measurements
matrix_mean <- data_set[,1:2]
colnames <- c("Subject","Labels")
for (i in 1:length(mean_measurement)){
  matrix_mean <- cbind(matrix_mean,data_set[,mean_measurement[i]])
  colnames <- c(colnames, features[mean_measurement[i]-2])
}
colnames(matrix_mean) <- colnames

## Split into the subjects and labels
split_subjects_mean <- split(data_set,matrix_mean$Subject)
split_labels_mean <- split(data_set,matrix_mean$Labels)


  ##Part with the std

## Get all measurements with std
std_measurement <- grep("std", colnames(data_set))

## Generate the matrix with std measurements
matrix_std <- data_set[,1:2]
colnames <- c("Subject","Labels")
for (i in 1:length(std_measurement)){
  matrix_std <- cbind(matrix_std,data_set[,std_measurement[i]])
  colnames <- c(colnames, features[std_measurement[i]-2])
}
colnames(matrix_std) <- colnames

## Split into the subjects and labels
split_subjects_std <- split(data_set,matrix_std$Subject)
split_labels_std <- split(data_set,matrix_std$Labels)


##Part 5 : Get the mean of each labels and subjects
mean_matrix_Labels <- aggregate(matrix_mean[,3:ncol(matrix_mean)], list(matrix_mean$Labels),mean)
mean_matrix_Subject <- aggregate(matrix_mean[,3:ncol(matrix_mean)], list(matrix_mean$Subject),mean)

