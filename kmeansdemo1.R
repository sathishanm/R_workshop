#first simple demo of K-means clustering
#using iris data
data("iris")
mydata<-iris
head(mydata)
sepal<-mydata[ , 1:2]

plot(sepal)
petal<-mydata[ ,3:4]
plot(petal)

# Create Cluster with k = 2
result <- kmeans(petal,centers = 2)
result
result$size
result$centers
points(result$centers,col="red",pch=2)
result$cluster
resultdf<-cbind(petal,cluster=result$cluster)
resultdf
resultdf<-cbind(resultdf,species=mydata$Species)
resultdf
table(resultdf$species,resultdf$cluster)
#now lets repeat this with k =3
plot(petal)
result <- kmeans(petal,centers = 3)
result
result$size
result$centers
points(result$centers,col="red",pch=2)
result$cluster
resultdf<-cbind(petal,cluster=result$cluster)
resultdf
resultdf<-cbind(resultdf,species=mydata$Species)
resultdf
table(resultdf$species,resultdf$cluster)
plot(resultdf$Petal.Length,resultdf$Petal.Width,col=resultdf$cluster)
points(result$centers,col="black",pch=2)


