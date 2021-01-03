library(datasets)
library(dplyr)
mydata<-mtcars
head(mydata)

plot(mydata)
plot(mydata$disp,mydata$wt)
plot(mydata$cyl,mydata$disp)
plot(mydata$hp,mydata$wt)
#cluster with all columns
mycluster<-kmeans(mydata,3)
mycluster$size
#mynewdata<-mydata%>%select(disp,wt)
#plot(mynewdata,col=mycluster$cluster)
plot(mydata$disp,mydata$wt,col=mycluster$cluster)
table(mydata$cyl,mycluster$cluster)

#with 2 column
mydata1<-mydata%>%select(disp,wt)
mycluster1<-kmeans(mydata1,3)
mycluster1$size
mycluster1$centers
plot(mydata1,col=mycluster1$cluster)
points(mycluster1$centers,col="blue",pch=5)
table(mydata$cyl,mycluster1$cluster)

#let us try with k =4
mydata1<-mydata%>%select(disp,wt)
mycluster2<-kmeans(mydata1,4)
mycluster2$size
mycluster2$centers
plot(mydata1,col=mycluster2$cluster)
points(mycluster2$centers,col="blue",pch=5)
table(mydata$cyl,mycluster2$cluster)
#how to determine k
#elbow method
mycluster$withinss
mycluster$totss
mycluster$betweenss

kmeans(mydata1,2,nstart=10)$tot.withinss
kmeans(mydata1,3,nstart=10)$tot.withinss
kmeans(mydata1,4,nstart=10)$tot.withinss
kmeans(mydata1,5,nstart=10)$tot.withinss



#n=10
TW=numeric(15)
for(i in 1:15)
{
  TW[i] = kmeans(mydata1,i)$tot.withinss
}
plot(TW,type="l",col="red")

