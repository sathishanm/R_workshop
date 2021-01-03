#statistics
#Mean, Median, (Mode)  -> Central tendencies
weights<-c(76.24,67.56,89.65,56.76)
ages<-c(23,35,45,63)
mean(weights)
mean(ages)
median(weights)
#calculation
#56.76,67.56,76.24,89.65)
(67.56+76.24)/2
median(ages)
(35+45)/2
ages1<-c(80,80,23,24,24,24,59,59,59,60,63,80,80,80,80)
median(ages1)
#calculation
#23,24,24,24,59,59,59,60,63,80,80,80,80,80,80 => 15 observations
#median 15+1/2 = 8th observation = 60
mode(ages)  #there is no function for mode in R
#we have to write our own function will be done in a 
# later section when dealing with functions. 

#spread 
#variance and standard deviation
var(weights)
sd(weights)
var(ages)
sd(ages)
a<-rep(3,5)
a
var(a)
sd(a)


##data import 
##############
##data import 
myfile<-read.csv("D:\\niit\\data\\titanic.csv")
summary(myfile)

boxplot(Age)
boxplot(myfile$Age)
attach(myfile)
boxplot(Age)
str(myfile)
head(myfile)
myfile<-read.csv("D:\\niit\\Big Data and R\\new content slides\\Day2\\titanic.csv",stringsAsFactors = FALSE)
str(myfile)
head(myfile)
myfile$Sex<-as.factor(myfile$Sex)
myfile$Embarked<-as.factor(myfile$Embarked)
str(myfile)
summary(myfile)
hist(myfile$Age)
attach(myfile)
str(Age)
hist(Age)
detach(myfile)
#filering the data by rows
myfile1<-subset(myfile,Survived==1) 
str(myfile1)
attach(myfile1)
#filtering the data by columns
titanic_names<-data.frame(Name,Survived)
head(titanic_names)
#data export
write.csv(titanic_names,"D:\\niit\\Big Data and R\\new content slides\\Day2\\output1.csv")
detach(myfile1)
#numerical data
myfile2<-read.csv("D:\\niit\\Big Data and R\\new content slides\\Day2\\pressure.csv")
summary(myfile2)
cor(myfile2)
plot(myfile2)



###################



attach(myfile)
mean(Age)
mean(Age,na.rm = TRUE)

Age<-na.omit(Age)
mean(Age)
median(Age)
detach(myfile)

#in order to eliminate all rows with NA
f1<-na.omit(myfile)
attach(f1)
mean(Fare)
median(Fare)

range(Age)
summary(Age)
summary(Fare)
 
detach(f1)

myfile2<-read.csv("D:\\niit\\Big Data and R\\new content slides\\Day2\\pressure.csv")
summary(myfile2)
plot(myfile2)
attach(myfile2)
cor(temperature,pressure)






