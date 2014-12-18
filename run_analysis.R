library(plyr)
fe<-read.table("UCI HAR Dataset/features.txt",sep='',colClasses='character')

tr<-read.table("UCI HAR Dataset/train/X_train.txt",sep='',col.names=fe[,2])
te<-read.table("UCI HAR Dataset/test/X_test.txt",sep='',col.names=fe[,2])

#activity type
tr_a<-read.table("UCI HAR Dataset/train/y_train.txt",sep='',colClasses='factor')
te_a<-read.table("UCI HAR Dataset/test/y_test.txt",sep='',colClasses='factor')  

tr_a<-rename(tr_a,c("V1"="Activity_Type"))
te_a<-rename(te_a,c("V1"="Activity_Type"))

#subject
tr_s<-read.table("UCI HAR Dataset/train/subject_train.txt",sep='',colClasses='factor')
te_s<-read.table("UCI HAR Dataset/test/subject_test.txt",sep='',colClasses='factor')  

tr_s<-rename(tr_s,c("V1"="Subject_Number"))
te_s<-rename(te_s,c("V1"="Subject_Number"))

#convert numbers to names for activities
tr_a[,1]<-mapvalues(tr_a[,1], from = c("1", "2","3","4","5","6"), to = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting Down", "Standing Up", "Laying Down"))
te_a[,1]<-mapvalues(te_a[,1], from = c("1", "2","3","4","5","6"), to = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting Down", "Standing Up", "Laying Down"))

#bind everything together in one big table
m<-cbind(rbind(tr_a,te_a),rbind(tr,te))
m<-cbind(rbind(tr_s,te_s),m)

#extract the mean and standard deviation columns
ms<-c(grep("mean\\(\\)",fe[,2]),grep("std\\(\\)",fe[,2]))
#we need to add 2 to index since we added 2 columns (activity type and subject name) to the left of m
m<-m[,c(1,2,ms+2)]


#Create the independent data set which calculates the mean of all the variables for given Subject Number and Activity Type
m_agg<-aggregate(.~Activity_Type+Subject_Number,data=m,FUN=mean)
#Reorder by activity type then subject number
m_agg<-m_agg[order(m_agg$Activity_Type,as.numeric(as.character(m_agg$Subject_Number))),]
#rename the columns to show they are now averages (not the first and second though):
colnames(m_agg)[c(-1,-2)]<-paste("Average_",colnames(m_agg)[c(-1,-2)],sep="")
