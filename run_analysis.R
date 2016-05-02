## Loading in of Libraries
library(dplyr)
## Reading in of activity and assigning labels

activitylabel<-read.csv("activity_labels.txt",sep="",header=FALSE)
colnames(activitylabel)<-c("Num","Descriptor")

## Reading in of features label
featureslabel<-read.csv("features.txt",sep="",header=FALSE)
colnames(featureslabel)<-c("Num","Descriptor")


## load test and training data
 testdata=read.csv(file="./test/X_test.txt",sep="",header=FALSE) 
 traindata=read.csv(file="./train/X_train.txt",sep="",header=FALSE)

##assign labels to the test and training data
colnames(testdata)<-featureslabel[,2]
colnames(traindata)<-featureslabel[,2]


##read in activity types for test and training data
ytrain=read.csv(file="./train/y_train.txt",sep="",header=FALSE)
ytest=read.csv(file="./test/y_test.txt",sep="",header=FALSE)






## Merging data 
ytrainact<-cbind(ytrain,traindata)
ytestact<-cbind(ytest,testdata)



##replaces the numeric values with the actual activity labels
ytrainact[,1]<-gsub("1","WALKING",ytrainact[,1])
ytrainact[,1]<-gsub("2","WALKING_UPSTAIRS",ytrainact[,1])
ytrainact[,1]<-gsub("3","WALKING_DOWNSTAIRS",ytrainact[,1])
ytrainact[,1]<-gsub("4","SITTING",ytrainact[,1])
ytrainact[,1]<-gsub("5","STANDING",ytrainact[,1])
ytrainact[,1]<-gsub("6","LAYING",ytrainact[,1])



ytestact[,1]<-gsub("1","WALKING",ytestact[,1])
ytestact[,1]<-gsub("2","WALKING_UPSTAIRS",ytestact[,1])
ytestact[,1]<-gsub("3","WALKING_DOWNSTAIRS",ytestact[,1])
ytestact[,1]<-gsub("4","SITTING",ytestact[,1])
ytestact[,1]<-gsub("5","STANDING",ytestact[,1])
ytestact[,1]<-gsub("6","LAYING",ytestact[,1])

colnames(ytrainact)[1]<-"activity"
colnames(ytestact)[1]<-"activity"



## subsetting out the data for mean and std 
vectorsub<-grep("activity|mean|std",colnames(ytrainact))
ytrainact_sub<-ytrainact[,c(vectorsub)]


vectorsub<-grep("activity|mean|std",colnames(ytestact))
ytestact_sub<-ytestact[,c(vectorsub)]


##Putting all the data into one frame.

yact_all<-rbind(ytrainact_sub,ytestact_sub)


## Save Ascii
write.table(yact_all,file="alldata.txt",row.names=FALSE)



##mean of different variables

WALKING_filter<-filter(yact_all,activity=="WALKING")
WALKING_UPSTAIRS_filter<-filter(yact_all,activity=="WALKING_UPSTAIRS")
WALKING_DOWNSTAIRS_filter<-filter(yact_all,activity=="WALKING_DOWNSTAIRS")
SITTING_filter<-filter(yact_all,activity=="SITTING")
STANDING_filter<-filter(yact_all,activity=="STANDING")
LAYING_filter<-filter(yact_all,activity=="LAYING")

WALKING_mean<-sapply(WALKING_filter,mean)
WALKING_UPSTAIRS_mean<-sapply(WALKING_UPSTAIRS_filter,mean)
WALKING_DOWNSTAIRS_mean<-sapply(WALKING_DOWNSTAIRS_filter,mean)
SITTING_mean<-sapply(SITTING_filter,mean)
STANDING_mean<-sapply(STANDING_filter,mean)
LAYING_mean<-sapply(LAYING_filter,mean)


### mean for various activities and parameters were put together
activities_mean<-rbind(WALKING_mean,WALKING_UPSTAIRS_mean,WALKING_DOWNSTAIRS_mean,SITTING_mean,STANDING_mean,LAYING_mean)

