car1 <-"aaa"; car1
var2 <- 111; var2
var3<-Sys.Date(); var3
var4 <- c("a", "b", "c"); var4
class(c("a", "b", "c"))
222 -> var5 -> var6
var5; var6
comp <-c(1, "2")
comp
num1 <-1
num2 <-2
num1+num2
char1<-"a"
num1+char1
num1;char1
seq1<-1:1000
seq1

date1<-seq(from=as.Date('2019-05-30'), to=as.Date('2019-11-08'), by=1)
date1
class(date1)

date2<-seq(from=as.Date('2019-05-30'), to=as.Date('2019-11-08'), by='month')
date2
date3<-seq(from=as.Date('2019-05-30'), to=as.Date('2029-11-08'), by='year')
date3
objects()
.hidden <-3 #environment 에 보이지않음!
.hidden
rm(var6) #변수를 지울수 있다.
ls()
rm(list=ls()) #리스트를 다지운다 대신 .hidden은 안지워짐
.hidden
