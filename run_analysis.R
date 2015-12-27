library(dplyr)

#Creating a directory for the data to be loaded 
if(!file.exists("UCI HAR Dataset")) {
  dir.create("UCI HAR Dataset")
}

#loading common files
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")
features = read.table("./UCI HAR Dataset/features.txt")

#loading training files
x_train = read.table("./UCI HAR Dataset/train/X_train.txt")
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")

#loading test files
x_test = read.table("./UCI HAR Dataset/test/X_test.txt")
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")

dateDownloaded <- date()

#Checking missing values
all(colSums(is.na(activity_labels))==0)
all(colSums(is.na(features))==0)
all(colSums(is.na(x_train))==0)
all(colSums(is.na(y_train))==0)
all(colSums(is.na(subject_train))==0)
all(colSums(is.na(x_test))==0)
all(colSums(is.na(y_test))==0)
all(colSums(is.na(subject_test))==0)

#renaming the features (measures) with names from the features dataframe for both test and train
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

#adding activity and subject for both test and train
x_train <- cbind(y_train$V1, paste("Subject",subject_train$V1), x_train)
colnames(x_train)[1] <- "Activity Id"
colnames(x_train)[2] <- "Subject"

x_test <- cbind(y_test$V1, paste("Subject",subject_test$V1), x_test)
colnames(x_test)[1] <- "Activity Id"
colnames(x_test)[2] <- "Subject"

#combining the training and the test data sets
x_test_and_train <- rbind(x_train,x_test)

#Join to the Activity dataframe to find the proper activity name
colnames(activity_labels) <- c("Activity Id","Activity")
df_list = list(x_test_and_train,activity_labels)
df_joined_list <- join_all(df_list)

# create subset of variables containing mean or standard deviation (std) in their names
df_mean_and_std <- cbind(
  df_joined_list[,"Activity"], 
  df_joined_list[,"Subject"],
  df_joined_list[,grep("mean",names(df_joined_list))],
  df_joined_list[,grep("std",names(df_joined_list))]
  )
colnames(df_mean_and_std)[1] <- "Activity"
colnames(df_mean_and_std)[2] <- "Subject"

# create understandable variable names
names(df_mean_and_std) <- gsub("tBodyAcc-","Time Body Acceleration ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tGravityAcc-","Time Gravity Acceleration ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyAccJerk-","Time Body Acceleration Jerk ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyGyro-","Time Body Velocity ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyGyroJerk-","Time Velocity Jerk ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyAccMag-","Time Body Acceleration Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tGravityAccMag-","Time Gravity Acceleration Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyAccJerkMag-","Time Body Acceleration Jerk Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyGyroMag-","Time Body Velocity Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("tBodyGyroJerkMag-","Time Body Velocity Jerk Magnitude ",names(df_mean_and_std))

names(df_mean_and_std) <- gsub("fBodyAcc-","Frequency Body Acceleration ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyAccJerk-","Frequency Body Acceleration Jerk ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyGyro-","Frequency Body Velocity ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyAccMag","Frequency Body Acceleration Magnitude",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyAccJerkMag","Frequency Body Acceleration Jerk Magnitude",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyGyroMag","Frequency Body Velocity Magnitude",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyGyroJerkMag","Frequency Body Velocity Jerk Magnitude ",names(df_mean_and_std))
  
names(df_mean_and_std) <- gsub("fBodyBodyAccJerkMag-","Frequency Body Body Acceleration Jerk Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyBodyGyroMag-","Frequency Body Body Velocity Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("fBodyBodyGyroJerkMag-","Frequency Body Body Velocity Jerk Magnitude ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("std\\()-","Standard Deviation - Direction ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("meanFreq\\()-","Mean Frequency - Direction ",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("mean\\()-","Mean Value - Direction ",names(df_mean_and_std))

names(df_mean_and_std) <- gsub("std\\()","Standard Deviation",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("meanFreq\\()","Mean Frequency",names(df_mean_and_std))
names(df_mean_and_std) <- gsub("mean\\()","Mean Value",names(df_mean_and_std))

# create computed average of measurement variables for activity and subject
my_mean_df <- df_mean_and_std %>%
  group_by(Activity, Subject) %>%
  summarise_each(funs(mean(., na.rm=TRUE)))

# write data to file
write.table(my_mean_df, "./UCI HAR Dataset/my_mean_df.txt", sep="\t", row.names=FALSE)
