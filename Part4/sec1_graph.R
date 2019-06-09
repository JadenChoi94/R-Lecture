#그래픽
setwd("d:/Workspace/R_Data_Analysis/Part4/")
var1<-1:5
plot(var1)
var1<-10:1
plot(var1)
var2<-c(2,2,2)
plot(var2)
x<-1:3
y<-4:2
plot(x,y)
plot(x,y, xlim=c(0,5), ylim=c(0,5))
plot(x,y, xlim=c(0,5), ylim=c(0,5), xlab = "X축", ylab="Y축값", main='Plot Test')
#-------------------------------------------------------------------------------------
v1<-c(100,130,120,160,150)
par(oma=c(1.5, 2, 1.5, 0.5))
par(mgp=c(3.5,1,0.5))

plot(v1, type='o', col='red', ylim=c(50,200), axes=TRUE, ann=TRUE)
axis(1,at=1:5, lab=c('MON','TUE','WED','THU','FRI'))
axis(2,ylim=c(0,200))
title(main='FRUIT', col.main='red', font.main=4)
title(xlab='DAY', col.lab='black')
title(ylim='PRICE', col.lab='blue')
#------------------------------------------------------------
v1<-c(100,130,120,160,150)
par(mfrow=c(2,4))
plot(v1, type='o')
plot(v1, type='s')
plot(v1, type='l')
#------------------------------------------------------------
v1<-c(100,130,120,160,150)
par(mfrow=c(1,3))
pie(v1)
plot(v1, type='o')
barplot(v1)
#------------------------------------------------------------
par(mfrow=c(1,1))
a<-c(1,2,3)
plot(a,xlab='aaa')
par(mgp=c(0,1,0)) #제목위치, 지표값, 지표선위치 순입니다.
plot(a,xlab='aaa')
par(mgp=c(3,1,0))
par(mgp=c(3,2,0))
par(oma=c(2,1,0,0)) #여백조절
plot(a, xlab='aaa') 
par(oma=c(0,2,0,0))
#------------------------------------------------------------------------
v1<-c(1,2,3,4,5)
v2<-c(5:1)
v3<-c(3:7)
plot(v1, type='s', col='red', ylim=c(1,10))
par(new=T) #중복허용부분
plot(v2, type='o', col='blue', ylim=c(1,10))
par(new=T)  #중복허용부분
plot(v3, type='l', col='green', ylim=c(1,10))
legend(4,9,c('v1','v2','v3'), cex=0.9, col=c('red','green','blue'), lty=1)

x<-1:5
barplot(x, horiz=T)
x<-matrix(c(5,4,3,2), nrow=2)
barplot(x, beside=T)
barplot(x, beside=T, names=c(5,3))
barplot(x, beside=T, names=c(5,3), col=c('green','yellow'))
barplot(x, beside=T, names=c(5,3), col=c('green','yellow'), horiz=T)
par(oma=c(1,0.5, 1, 0.5)) #하 좌 상 우 여백 지정
barplot(x, names=c(5,3), col=c('green','yellow'), horiz=T, xlim=c(0,10))
#--------------------------------------------------------------------------------
par(oma=c(0,0,0,0))
v1<-c(100, 120, 140, 160, 180)
v2<-c(120, 130, 150, 140, 170)
v3<-c(140, 170, 120, 110, 160)
qty<-data.frame(BANANA=v1, cherry=v2, orange=v3)
qty
barplot(as.matrix(qty), main="Fruits's Sales QTY",
        beside=T, col=rainbow(nrow(qty)), ylim=c(0,400))
legend(14, 400, c('MON','TUE','WED','THU','FRI'), cex=0.8,
       fill=rainbow(nrow(qty)))
#-----------------------------------------------------------------------------------
barplot(t(qty), main="Fruits's Sales QTY", ylim=c(0,900),
        col=rainbow(length(qty)), space=0.1, cex.axis=0.8, las=1,
        names.arg=c('MON','TUE','WED','THU','FRI'), cex=0.8)
legend(0.2, 800, names(qty), cex=0.7, fill=rainbow(length(qty)))

#---------------------------------------------------------------------------------------
peach<-c(180, 200, 250,198,170)
color<-c()
for (i in 1:length(peach)){
  if(peach[i]>=200)
    color<-c(color, 'red')
  else if(peach[i]>=180)
    color<-c(color, 'yellow')
  else
    color <-c(color, 'green')
}
barplot(peach, main="peach sales qty", names.arg=c("MON","TUE","WED","THU","FRI"),
        col=color)
#---------------------------------------------------------------------------------------
height<-c(182, 175, 167, 128, 127, 178, 159, 155, 163, 172)
par(mfrow=c(1,2))
barplot(height, main='barplot of height')
hist(height)
#---------------------------------------------------------------------------------------
par(mfrow=c(1,1), oma=c(0.5, 0.5, 0.1, 0.1))
p1<-c(10,20,30,40)
pie(p1, radius=1)
pie(p1, radius=1, init.angle=90)
pie(p1, radius=1, init.angle=90, col=rainbow(length(p1)), label=c('week1','week2','week3','week4'))
#============수치값 달기===========================================================================
pct<-round(p1/sum(p1)*100,1)
lab<-paste(pct,'%')
pie(p1, radius=1, init.angle=90, col=rainbow(length(p1)), label=lab)
legend(1,1,c('week1','week2','week3','week4'), cex=0.5, fill=rainbow(length(p1)))
#===========범례를 생략하고 출력==================================================================
pct<-round(p1/sum(p1)*100,1)
lab1<-c('week1','week2','week3','week4')
lab2<-paste(lab1,'\n',pct,'%')
pie(p1, radius=1,init.angle=90, col=rainbow(length(p1)), label=lab2)

install.packages('plotrix')
library(plotrix)

p1<-c(10,20,30,40,50)
f_day<-round(p1/sum(p1)*100,1)
f_label<-paste(f_day,'%')
pie3D(p1, main="3D Pie Chart", col=rainbow(length(p1)),cex=0.5, label=f_label, explode = 0.05)
legend(0.5, 1, c("MON","TUE","WED","THU","FRI"), cex=0.6, fill=rainbow(length(p1)))

#===============================boxplot() 중요!!=======================================
v1<-c(10,12,15,11,20)
v2<-c(5,7,15,8,9)
v3<-c(11,20,15,18,13)
boxplot(v1,v2,v3)
boxplot(v1,v2,v3, col=c('blue','yellow','pink'), names=c('blue','yellow','pink'), horizontal = T)
#===============================관계도===================================================
install.packages("igraph")
library(igraph)
g1<-graph(c(1,2, 2,3, 2,4, 1,4 ,5,5, 3,6))
plot(g1)
str(g1)

name<-c('서진수','일부장',' 김과장',' 손대리','노대리','이부장','신대리','강부장','광과장','정대리','유과장')
pemp<-c('서진수','서진수','일부장','김과장','김과장','서진수','이부장','유과장','서진수','강부장','광과장')
emp<-data.frame(이름=name, 상사이름=pemp)
emp
str(emp)

g<-graph.data.frame(emp, directed = T)
plot(g,layout=layout.fruchterman.reingold, vertex.size=36, edge.arrow.size=10)
#================================================================================================
install.packages('devtools')
library(devtools)
install.packages('d3Network')
library(d3Network)

g<-read.csv('군집분석.csv', head=T)
graph<-data.frame(학생=g$학생, 교수=g$교수)
g<-graph.data.frame(graph, directed = T)
plot(g,layout=layout.fruchterman.reingold, vertex.size=2, edge.arrow.size=0.5,
     vertex.color='green', vertex.label=NA)

#모양 바꾸기
plot(g,layout=layout.kamada.kawai, vertex.size=2, edge.arrow.size=0.5,
     vertex.color='green', vertex.label=NA)
#학생과 교수의 색상 크기를 구분
library(stringr)
V(g)$name
gubun1<-V(g)$name
gubun1
gubun<-str_sub(gubun1, start=1, end=1)
gubun
#학생은 레드로 교수는 그린으로
color<-c()
sizes<-c()
for (i in 1:length(gubun)){
  if(gubun[i]=='S'){
    colors<-c(color,'red')
    sizes<-c(sizes, 2)}
  else {
    colors<-c(colors,'green')
    sizes<-c(sizes, 6)}
}
plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0.5,
     vertex.color=colors)  
plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0.5,
     vertex.color=colors, vertex.label=NA) 
plot(g, layout=layout.fruchterman.reingold, vertex.size=sizes, edge.arrow.size=0,
     vertex.color=colors, vertex.label=NA) 
plot(g, layout=layout.kamada.kawai, vertex.size=sizes, edge.arrow.size=0,
     vertex.color=colors, vertex.label=NA) 
#----------------------------------------------------------------------------------------
shapes<-c()
for(i in 1:length(gubun)) {
  if(gubun[i]=='S'{
    shapes<-c(shapes,'circle')}
    else {
      shapes<-c(shapes, 'square')}
}
plot(g, layout=layout.kamada.kawai, vertex.size=sizes, edge.arrow.size=0,
     vertex.color=colors, vertex.shape=shapes, vertex.color=colors)
#메르스 환자
virus1<-read.csv('메르스전염현황.csv', header=T)
d3SimpleNetwork(virus1, width=600, heigh=600, file='graph/mers.html')
