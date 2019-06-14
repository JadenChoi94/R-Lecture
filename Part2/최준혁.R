#1
vec1<-c(1:6)
vec2<-c(10:5)
vec3<-rep(1:3, each=2)
vec4<-rep(1:3,2)
vec5<-seq(1,11,2)

#2
이름<-c('강경학','김태균','이성열','정은원')
중간<-c(90,78,94,70)
기말<-c(50,60,90,92)
df_score<-data.frame(이름, 중간, 기말)
df_score<-cbind(df_score, 평균=(중간+기말)/2)

#3
df_score<-cbind(df_score, 학점=c('C','D','A','B'))
df_score

#4
a <- 0 
oddSum<-function(x){
  for(x in 1:x){
    if(x%%2==1){
      print(a<- a+x)
    }
  }
}
oddSum(100)

#5
library(dplyr)
iris
iris_setosa <- filter(iris, Species == 'setosa')
boxplot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
        iris_setosa$Petal.Length, iris_setosa$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Setosa 이상치 제거 전')

sort(iris_setosa$Sepal.Width, decreasing = T)
sort(iris_setosa$Petal.Length, decreasing = T)
sort(iris_setosa$Petal.Width, decreasing = T)
iris_setosa$Sepal.Width <- ifelse(iris_setosa$Sepal.Width < 2.5, NA, iris_setosa$Sepal.Width)
iris_setosa$Petal.Length <- ifelse(iris_setosa$Petal.Length < 1.1, NA, iris_setosa$Petal.Length)
iris_setosa$Petal.Width <- ifelse(iris_setosa$Petal.Width >0.4, NA, iris_setosa$Petal.Width)

boxplot(iris_setosa$Sepal.Length, iris_setosa$Sepal.Width,
        iris_setosa$Petal.Length, iris_setosa$Petal.Width,
        col=c('red','yellow','green','blue'),
        names=c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
        main='Setosa 이상치 제거 후')
#6
mpg_new <- mpg %>%
  mutate(cty_hwy = cty + hwy)

mpg %>%
  select(-displ:-drv) %>%
  mutate(cty_hwy = cty + hwy, ch_avg = cty_hwy/2) %>%
  arrange(desc(ch_avg)) %>%
  head(3)

#7-1
df_suv <- mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(7)
df_suv
#7-2
ggplot(df_suv, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty,
                   fill=manufacturer)) +
  geom_col()

#8-1
diamonds
ggplot(diamonds, aes(x=clarity, fill=clarity)) +
  geom_bar()
#8-2
df_cut <- diamonds %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price))
ggplot(df_cut, aes(x=clarity, y=mean_price, fill=clarity)) +
  geom_col()

#9-1
setwd('D:/Workspace/R_Data_Analysis/Part2/Stage3_StructuredData/Baseballplayer')
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(extrafont)
windowsFonts(malgun = "맑은 고딕")
theme_update(text = element_text(family = "malgun"))

bb <- read.csv('야구성적.csv')
str(bb) #df
bb <- bb %>%
  mutate(OPS=출루율+장타율, 연봉대비OPS=OPS/연봉*100) 

ggplot(bb, aes(x=선수명, y=연봉대비OPS, fill=선수명)) +
  geom_bar(stat='identity') 

#9-2
palete = c(brewer.pal(12, 'Paired'), 
           brewer.pal(12, 'Paired'), '#56B4E9')
mean_ops_per_income = mean(bb$연봉대비OPS)

ggplot(bb, aes(x=선수명, y=연봉대비출루율)) +
  geom_bar(stat='identity', color=palete, fill=palete) +
  geom_text(aes(y=연봉대비출루율+0.8, label=연봉대비출루율), 
            color="black", size=3) + 
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) + 
  ggtitle('프로야구선수 밥값은 하고 있나?') + 
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=mean_ops_per_income, 
             color='red', linetype = 'dashed', size=0.5) 
