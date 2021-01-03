#install.packages("caTools")
library(caTools)
#set working directory
setwd("D:\\niit\\datascience and R\\new content slides\\day8")

#Load the csv file into object
cherry=read.csv("cherry.csv", header = T)


#summary
summary(cherry)

#check no of rows and columns
dim(cherry)
# Randomly split the data into training and testing sets
set.seed(1000)
split = sample.split(cherry, SplitRatio = .80)

# Split up the data using subset
train = subset(cherry, split==TRUE)
test = subset(cherry, split==FALSE)

#check data structure
str(train)

#Train Model using the train data
# there are two independent variables
# Girth and Height.
#along with the dependent variable Volume
model=lm(Volume~Girth+Height, data = train)

#y= mx+c
#y= m1*x1+m2*x2+c
#View statistical information about the model
summary(model)$r.squared

#Use the trained model to predict for test data
pred=predict(model, test[,-3])

#Create data frame with Actual and Predicted results for checking the results
resdf=data.frame("Actual"=test[,3], "Predicted"=pred)
resdf



