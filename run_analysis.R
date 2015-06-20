# check if packages installed, if not, install,Then call the library
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
if("reshape2" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape2")}
library(dplyr)
library(reshape2)

#Assignment Step1: Merge the training and test data sets to create one
#read in the training data:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
#read in the column labels:
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")[,2]
#replace default column names with names in features.txt:
names(X_train)=features

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",colClasses = "character")

#read in the labels for the actual activity (values from 1 to 6) and rename the column:
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(y_train)="Activity.Number"

#read in the subjects number (ie, the volunteer people)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#rename the column to a more descriptive name
names(subject_train)="Person.number"

#column bind the subject name and activity number with the data:
All_train_data<-cbind(subject_train, y_train, X_train)

#read in all the test data information and add labels and columns:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
#replace default column names with names in features.txt:
names(X_test)=features

#read in the labels for the actual activity (values from 1 to 6) and rename the column:
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(y_test)="Activity.Number"

#read in the subjects number (ie, the volunteer people)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#rename the column to a more descriptive name
names(subject_test)="Person.number"
#column bind the subject name and activity number with the data:
All_test_data<-cbind(subject_test, y_test, X_test)
#now merge them together
Mergeddata<-rbind(All_train_data,All_test_data)

#Assignment Step 2: Extract only the columns with mean and standard deviation
#now, lets get the columns extracted that have mean or std in them
#Note, there is Mean and mean, so we are NOT going to collect "Mean" (mean of means)
Extracted_Data <- Mergeddata[,grep("Person|Activity|mean\\(\\)|std\\(\\)",names(Mergeddata))]

#Assignment Step 3: use descriptive activity names to name the activities in the data set
#so, Recode the numeric activity code to the character name in activity_labels file
newvalues <- activity_labels$V2
oldvalues <- activity_labels$V1
Extracted_Data$Activity.Number <- newvalues[match(Extracted_Data$Activity.Number,oldvalues)]

#now rename Activity.Number column to Activity.Name, since we are using Character Names
Extracted_Data<- rename(Extracted_Data, Activity.Name = Activity.Number)

#Assignment Step 4: use descriptive activity names
names(Extracted_Data)<-gsub("-","",names(Extracted_Data))
names(Extracted_Data)<-gsub("\\(\\)","",names(Extracted_Data))
names(Extracted_Data)<-gsub("mean","Mean",names(Extracted_Data))
names(Extracted_Data)<-gsub("std","Std",names(Extracted_Data))

#Assignment Step 5: Create a second independent data set
melted <- melt(Extracted_Data, id=c("Person.number","Activity.Name"))
tidyset <- dcast(melted, Activity.Name+Person.number ~ variable, mean)
#create the independent data set
write.table(tidyset, "./UCI HAR Dataset/Tidyset.txt", row.name=FALSE)
