library(dplyr)
library(tidyr)
train<- read.table("C:/Users/Enrique/Desktop/coursera/UCI HAR Dataset/train/X_train.txt")
test<-read.table("C:/Users/Enrique/Desktop/coursera/UCI HAR Dataset/test/X_test.txt")
features<- read.table("C:/Users/Enrique/Desktop/coursera/UCI HAR Dataset/features.txt")
nam<-features$V2   # extraer los nombres de las actividades
colnames(test)<-nam # cambiar los nombres de las columnas
colnames(train)<-nam
test_mean<-grep(c("mean"),colnames(test)) #extraer todas los nombres que contengan mean o std
test_std<-grep("std",colnames(test))
test_s_m<-sort(append(test_mean,test_std)) #create a new list in order of the position that has the mean and std in the names

train_mean<-grep("mean",colnames(train))
train_std<-grep("std",colnames(train))
train_s_m<-sort(append(train_mean,train_std)) #create a new list in order of the position that has the mean and std in the names

test_final<-test[,test_s_m] # list of all the mean and std of the activities
test_final<-mutate(test_final,ID="Test")

train_final<-train[,train_s_m]# list of all the mean and std of the activities
train_final<-mutate(train_final,ID="Train")
solve<-rbind(test_final,train_final) ##merge the table in one
dim(solve)
tidy_data<- data.frame(colMeans(solve[1:79])) #create a dataframe with 
names(tidy_data)=c("Means") #change the name of the column

write.table()

