#very basic plot
values <- c(1, 3, 6, 4, 9)
plot(values) #scatter plot

#line chart
# Graph  using blue points overlayed by a line 
plot(values, type="o", col="blue")
?plot
# Create a title with a red, bold/italic font
plot(values, type="o", col="blue",main="First plot", col.main="red", font.main=4)
#title(main="First plot", col.main="red", font.main=4)

# Label the x and y axes with dark green text
plot(values, type="o", col="blue",main="First plot", col.main="red", font.main=4,xlab="Days", col.lab=rgb(0,0.5,0),ylab="Total", col.lab=rgb(0,0.5,0))

#title(xlab="Days", col.lab=rgb(0,0.5,0))
#title(ylab="Total", col.lab=rgb(0,0.5,0))

df<-data.frame(names=c(3,5,7),values=c(10,20,30) ) 
print(df)
plot(df)
df1<-data.frame(names=c(3,5,7),values=c(10,20,30),age=c(200,300,400) )
plot(df1)
df1
plot(df1$names,df1$values)
plot(df1$names,df1$values, type="o", col="blue",main="Data Frame plot", col.main="red", font.main=4,xlab="Names", col.lab=rgb(0,0.5,0),ylab="Values", col.lab=rgb(0,0.5,0))

mydata1<-read.csv("D:/niit/Big Data and R/new content slides/Day2/pressure.csv")
plot(mydata1)


#class exercise1
#create a data frame consisting of Presure and temperature columns
#Presure column have the following values -  50 to 500 in steps of 50
#Temperature column has the foll. values - 10 to 50 in steps of 5 
#i.plot a very basic graph
#ii. Add a title = " P-T graph" and label the x and y axis with 
# "Pressure" and "Temperature"


#barplot - very basic
barplot(values)


barplot(names.arg =df$names,df$values,main="first bar graph",xlab="name",ylab="height")


#pie charts
mysentimentpie <- c(20,50,30)

pie(mysentimentpie)
names(mysentimentpie)=c("Neutral","Positive","Negative")
pie(mysentimentpie)


#box plot
##data import 
myfile<-read.csv("D:\\niit\\Big Data and R\\new content slides\\day4\\titanic.csv")

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
#visualize Age information
boxplot(Age)
#get the quantiles - min, first quartile, median, third quartile and max 
quantile(Age,probs=c(0,.25,.5,.75,1))
range(Age)
#check the distribution
hist(Age)
#outliers
#inter quartile range Q3-Q1

IQR<-38-20.125
IQR
1.5*IQR
#1.5 times IQR
outlier1<-20.125-1.5*IQR
outlier2<-38+1.5*IQR
outlier1
outlier2
summary(Age)


detach(f1)

##


#data visualization with ggplot 
#install.packages("ggplot2")
library(ggplot2)
df
#basic command
ggplot(data=df,aes(x=names,y=values))+geom_point()

#plot with parameters
ggplot(data=df,aes(x=names,y=values))+geom_point()+
  ggtitle("My first ggplot")+
  xlab("Patient Name")+
  ylab("Patient height")
#bar chart
ggplot(data=df,aes(x=names,y=values))+geom_bar(stat = "identity",fill="skyblue")+
  ggtitle("ggplot")+
  xlab("Patient Name")+
  ylab("Patient height")
###

mycars<-mtcars
mtcars
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()
p + geom_point(aes(colour = factor(cyl)))
p + geom_point(aes(shape = factor(cyl)))
p + geom_point(aes(size = qsec))
# Change scales
p + geom_point(aes(colour = cyl)) + scale_colour_gradient(low = "blue")
p + geom_point(aes(shape = factor(cyl))) + scale_shape(solid = FALSE)
####

#Exercise2
#use the mtcar data and plot the following using ggplot
#basic plot of the wt column
#Add a main title "Car weight" and label the y axis "weight"
#use the same data and plot disp vs wt
#add x- label "displacement" and y-label "weight"
p <- ggplot(mtcars, aes(wt, disp))
p + geom_point()+ggtitle("Car weight") +  xlab("displacement")+ ylab("weight")
#p + geom_point(aes(colour = factor(cyl)))+ggtitle("Car weight") +  xlab("displacement")+ ylab("weight")
###





#spatial visualization
#install.packages("maps")
library(maps)

ggplot()+borders(database="world")+ggtitle("base world map")
#lets plot the airports in USA
ggplot()+borders(database="usa")+ggtitle("base USA map")
usairports<-read.csv("D:\\niit\\Big Data and R\\new content slides\\day4\\airports.csv")
head(usairports)
ggplot(
  data=usairports)+
  borders(
    database="usa"
  )+
  geom_point(aes(
    x=longitude,
    y=latitude
  ))
 
#us airports on world map 
ggplot(
  data=usairports)+
  borders(
    database="world"
  )+
  geom_point(aes(
    x=longitude,
    y=latitude
  ))
#how to get help

?aes
?par
?geom_bar

