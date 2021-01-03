#Decision Tree
#simple example 
#install.packages("rpart")
# install.packages("rpart.plot")
 
library(rpart)
library(rpart.plot)
library(caTools)
setwd("D:\\niit\\datascience and R\\new content slides\\day9")

train=read.csv("titanic.csv")

tree2 <- rpart(Survived ~ Sex + Age,
               data=train,
               method="class")
tree2
rpart.plot(tree2,type=3,extra=101)

#one more example


data("iris")
str(iris)
table(iris$Species)
#data preparation
set.seed(9850)
###
# Randomly split the data into training and testing sets
set.seed(1000)
split = sample.split(iris, SplitRatio = 0.8)

# Split up the data using subset
train = subset(iris, split==TRUE)
test = subset(iris, split==FALSE)

####
tree3<-rpart(Species ~ .,data=train,method = "class")
tree3
rpart.plot(tree3,type=3,extra = 101)
P3<-predict(tree3,test,type = "class")
table(test[,5],P3)
#accuracy = 48/50 = 96%
28/30

#class Exercise. Use the iris data set to classify the 
#admission data using Decision tree. Calculate the accuracy
#use split .65 instead of .8



#install.packages("randomforest")
library(randomForest)
forest1<-randomForest(Species ~ .,data=train,method = "class",ntree=10)
P4<-predict(forest1,test,type = "class")
table(test[,5],P4)
#accuracy = 48/50 = 96%
28/30


