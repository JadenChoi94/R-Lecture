#Function
# 물음표?는 help 기능
vec1<-c(1:5)
vec2<-c('a','b','c','d','e')
max(vec1)
max(vec2)
meac(vec1)
mean(vec2) #NA
sd(vec1)
sum(vec1)
var(vec1)

library(googleVis)
Fruits
aggregate(Sales~Year, Fruits, mean)#연도별
aggregate(Sales~Year, Fruits, sum)
aggregate(Sales~Year, Fruits, max)
aggregate(Sales~Fruit, Fruits, sum) #품목별 
mat1<-matrix(c(1:6), nrow = 2, byrow=T); mat1
apply(mat1, 1, sum)   #행 단위계산
apply(mat1, 1, prod)
apply(mat1, 2, sum)   #열 단위
apply(mat[,c(2,3)], 1, sum)

list1 <-list(Fruits$Sales); list1
list2 <-list(Frius$Profit); list2
laspply(c(list, list2), max)           
laspply(c(list, list2), max)
apply(c(list1, list2, max())
lapply(,c(4,5) max)
tapply(Sales, Fruit, sum)
attach(Fruits)       
tapply(Sales, Tear, sum)
vec1<-c(1:5)
vec2<-seq(10,50,10)
vec3-seq(100, 200, 100)

#======================연습문제========================
data1<-read.csv("data1.csv")
data1
apply(data1[,c(2:15)],2,sum)
apply(data1[,-1],1,sum)

data2<-read.csv("1-4호선승하차승객수.csv")
data2
aggregate(승차~노선번호, data2, sum)
aggregate(하차~노선번호, data2, sum)
apply(data2[,c(3,4)],2,sum)
aggregate(하차+승차~노선번호, data2, sum)
attach(data2)
tapply(승차, 노선번호, sum)
tapply(하차, 노선번호, sum)
sapply(data2[,c(3,4)],sum)
