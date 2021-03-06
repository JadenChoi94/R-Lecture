#ggplot2
install.packages('ggplot2')
library(ggplot2)
setwd("d:/Workspace/R_Data_Analysis/Part4/data")
korean<-read.table("학생별국어성적_new.txt", header=T, sep=',')
korean
ggplot(korean, aes(x=이름, y=점수))+
  geom_point() #계속옵션들 + + 가능, positional argument
ggplot(mapping= aes(x=이름, y=점수), data=korean)+
  geom_point()                    # keyword argument
ggplot(korean, aes(x=이름, y=점수))+
  geom_bar(stat='identity')
ggplot(korean, aes(x=이름, y=점수))+
  geom_bar(stat='identity', fill='green', colour='red')
gg<-ggplot(korean, aes(x=이름, y=점수))+
  geom_bar(stat='identity', fill='green', colour='red')
gg+theme(axis.text.x=element_text(angle=45, hjust = 1,vjust = 1, color='blue', size=8))
#===========================================================================================
score_kem<-read.csv('학생별과목별성적_국영수_new.csv', header=T); score_kem
library(dplyr)
sort_kem<-arrange(score_kem, 이름, 과목); sort_kem #가나다 순으로 정렬렬
#sort_kem2<-ddply(sort_kem, '이름', transform, 누적합계=cumsum(점수)); sort_kem2

sort_kem2 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수))
sort_kem2
# sort_kem3 <- ddply(sort_kem2,"이름",transform,누적합계=cumsum(점수),
#                    label=cumsum(점수)-0.5*점수)
sort_kem3 <- sort_kem2 %>%
  group_by(이름) %>%
  mutate(label=cumsum(점수)-0.5*점수)
sort_kem3

sort_kem4 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수)) %>%
  mutate(label=cumsum(점수)-0.5*점수)
sort_kem4
sort_kem5 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수), label=cumsum(점수)-0.5*점수)
sort_kem5
ggplot(sort_kem5, aes(x=이름, y=점수, fill=과목)) + 
  geom_bar(stat="identity") +
  geom_text(aes(y=label, label=paste(점수,'점')), colour="black",
            size=4)

ggplot(sort_kem5, aes(x=이름, y=점수, fill=과목)) + 
  geom_bar(stat="identity") +
  geom_text(aes(y=label, label=paste(점수,'점')), colour="black",
            size=4) +
  # guides(fill=guide_legend(reverse=T)) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8))

score <- read.table("학생별전체성적_new.txt",header=T,sep=",")
score
score_eng <- score[, c('이름','영어')]
ggplot(score, aes(x=영어, y=reorder(이름,영어))) +
  geom_point(size=4) +
  theme_classic() +
  theme(panel.grid.major.x=element_blank( ) ,
        panel.grid.minor.x=element_blank( ) ,
        panel.grid.major.y=element_line(color="red",
                                        linetype="dashed"))

ggplot(score, aes(x=영어, y=reorder(이름,영어))) + 
  geom_segment(aes(yend=이름), xend=0, color="blue") +
  geom_point(size=6, color="green") +
  theme_bw() +
  theme(panel.grid.major.y=element_blank())
#===============================================================================
#geom_segment()

score<-read.table('학생별전체성적_new.txt', header=T, sep=','); score
score[,c('이름','영어')]

ggplot(score, aes(x=영어, y=reorder(이름, 영어)))+
  geom_point(size=6, color='green')+
  theme_bw()+
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color='red', linetype='dashed'))

ggplot(score, aes(x=영어, y=reorder(이름, 영어)))+
  geom_segment(aes(yend=이름), xend=0, color='blue')+
  geom_point(size=6, color='green')+
  theme_bw()+
  theme(panel.grid.major.y= element_blank()) 

#scastterplots

install.packages('gridExtra')
library(gridExtra)
mtcars
ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point(color='blue')->graph2
#종류별로 다른색상 지정
ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point(color='blue')+
  geom_point(aes(color=factor(am)))->graph3
#크기지정
graph4<-ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point(aes(color=factor(am)), size=5); graph4
#값별로 다른 크기 지정
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(color=factor(am), size=wt))
#종류별로 크기와 모양지정
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(wt)))
#종류별로 크기, 모양, 색상 지정
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(aes(shape=factor(am), color=factor(am), size=wt)) +
  scale_color_manual(values=c('red','green'))
#선추가
ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(color='red') +
  geom_line()
#x축과 y축 이름 바꾸기

ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point(color='blue') +
  labs(x='마력', y='연비(mile/gallon)')
 # par(oma(2,2,2,2,))

three<-read.csv('학생별과목별성적_3기_3명.csv', header=T)
three
sort_score<-arrange(three, 이름, 과목); sort_score
ggplot(sort_score, aes(x=과목, y=점수, color=이름, group=이름, fill=이름))+
  geom_line()+
  geom_point(size=4, shape=22) +
  ggtitle('학생별 과목별 성적' )

dis<-read.csv('1군전염병발병현황_년도별.csv', stringsAsFactors=F); dis
str(dis)
ggplot(dis, aes(x=년도별, y=장티푸스, group=1))+
  geom_line()
ggplot(dis, aes(x=년도별, y=장티푸스, group=1))+
  geom_area(color='red', fill='cyan', alpha=0.4)+
  geom_line()
ggplot(dis, aes(x=년도별, y=장티푸스, group=1))+
  geom_area(fill='cyan', alpha=0.4)+
  geom_line(color='blue')

