iris
View(iris)

setos<-subset(iris, Species=='setosa')
versi<-subset(iris, Species=='versicolor')
virg<-subset(iris, Species=='virginica')

#1
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
library(dplyr)
#2
aa<-iris %>%
  group_by(Species)%>%
  summarise_each(list(mean),Sepal.Length, Sepal.Width, Petal.Width, Petal.Length)
v1<-c()
v2<-
v3<-
  
barplot(aa, horiz=T)

#boxplot 12개 

                 