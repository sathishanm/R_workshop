#install.packages("caTools")
library(caTools)
#set working directory
setwd("D:\\niit\\datascience and R\\new content slides\\day8")

#Load the csv file into object
admission=read.csv("admission.csv", header = T)
#check no of rows and columns
dim(admission)

# Randomly split the data into training and testing sets
set.seed(1000)
split = sample.split(admission, SplitRatio = 0.8)

# Split up the data using subset
train = subset(admission, split==TRUE)
test = subset(admission, split==FALSE)

nrow(train)
nrow(test)

#to check the class of rank
class(admission$rank)
# convert rank to a factor to indicate that rank should be treated as a categorical variable
admission$rank=as.factor(admission$rank)
#to check the class of rank
class(admission$rank)
#Train the model with the train dataset
model=glm(admit~gre+gpa+rank, data = train, family = "binomial")
#summary of the model
summary(model)
#Predict test data using the trained model
pred=predict(model, test[,-1], type = "response")
#rounding the results
pred
pred=round(pred)
pred
#Compare the Actual and Predicted results
resdf=data.frame("Actual"=test[,1], "Predicted"=pred)
print(resdf)
#Checking accuracy of the predicted results
#confusion matrix
confMat=table(test[,1],pred)
confMat


#Calcuate accuracy of the predicted results
sum(diag(confMat))/nrow(test)

sum(diag(confMat))
nrow(test)
