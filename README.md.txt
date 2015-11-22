==================================================================
Desciption of the script:
==================================================================

1- the code read the different tables and create the two database : training set and test set
2- Combine the two dataset which have the same number of columns to generate the data_set table
3- Go and look in the column names which ones correspond to "mean" measurements and "standard" measurements
4- Subset the two differents matrix(mean and standard) with the appropriate columns
5- Make a split the two matrix in order to create lists based on the values of the variables ( "subject" and "Labels")
6- Generate the two matrix with the mean calculated for each variable of each subject and each label