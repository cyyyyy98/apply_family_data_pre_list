setwd("./Weather Data")

Chicago <- read.csv("Chicago-F.csv")
Chicago

Chicago <- read.csv("Chicago-F.csv", row.names=1)
Houston <- read.csv("Houston-F.csv", row.names=1)
NewYork <- read.csv("NewYork-F.csv", row.names=1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names=1)

Chicago
Houston
NewYork
SanFrancisco

is.data.frame(Chicago) #True

#convert to matrix
Chicago <- as.matrix(Chicago)
Houston <- as.matrix(Houston)
NewYork <- as.matrix(NewYork)
SanFrancisco <- as.matrix(SanFrancisco)

#pull all into list
Weather <- list(Chicago,Houston,NewYork,SanFrancisco)
Weather

Weather <- list(Chicago=Chicago,Houston=Houston,NewYork=NewYork,SanFrancisco=SanFrancisco)
Weather

#apply()
?apply
apply(Chicago, 1, mean)

is.matrix(Chicago) #True
is.list(Weather) #True

#apply function with loops
#1. via loops
output <- NULL
for(i in 1:5){
  output[i] <- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)

#2. via apply function
apply(Chicago, 1, mean)

#lappy()
?lapply
#1.
t(Chicago)
lapply(Weather, t) #list(t(Weather$Chicago),t(Weather$Houston),t(Weather$NewYork),t(Weather$SanFrancisco))
newlist <- lapply(Weather, t)
newlist

#2.
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)

#3.
?rowMeans
lapply(Weather, rowMeans)

#lapply with []
Weather$Chicago[1,1]
Weather[[1]][1,1]

lapply(Weather,"[",1,1)

#add own functions
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[,6])
lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#sapply() - s - simplify=True
?sapply
Weather

#AvgHigh_F for Jul:
lapply(Weather,"[",1,7)
sapply(Weather,"[",1,7)

#AvgHigh_F for 4th quarter:
lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)

#example
lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans),2)

#example
lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))
sapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#nesting apply functions
apply(Chicago,1,max)
lapply(Weather,apply,1,max)
lapply(Weather,function(x) apply(x,1,max))

#tidy up
sapply(Weather,apply,1,max)
sapply(Weather,function(x) apply(x,1,max))

#which.max() which.min()
?which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#by the sound of it:
#we will have: apply - to iterate over rows of the matrix
#and lapply or sapply - to iterate over components of the list
apply(Chicago, 1, function(x) names(which.max(x)))
lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
