library(dplyr)
library(data.table)

# Load in the libraries needed

test_X<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_ACT<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_SUB<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
train_X<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_ACT<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_SUB<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

#Load in data


total_X<-rbind(test_X,train_X)
total_ACT<-rbind(test_ACT,train_ACT)
total_SUB<-rbind(test_SUB,train_SUB)
total_data<-cbind(total_SUB,total_ACT,total_X)

#Merge the data

rm(list=c("test_X","test_ACT","test_SUB"))
rm(list=c("train_X","train_ACT","train_SUB"))

#Clean the Memory


features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
coldnames<-as.character(features[,2])
collogical<-logical(length = length(coldnames))
for (i in 1:length(coldnames)){
        collogical[i]<-as.logical(length(grep("mean\\(\\)",coldnames[i]))) | as.logical(length(grep("std\\(\\)",coldnames[i]))) 
        #Compare the name of each collumn with mean() and std()
}
names(total_data)<-c("Subject","Activity",coldnames)#Apply descriptive colnames
total_data_msonly<-total_data[,c(TRUE,TRUE,collogical)]
rm(list=c("total_X","total_ACT","total_SUB","features","total_data")) #Clean unneccessary data

#Extract collumns with method like mean() and std() and add descriptive collumn names

total_data_msonly$Activity<-factor(total_data_msonly$Activity,labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
total_data_msonly$Subject<-as.factor(total_data_msonly$Subject)

#Use descriptive activity names and set subjects and activities as factor

total_data_split<-split(total_data_msonly,list(total_data_msonly$Subject,total_data_msonly$Activity))

#Split the data into lists for each subject and activity

listname<-strsplit(names(total_data_split),"\\.")
listname<-as.data.table(listname)
listname<-data.table(Subject=as.factor(as.numeric(listname[1,])),Activity=as.factor(as.character(listname[2,])))

#Rebuild the first two columns, Subject and Activity, of the target dataframe

nlist<-length(total_data_split)
nvar<-ncol(total_data_msonly)
total_data_mean<-matrix(nrow = nlist,ncol = nvar-2)

#Initiate a temperal matrix to store averaged data

for (i in 1:nlist){
        temp_mean<-apply(total_data_split[[i]][,3:nvar],2,mean)
        total_data_mean[i,]<-as.numeric(temp_mean)
}

#Calculate the mean of each variable in every list

total_data_mean<-cbind(listname,as.data.table(total_data_mean))
names(total_data_mean)<-names(total_data_msonly)
total_data_mean<-arrange(total_data_mean,Subject,Activity)

#Combine to build the final datatable and apply names

write.table(total_data_mean,file = "./UCI HAR Dataset/average.txt",row.name=FALSE,sep = ",")

#Save the data
