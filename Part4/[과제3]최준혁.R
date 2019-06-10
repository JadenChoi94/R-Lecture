iris
View(iris)

setos<-subset(iris, Species=='setosa')
versi<-subset(iris, Species=='versicolor')
virg<-subset(iris, Species=='virginica')

#1번
plot(setos$Sepal.Length, setos$Sepal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='sepal length', ylab = 'sepal width')

plot(setos$Petal.Length, setos$Petal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='Petal length', ylab = 'Petal width')

plot(versi$Petal.Length, versi$Petal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='Petal length', ylab = 'Petal width')

plot(versi$Sepal.Length, versi$Sepal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='sepal length', ylab = 'sepal width')

plot(virg$Petal.Length, virg$Petal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='Petal length', ylab = 'Petal width')

plot(virg$Sepal.Length, virg$Sepal.Width, xlim=c(0,9), ylim = c(0,9),
     xlab='sepal length', ylab = 'sepal width')

#2번==================================================================================
library(dplyr)
aa<-iris %>%
  group_by(Species)%>%
  summarise_each(list(mean),Sepal.Length, Sepal.Width, Petal.Width, Petal.Length)
aa
v1<-c(5.01, 3.43, 0.246, 1.46)
v2<-c(5.94, 2.77, 1.33, 4.26)
v3<-c(6.59, 2.97, 2.03, 5.55)

iri<-data.frame(setosa=v1, versicolor=v2, virginica=v3)  
iri
par(oma=c(0.5,0.5, 1.5, 0.5))
barplot(as.matrix(iri), main='평균치 비교', beside=T, col=rainbow(nrow(iri)), ylim=c(0,12))
legend('topright', c('Sepal.length','Sepal.width','Petal.width','Petal.length'),
       cex=0.8, fill=rainbow(nrow(iri)))

barplot(t(iri), main='평균치 비교',ylim=c(0,20), col=rainbow(length(iri)), space=0.1,
        cex.axis=0.8, las=1, names.arg=c('Sepal.length','Sepal.width','Petal.width',
        'Petal.length'), cex=0.8)
legend('topright', names(iri), cex=0.8, fill=rainbow(length(iri)))

#3번 boxplot 12개 ================================================================

b1<-iris %>%
  filter(Species=='setosa')%>%
  select(Sepal.Length); b1
b2<-iris %>%
  filter(Species=='setosa')%>%
  select(Sepal.Width)
b3<-iris %>%
  filter(Species=='setosa')%>%
  select(Petal.Length)
b4<-iris %>%
  filter(Species=='setosa')%>%
  select(Petal.Width)
b5<-iris %>%
  filter(Species=='versicolor')%>%
  select(Sepal.Length)
b6<-iris %>%
  filter(Species=='versicolor')%>%
  select(Sepal.Width)
b7<-iris %>%
  filter(Species=='versicolor')%>%
  select(Petal.Length)
b8<-iris %>%
  filter(Species=='versicolor')%>%
  select(Petal.Width)
b9<-iris %>%
  filter(Species=='virginica')%>%
  select(Sepal.Length)
b10<-iris %>%
  filter(Species=='virginica')%>%
  select(Sepal.Width)
b11<-iris %>%
  filter(Species=='virginica')%>%
  select(Petal.Length)
b12<-iris %>%
  filter(Species=='virginica')%>%
  select(Petal.Width)


boxplot(b1, col=c('blue'), xlab='setosa', ylab='Sepal.Length')
boxplot(b2, col=c('blue'), xlab='setosa', ylab='Sepal.Width')
boxplot(b3, col=c('blue'), xlab='setosa', ylab='Petal.Length')
boxplot(b4, col=c('blue'), xlab='setosa', ylab='Petal.Width')
boxplot(b5, col=c('yellow'), xlab='versicolor',ylab='Sepal.Length')
boxplot(b6, col=c('yellow'), xlab='versicolor',ylab='Sepal.Width')
boxplot(b7, col=c('yellow'), xlab='versicolor',ylab='Petal.Length')
boxplot(b8, col=c('yellow'), xlab='versicolor',ylab='Petal.Width')
boxplot(b9, col=c('pink'), xlab='virginica',ylab='Sepal.Length')
boxplot(b10, col=c('pink'), xlab='virginica',ylab='Sepal.Width')
boxplot(b11, col=c('pink'), xlab='virginica',ylab='Petal.Length')
boxplot(b12, col=c('pink'), xlab='virginica',ylab='Petal.Width')


