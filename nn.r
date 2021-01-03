#nn
set.seed(500)
library(MASS)
data <- Boston
apply(data,2,function(x) sum(is.na(x)))

#nn
library(neuralnet)
n <- names(data)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
nn <- neuralnet(f,data=data,hidden=c(5,3),linear.output=T)
plot(nn)

pr.nn <- compute(nn,data[,1:13])

pr.nn_ <- pr.nn$net.result*(max(data$medv)-min(data$medv))+min(data$medv)
test.r <- (data$medv)*(max(data$medv)-min(data$medv))+min(data$medv)

MSE.nn <- sum((test.r - pr.nn_)^2)/nrow(data)
#lets use logistic regression also
lm.fit <- glm(medv~., data=data)
summary(lm.fit)
pr.lm <- predict(lm.fit,data)
MSE.lm <- sum((pr.lm - data$medv)^2)/nrow(data)


#we then compare the two MSEs

print(paste(MSE.lm,MSE.nn))

