mpg
View(mpg)
library(dplyr)
#1
ggplot(mpg, aes(x=cty, y=hwy)) +
  geom_point(size=1, color='red') +
  ggtitle('도시연비와 고속도로연비 산점도')

#2
midwest
View(midwest)
midw <- filter(midwest, poptotal <= 500000 && popasian <= 10000)
options(scipen = 10)
ggplot(midw, aes(x=poptotal, y=popasian)) +
  xlim(0,500000) + ylim(0,10000)+
  geom_point(size=1, color='blue')+
  ggtitle('전체인구와 아시아인 인구간의 관계')

#3
avg_cty<-mpg %>%
  filter(class %in% c('suv')) %>%
  group_by(manufacturer) %>%
  summarise(average_cty = mean(cty)) %>%
  arrange(desc(average_cty))%>%
  head(5)
avg_cty
ggplot(avg_cty, aes(x=reorder(manufacturer, -average_cty),
  y=average_cty, fill=manufacturer)) +
  geom_col()
  

#4
mpg %>%
  group_by(class) %>%
  summarise(n=n())->fbar; fbar

ggplot(fbar, aes(x=reorder(class, -n), y=n, fill=class)) +
  geom_col()

#5
economics
View(economics)
ggplot(economics, aes(x=date, y=psavert)) + 
  geom_line(color="blue", size=1)+
  ggtitle("개인저축률 변화 추이")

#6
css<-mpg %>%
  filter(class %in% c('compact', 'subcompact','suv')) %>%
  group_by(class)
css
ggplot(css, aes(x=class, y=cty, fill=class)) +
  geom_boxplot()

#7-1
diamonds
View(diamonds)
ggplot(diamonds, aes(x=cut, fill=cut)) +
  geom_bar()

#7-2
avg_price <- diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price))
ggplot(avg_price, aes(x=reorder(cut, avg_price), y=avg_price, fill=cut)) +
  geom_col()+
  ggtitle('cut에 따른 가격의 변화')
'''
ggplot(diamonds, aes(x=cut, y=price, fill=cut)) +
  geom_boxplot()+
  ggtitle('cut에 따른 가격의 변화')
'''
#7-3
avg_colprice <- diamonds %>%
  group_by(color) %>%
  summarise(avg_colprice = mean(price))
ggplot(avg_colprice, aes(x=color, y=avg_colprice, fill=color)) +
  geom_col()->gcolor
ggplot(avg_price, aes(x=cut, y=avg_price, fill=cut)) +
  geom_col()->gcut
library(grid)
library(gridExtra)
grid.arrange(gcut, gcolor, ncol=2, top = "cut과 color에 따른 가격의 변화")
#grid.arrange: 하나로 합쳐주는
