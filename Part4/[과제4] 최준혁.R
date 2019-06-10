mpg
View(mpg)
library(dplyr)
#1
plot(mpg$cty, mpg$hwy, xlim=c(0,50), ylim = c(0,50),
     xlab='cty', ylab = 'hwy', main=)
#2
midwest
View(midwest)
plot(midwest$poptotal<=500000, midwest$popasian<=10000, xlab='Poptotal', ylab = 'Popasian')

#3
mean_cty<-mpg %>%
  filter(class %in% c('suv')) %>%
  group_by(manufacturer) %>%
  summarise(average = mean(cty)) %>%
  arrange(desc(average))%>%
  head(5)
ggplot(mean_cty, aes(x=, y=))+
  geom_bar(stat= , fill=)

#4
library(plotrix)
mpg %>%
  group_by(class) %>%
  summarise(n=n())->forbar; forbar
go<-t(rbind(forbar)); go
colnames(go) <- c('2seater', 'compact', 'midsize','minivan','pickup','subcompact','suv')
gobar<-go[-1,]; gobar
barplot(as.matrix(gobar), main='자동차 종류별 수', beside=T, ylim=c(0,70),
          col=rainbow(nrow(go)))

#5
economics; View(economics)
ggplot(economics, aes(x=date, y=psavert)) + 
  geom_line(color="blue", size=2)+
  ggtitle("개인저축률 변화 추이")

#6
css<-mpg %>%
  filter(class %in% c('compact', 'subcompact','suv')) %>%
  group_by(class); css; View(css)

com_cty<-mpg %>%
  filter(class %in% c('compact')) %>%
  select(cty); com_cty
  
sub_cty<-mpg %>%
  filter(class %in% c('subcompact')) %>%
  select(cty); 

suv_cty<-mpg %>%
  filter(class %in% c('suv')) %>%
  select(cty);

par(mfrow=c(1,3))
boxplot(com_cty, col=c('red'), xlab='compact', ylab='cty')
boxplot(sub_cty, col=c('green'), xlab='subcompact', ylab='cty')
boxplot(suv_cty, col=c('blue'), xlab='suv', ylab='cty')

#7-1
diamonds
View(diamonds)

diacut<-diamonds %>%
  group_by(cut) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

ggplot(diacut, aes(x=count, y=reorder(cut,count)))+
  geom_point(size=6) +
  theme_bw()+
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color='red', linetype = 'dashed'))
#7-2
ggplot(diamonds, aes(x=cut, y=price, color=cut, group=cut, main='cut에 따른 가격의 변화'))+
  geom_line() +
  geom_point(size=1)
 
#7-3


